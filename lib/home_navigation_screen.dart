// import 'package:custom_navigation_bar/custom_navigation_bar.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'constants/app_color.dart';
// import 'constants/text_font_style.dart';
// import 'helpers/all_routes.dart';
// import 'helpers/notification_service.dart';
// import 'networks/api_acess.dart';
// import 'widgets/app_bar_widget.dart';
// import 'widgets/app_drawer.dart';

// class NavigationScreen extends StatefulWidget {
//   final Widget? pageNum;
//   const NavigationScreen({
//     Key? key,
//     this.pageNum,
//   }) : super(key: key);

//   @override
//   State<NavigationScreen> createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen> {
//   //Variable for navigation Index
//   int _currentIndex = 0;
//   //Variable for navigation Color Index
//   int _colorIndex = 0;

//   bool _isFisrtBuild = true;
//   bool _navigationOn = true;

//   final List<StatefulWidget> _screens = [
//     // const HomeScreen(),
//     // const ContestarScreen(),
//     // const PublicationScreen(),
//   //  const FaqsScreen(),
//     //  const ContactScreen(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // FirebaseMessaging.instance.getToken().then(
//     //   (value) async {
//     //     if (kDebugMode) {
//     //       print("FCM -- > token [ $value ]");
//     //     }
//     //   },
//     // );
//     FirebaseMessaging.instance.subscribeToTopic('blog');

//     // 1. This method call when app in terminated state and you get a notification
//     // when you click on notification app open from terminated state and you can get notification data in this method
//     FirebaseMessaging.instance.getInitialMessage().then(
//       (message) async {
//         if (kDebugMode) {
//           print("${FirebaseMessaging.instance.getInitialMessage}");
//         }
//         if (message != null) {
//           if (kDebugMode) {
//             print("New Notification");
//           }
//           if (message.data['_id'] != null) {
//             await getBloagDetailsRXobj
//                 .fetchBlogDetailsData(message.data['_id'].toString());
//             Navigator.pushNamed(
//               context,
//               Routes.navigation,
//               arguments: const PublicationDetailsScreen(),
//             );
//             if (kDebugMode) {
//               print("${message.data['_id']}");
//             }
//           }
//         }
//       },
//     );
//     // 2. This method only call when App in forground it mean app must be opened
//     FirebaseMessaging.onMessage.listen((message) async {
//       if (kDebugMode) {
//         print("FirebaseMessaging.onMessage.listen");
//       }
//       if (message.notification != null) {
//         if (kDebugMode) {
//           print(message.notification!.title);
//           print(message.notification!.body);
//           print("message.data11 ${message.data}");
//         }
//         LocalNotificationService.createanddisplaynotification(message);
//       }
//     });

//     // 3. This method only call when App in background and not terminated(not closed)
//     FirebaseMessaging.onMessageOpenedApp.listen((message) async {
//       if (kDebugMode) {
//         print("FirebaseMessaging.onMessageOpenedApp.listen");
//       }
//       if (message.notification != null) {
//         if (kDebugMode) {
//           print(message.notification!.title);
//           print(message.notification!.body);
//           print("message.data22 ${message.data['_id']}");
//         }

