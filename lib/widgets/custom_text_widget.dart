import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';

class SobrenotextWidget extends StatelessWidget {
  final String text;
  const SobrenotextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(top: 3.r),
        child: Container(
          height: 11.h,
          width: 11.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: AppColors.primaryColor,
          ),
        ),
      ),
      UIHelper.horizontalSpaceSmall,
      SizedBox(
        width: .8.sw,
        child: Text(
          text,
          style: TextFontStyle.termsCondition.copyWith(
            letterSpacing: 0,
            fontWeight: FontWeight.w500,
            color: AppColors.appDrawerTextColor,
          ),
        ),
      ),
    ]);
  }
}
