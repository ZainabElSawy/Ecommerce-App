import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';

// ignore: must_be_immutable
class CustomTextFormAuth extends StatefulWidget {
  final bool isPassword;
  final String hintText;
  final String labelText;
  final IconData? iconData;
  final TextEditingController? myController;
  final bool isNumber;
  String? Function(String?)? valid;
  CustomTextFormAuth({
    Key? key,
    this.isPassword = false,
    required this.hintText,
    required this.labelText,
    this.iconData,
    this.isNumber=false,
    this.valid,
    this.myController,
  }) : super(key: key);

  @override
  State<CustomTextFormAuth> createState() => _CustomTextFormAuthState();
}

class _CustomTextFormAuthState extends State<CustomTextFormAuth> {
  bool isObsecured = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        obscureText: widget.isPassword ? isObsecured : false,
        keyboardType: widget.isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: widget.valid,
        controller: widget.myController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 14, fontFamily: "normal"),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isObsecured = !isObsecured;
                    setState(() {});
                  },
                  icon: Icon(
                      isObsecured ? Icons.visibility : Icons.visibility_off),
                )
              : Icon(widget.iconData),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: const TextStyle(color: AppColor.primarycolor),
          label: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(widget.labelText),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColor.primarycolor, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