//         if (message.data['_id'] != null) {
//           await getBloagDetailsRXobj
//               .fetchBlogDetailsData(message.data['_id'].toString());
//           Navigator.pushNamed(
//             context,
//             Routes.navigation,
//             arguments: const PublicationDetailsScreen(),
//           );
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Object? args;
//     StatefulWidget? screenPage;
//     if (_isFisrtBuild) {
//       args = ModalRoute.of(context)!.settings.arguments;
//     }
//     if (args != null) {
//       _colorIndex = 5;
//       screenPage = args as StatefulWidget;
//       var newColorindex = -1;
//       for (var element in _screens) {
//         newColorindex++;
//         if (element.toString() == screenPage.toString()) {
//           _colorIndex = newColorindex;
//           break;
//         }
//       }
//     }

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         extendBody: true,
//         appBar: const MainAppBarWidget(),
//         drawer: const AppDrawer(),
//         onDrawerChanged: (isOpened) => setState(() {
//           _navigationOn = !isOpened;
//         }),
//         body: Center(
//           child: (screenPage != null)
//               ? screenPage
//               : _screens.elementAt(_currentIndex),
//         ),
//         floatingActionButtonLocation:
//             FloatingActionButtonLocation.miniCenterFloat,
//         floatingActionButton: _navigationOn
//             ? Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.w),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.r),
//                     ),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black26,
//                         offset: Offset(
//                           5.0,
//                           5.0,
//                         ),
//                         blurRadius: 10.0,
//                         spreadRadius: 2.0,
//                       ), //BoxShadow
//                       BoxShadow(
//                         color: Colors.white,
//                         offset: Offset(0.0, 0.0),
//                         blurRadius: 0.0,
//                         spreadRadius: 0.0,
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.r),
//                     ),
//                     child: BottomNavigationBar(
//                       type: BottomNavigationBarType.fixed,
//                       showSelectedLabels: true,
//                       showUnselectedLabels: true,
//                       // selectedItemColor: AppColors.primaryColor,
//                       selectedLabelStyle: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primaryColor),
//                       unselectedLabelStyle: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.normal,
//                           color: AppColors.linkColor),
//                       onTap: (index) {
//                         setState(() {
//                           screenPage = null;
//                           _isFisrtBuild = false;
//                           _currentIndex = index;
//                           _colorIndex = index;
//                         });
//                       },
//                       currentIndex: _currentIndex,
//                       items: <BottomNavigationBarItem>[
//                         BottomNavigationBarItem(
//                             icon: SvgPicture.asset(
//                               'assets/icons/home.svg',
//                               color: (_colorIndex == 0)
//                                   ? AppColors.primaryColor
//                                   : AppColors.linkColor,
//                             ),
//                             label: 'Home'),
//                         BottomNavigationBarItem(
//                             icon: SvgPicture.asset(
//                               'assets/icons/content.svg',
//                               color: (_colorIndex == 1)
//                                   ? AppColors.primaryColor
//                                   : AppColors.linkColor,
//                             ),
//                             label: 'Contestar'),
//                         BottomNavigationBarItem(
//                             icon: SvgPicture.asset(
//                               'assets/icons/publication.svg',
//                               color: (_colorIndex == 2)
//                                   ? AppColors.primaryColor
//                                   : AppColors.linkColor,
//                             ),
//                             label: 'Publicações'),
//                         BottomNavigationBarItem(
//                             icon: SvgPicture.asset(
//                               'assets/icons/faq.svg',
//                               color: (_colorIndex == 3)
//                                   ? AppColors.primaryColor
//                                   : AppColors.linkColor,
//                             ),
//                             label: 'Faqs'),
//                         BottomNavigationBarItem(
//                             icon: SvgPicture.asset(
//                               'assets/icons/contact.svg',
//                               color: (_colorIndex == 4)
//                                   ? AppColors.primaryColor
//                                   : AppColors.linkColor,
//                               width: 22.w,
//                               height: 22.h,
//                             ),
//                             label: 'Contactos'),
//                       ],
//                     ),
//                   ),
//                   // CustomNavigationBar(
//                   //     //scaleCurve: Curves.linear,
//                   //     //bubbleCurve: Curves.bounceIn,
//                   //     strokeColor: AppColors.primaryColor,
//                   //     backgroundColor: Colors.white,
//                   //     borderRadius: Radius.circular(10.r),
//                   //     currentIndex: _currentIndex,
//                   //     onTap: (index) {
//                   //       setState(() {
//                   //         args = null;
//                   //         screenPage = null;
//                   //         _isFisrtBuild = false;
//                   //         _currentIndex = index;
//                   //         _colorIndex = index;
//                   //       });
//                   //     },
//                   //     items: [
//                   //       CustomNavigationBarItem(
//                   //         icon: SvgPicture.asset(
//                   //           'assets/icons/home.svg',
//                   //           color: (_colorIndex == 0)
//                   //               ? AppColors.primaryColor
//                   //               : AppColors.linkColor,
//                   //           width: 20.w,
//                   //           height: 20.h,
//                   //         ),
//                   //         title: Text(
//                   //           'Home',
//                   //           style: (_colorIndex == 0)
//                   //               ? TextFontStyle.sub2
//                   //               : TextFontStyle.sub1,
//                   //         ),
//                   //       ),
//                   //       CustomNavigationBarItem(
//                   //         icon: SvgPicture.asset(
//                   //           'assets/icons/content.svg',
//                   //           color: (_colorIndex == 1)
//                   //               ? AppColors.primaryColor
//                   //               : AppColors.linkColor,
//                   //           width: 20.w,
//                   //           height: 20.h,
//                   //         ),
//                   //         title: Text(
//                   //           'Contestar',
//                   //           style: (_colorIndex == 1)
//                   //               ? TextFontStyle.sub2
//                   //               : TextFontStyle.sub1,
//                   //         ),
//                   //       ),
//                   //       CustomNavigationBarItem(
//                   //         icon: SvgPicture.asset(
//                   //           'assets/icons/publication.svg',
//                   //           color: (_colorIndex == 2)
//                   //               ? AppColors.primaryColor
//                   //               : AppColors.linkColor,
//                   //           width: 20.w,
//                   //           height: 20.h,
//                   //         ),
//                   //         title: Text('Publicações',
//                   //             style: (_colorIndex == 2)
//                   //                 ? TextFontStyle.sub2
//                   //                 : TextFontStyle.sub1),
//                   //       ),
//                   //       CustomNavigationBarItem(
//                   //         icon: SvgPicture.asset(
//                   //           'assets/icons/faq.svg',
//                   //           color: (_colorIndex == 3)
//                   //               ? AppColors.primaryColor
//                   //               : AppColors.linkColor,
//                   //           width: 20.w,
//                   //           height: 20.h,
//                   //         ),
//                   //         title: Text('Faqs',
//                   //             style: (_colorIndex == 3)
//                   //                 ? TextFontStyle.sub2
//                   //                 : TextFontStyle.sub1),
//                   //       ),
//                   //       CustomNavigationBarItem(
//                   //         icon: SvgPicture.asset(
//                   //           'assets/icons/contact.svg',
//                   //           color: (_colorIndex == 4)
//                   //               ? AppColors.primaryColor
//                   //               : AppColors.linkColor,
//                   //           width: 20.w,
//                   //           height: 20.h,
//                   //         ),
//                   //         title: Text('Contactos',
//                   //             style: (_colorIndex == 4)
//                   //                 ? TextFontStyle.sub2
//                   //                 : TextFontStyle.sub1),
//                   //       ),
//                   //     ]),
//                 ),
//               )
//             : Container(),
//       ),
//     );
//   }
// }
