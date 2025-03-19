import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final void Function()? onPressed;
//   const CustomButton({
//     Key? key,
//     required this.text,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
//       child: MaterialButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         padding: const EdgeInsets.symmetric(vertical: 5),
//         onPressed: onPressed,
//         color: AppColor.primarycolor,
//         textColor: Colors.white,
//         child: Text(
//           text,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25.r),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.brownPrimaryColor,
          borderRadius: BorderRadius.circular(25.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
