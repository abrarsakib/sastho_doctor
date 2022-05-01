import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomNumberFormField extends StatelessWidget {
  String? hintText;
  final String labelText;
  final TextEditingController textEditingController;
  final TextInputType inputType;
  double? fieldHeight;
  int? maxline;
  CustomNumberFormField(
      {Key? key,
       this.hintText,
      required this.labelText,
      required this.textEditingController,
      required this.inputType,
      this.fieldHeight,
      this.maxline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fieldHeight ?? 50.h,
      child: TextFormField(
        maxLines: maxline ?? 1,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing: 1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.normal,
            color: AppColors.linkColor,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            letterSpacing: 1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.normal,
            color: AppColors.linkColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.r),
            borderSide: const BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.r),
            borderSide: const BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0.r),
            borderSide: const BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 1.5,
            ),
          ),
        ),
        style: TextStyle(
          letterSpacing: 1.5,
          fontSize: 14.sp,
          fontWeight: FontWeight.w100,
          fontStyle: FontStyle.normal,
          color: AppColors.linkColor,
        ),
        keyboardType: inputType,
      ),
    );
  }
}
