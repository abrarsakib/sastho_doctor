import 'package:contesta_na_hora/constants/app_consotants.dart';
import 'package:contesta_na_hora/networks/api_acess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/text_font_style.dart';
import '../widgets/loading_indicators.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/splash_image.png',
                  height: 79.h,
                  width: 221.h,
                )
              ]),
        ),
      ),
    );
  }
}
