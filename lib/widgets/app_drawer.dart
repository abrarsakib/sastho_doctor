import 'package:contesta_na_hora/helpers/all_routes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';
import '../constants/app_consotants.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';
import 'drawer_tile_widget.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30.w, top: 30.h),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      CupertinoIcons.clear_circled,
                      color: AppColors.primaryColor,
                      size: 40.sp,
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/rose_rosa.png',
                color: AppColors.drawerLogoColor,
                scale: 4,
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium,
          DrawerTileWidget(
            icon: AssetIcons.home,
            title: 'Home',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const HomeScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.drawerLineColor,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.sobrenos,
            title: 'Sobre nós',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const SobrenosScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.drawerLineColor,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.content,
            title: 'Contestar',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ContestarScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.drawerLineColor,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.publication,
            title: 'Publicações',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const PublicationScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.drawerLineColor,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.faq,
            title: 'Faqs',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const FaqsScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.drawerLineColor,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.mais,
            title: 'Mais Serviços',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ServiceScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.drawerLineColor,
            width: double.infinity,
          ),
          DrawerTileWidget(
            icon: AssetIcons.contact,
            title: 'Contactos',
            onTap: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ContactScreen());
            },
          ),
          Container(
            height: 1.h,
            color: AppColors.drawerLineColor,
            width: double.infinity,
          ),
          const Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'As nossas Redes Sociais',
                    style: TextFontStyle.drawerBottomText1,
                  ),
                  UIHelper.verticalSpaceMedium,
                  Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        //svg replace
                        AssetIcons.facebook,
                      ),
                      UIHelper.horizontalSpaceSmall,
                      SvgPicture.asset(
                        AssetIcons.instgram,
                        // color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              UIHelper.horizontalSpaceMedium,
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        height: 48.w,
                        width: 48.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.primaryColor),
                        child: Image.asset('assets/images/r_logo.png'),
                      ),
                      UIHelper.horizontalSpaceSmall,
                      Text(
                        'CONTESTA\nNA HORA',
                        style: TextFontStyle.horaText,
                      )
                    ],
                  ),
                ],
              ),
              UIHelper.horizontalSpaceMedium
            ],
          ),
          UIHelper.verticalSpaceLarge,
        ],
      ),
    );
  }
}
