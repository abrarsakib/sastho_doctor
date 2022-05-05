import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/controller/appbarname.dart';
import 'package:contesta_na_hora/helpers/all_routes.dart';
import 'package:contesta_na_hora/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBarWidget({
    Key? key,
    // this.text,
  }) : super(key: key);
  //final String? text;

  @override
  Widget build(BuildContext context) {
    //final appBarTheme = Theme.of(context).appBarTheme;
    return AppBar(
      title: Consumer<AppbarName>(
          builder: (context, value, child) => Text(value.name)),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, Routes.navigation,
              //     arguments: const ServiceScreen());
            },
            icon: Image.asset(
              'assets/icons/add.png',
            ),
          ),
        ),
      ],
      flexibleSpace: ClipPath(
          clipper: MyAppBarClipper(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.55,
                    0.62,
                  ],
                  colors: [
                    AppColors.beginGradient,
                    AppColors.endGradient,
                  ]),
            ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class MyAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10;

    Path path = Path()
      ..lineTo(0, 0) //start point

      ..lineTo(size.width, 0) // device width(dx),0(dy)
      ..lineTo(size.width, size.height - radius) //deviceWidth, 100
      ..arcToPoint(
          Offset(size.width - radius,
              size.height - (radius * 2)), //deviceWidth-20,160
          radius: Radius.circular(radius),
          clockwise: false)
      ..lineTo(radius, size.height - (radius * 2)) //20,100
      ..arcToPoint(Offset(0, size.height - radius), //0,100
          radius: Radius.circular(radius),
          clockwise: false)
      ..lineTo(0, size.height - radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
