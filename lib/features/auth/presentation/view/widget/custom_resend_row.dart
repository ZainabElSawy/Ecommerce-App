import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/forget_password_cubit/forget_password_cubit.dart';
import 'custom_resend_button.dart';
import 'custom_resend_counter.dart';

class CustomResendRow extends StatefulWidget {
  const CustomResendRow({
    Key? key,
    required this.userEmail,
  }) : super(key: key);
  final String userEmail;
  @override
  State<CustomResendRow> createState() => _CustomResendRowState();
}

class _CustomResendRowState extends State<CustomResendRow> {
  late Timer _timer = Timer(Duration.zero, () {});
  int _start = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  String get timerString {
    Duration duration = Duration(seconds: _start);
    return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ResendCounter(
          counter: timerString,
          enabled: _start <= 59 && _start > 0 ? false : true,
        ),
        CustomResendButton(
            enabled: _start <= 59 && _start > 0 ? false : true,
            onTap: () {
              context
                  .read<ForgetPasswordCubit>()
                  .resendOTP(userEmail: widget.userEmail);
              setState(() {
                _start = 59;
              });
              startTimer();
            }),
      ],
    );
  }
}
