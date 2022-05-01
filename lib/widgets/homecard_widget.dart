import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import 'custom_button.dart';

class HomecardWidget extends StatelessWidget {
  final String imageUrl;
  final String? header;
  final String bigTitle;
  final String smallText;
  final String buttonText;
  final Color cardColor;
  final Color buttonColor;
  final Function navigation;

  const HomecardWidget({
    Key? key,
    this.header,
    required this.imageUrl,
    required this.bigTitle,
    required this.smallText,
    required this.buttonText,
    required this.cardColor,
    required this.buttonColor,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      color: cardColor, //AppColors.secondaryColor,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
              child: Image.asset(
                imageUrl,
                // 'https://images.unsplash.com/photo-1498084393753-b411b2d26b34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
                height: 220.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
              flex: 6,
              child: SizedBox(
                height: 220.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (header != null)
                        SizedBox(
                          height: 25.h,
                          child: Text(
                            header!,
                            // 'Recebeu uma multa? Conteste na hora!',

                            textAlign: TextAlign.left,
                            overflow: TextOverflow.fade,
                            style: TextFontStyle.card1TitleText
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                        ),
                      SizedBox(
                        height: 80.h,
                        child: Text(
                          bigTitle,
                          // 'Recebeu uma multa? Conteste na hora!',

                          textAlign: TextAlign.left,
                          overflow: TextOverflow.fade,
                          style: TextFontStyle.card1TitleText,
                        ),
                      ),
                      SizedBox(
                        height: header != null ? 30.h : 55.h,
                        child: Text(
                          smallText,
                          // 'Somos a sua equipa de advogados com valências em direito rodoviário.',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.fade,
                          style: TextFontStyle.card1SubTitleBoldText,
                        ),
                      ),
                      customeButton(
                          name: buttonText, //"Contestar agora",
                          color: buttonColor,
                          height: 30.h,
                          minWidth: 100.w,
                          borderRadius: 10.r,
                          textStyle: TextFontStyle.cardButtonText,
                          onCallBack: () {
                            navigation();
                          },
                          context: context)
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
