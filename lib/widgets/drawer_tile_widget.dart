import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';

class DrawerTileWidget extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const DrawerTileWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.expandedTilebgColor,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 50.h,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                height: 20.sp,
                width: 20.sp,
                color: AppColors.appDrawerTextColor,
              ),
              UIHelper.horizontalSpaceMedium,
              Text(
                title,
                style: TextFontStyle.drawerTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
