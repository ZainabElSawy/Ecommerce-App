import 'package:ecommerce_app/core/constant/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/imageassets.dart';

// ignore: must_be_immutable
class CustomTextFormAuth extends StatefulWidget {
  final bool isPassword;
  final String hintText;
  final String labelText;
  final TextEditingController? myController;
  final bool isNumber;
  String? Function(String?)? valid;
  CustomTextFormAuth({
    Key? key,
    this.isPassword = false,
    required this.hintText,
    required this.labelText,
    this.isNumber = false,
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
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.labelText,
              style: Styles.textStyleRegular12,
            ),
          ],
        ),
        SizedBox(height: 6.h),
        TextFormField(
          obscureText: widget.isPassword ? isObsecured : false,
          keyboardType: widget.isNumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: widget.valid,
          controller: widget.myController,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            hintStyle: Styles.textStyleRegular12.copyWith(color: AppColor.grey),
            suffixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        isObsecured = !isObsecured;
                        setState(() {});
                      },
                      icon: ImageIcon(
                        AssetImage(
                          isObsecured
                              ? AppImageAsset.imagesEye
                              : AppImageAsset.imagesEyeOff,
                        ),
                        color: AppColor.black,
                        size: 23.sp,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        isObsecured = !isObsecured;
                        setState(() {});
                      },
                      icon: ImageIcon(
                        AssetImage(
                          isObsecured
                              ? AppImageAsset.imagesEye
                              : AppImageAsset.imagesEyeOff,
                        ),
                        color: AppColor.white,
                        size: 23.sp,
                      ),
                    ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.r),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.w),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.r),
              borderSide:
                  BorderSide(color: AppColor.lightGreyColor, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColor.brownPrimaryColor, width: 1.w),
              borderRadius: BorderRadius.circular(25.r),
            ),
          ),
        ),
      ],
    );
  }
}
