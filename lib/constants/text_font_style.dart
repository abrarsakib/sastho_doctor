import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();
  //Welcome Screen Text
  static final welcome = TextStyle(
      fontSize: 30.sp,
      color: Colors.white,
      fontWeight: FontWeight.w900,
      height: 1.2);
  static final number = TextStyle(
    fontSize: 20.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );

  //Bold Text1
  static final head1 = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.secondaryColor);
  //HeadSub Text
  static final headsub1 = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor);
  static final headsub2 = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);
  //Home Screen Text
  //Card1 Style
  static final card1TitleText = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static final card1SubTitleBoldText = TextStyle(
      fontSize: 13.sp, fontWeight: FontWeight.bold, color: Colors.white);
  static final cardButtonText = TextStyle(
      fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.white);
  //Card2 Style
  static final card2Title1Text = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.secondaryColor);
  static final card2Title2Text = TextStyle(
      fontSize: 17.sp, fontWeight: FontWeight.bold, color: Colors.white);

  // Publicações
  static final publicationText = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.8.sp,
      color: AppColors.secondaryColor);
  static final publicationListText = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.8,
      color: AppColors.secondaryColor);
  static final verTudoText = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      letterSpacing: 0.8,
      color: AppColors.tudoColor);
  static final publicationDateText = TextStyle(
      fontSize: 12.sp, letterSpacing: 0.8, color: AppColors.dateColor);
  static final publicationHeadText = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.publicationTextColor);
  static final publicationDetailText = TextStyle(
      fontSize: 12.sp,
      letterSpacing: 0.8,
      color: AppColors.publicationTextColor);

  //Contestar/Submeter Multa Screen
  static final contestarBodyText =
      TextStyle(fontSize: 14.sp, color: Colors.black, letterSpacing: 1);

  //popupMenu
  static final selectionText =
      TextStyle(fontSize: 14.sp, color: Colors.black, letterSpacing: 1);
  static final popUpselectedText = TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
      letterSpacing: 1,
      fontWeight: FontWeight.w100);
  static final submitButtonText = TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
      fontWeight: FontWeight.w900,
      letterSpacing: 1);

  // Terms and Condition
  static const termsCondition = TextStyle(
      fontFamily: 'NotoSans',
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w200,
      letterSpacing: 1);
  static const termsConditionBold = TextStyle(
      decoration: TextDecoration.underline,
      fontFamily: 'NotoSans',
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 1);

  //usefull Link
  static final usefulLink = TextStyle(
      fontSize: 14.sp,
      color: AppColors.secondaryColor,
      letterSpacing: 0.8,
      fontWeight: FontWeight.normal);
  static final links = TextStyle(
    fontSize: 12.sp,
    color: AppColors.linkColor,
    letterSpacing: 0.8,
  );
  static final site = TextStyle(
    fontSize: 8.sp,
    color: AppColors.primaryColor,
    letterSpacing: 0.8,
  );

//Bottom NAvigation Text
  static final sub1 = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.linkColor);
  static final sub2 = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);

  //Expanded title
  static final expandedTitleFalse = TextStyle(
      fontSize: 12.sp,
      letterSpacing: 1,
      fontWeight: FontWeight.w100,
      color: Colors.black);
  static final expandedTitleTrue = TextStyle(
      fontSize: 12.sp,
      letterSpacing: 1,
      fontWeight: FontWeight.w100,
      color: Colors.white);

  //App Drawer Text
  static final drawerTitle = TextStyle(
      fontSize: 14.sp,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
      color: AppColors.appDrawerTextColor);

  static final drawerBottomText1 = TextStyle(
      fontSize: 10.sp,
      letterSpacing: 0.8,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor);
  static final horaText = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryColor,
      height: 1);
  static final iParaOSite = TextStyle(
      fontSize: 8.sp, letterSpacing: 1, color: AppColors.primaryColor);
  static final serVicosText = TextStyle(
      fontSize: 12.sp,
      color: AppColors.appDrawerTextColor,
      fontWeight: FontWeight.bold);

  static const socialLink = TextStyle(
      letterSpacing: 0.8,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: AppColors.expandedTilebgColor);
}
