import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/networks/api_acess.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/appbarname_helper.dart';
import '../widgets/loading_indicators.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool expandedTile = false;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    appBarName(name: "FAQs", context: context);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: RefreshIndicator(
            color: AppColors.primaryColor,
            onRefresh: () async {
              await getFaqRXobj.fetchFaqData();
            },
            child: ListView(
              children: <Widget>[
                Text(
                  'Perguntas e respostas que podem ajudá-lo.',
                  style: TextFontStyle.contestarBodyText,
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpaceMedium,
                StreamBuilder(
                  stream: getFaqRXobj.getFaqData,
                  builder: (context, AsyncSnapshot faqSnapshot) {
                    if (faqSnapshot.hasData) {
                      List data = faqSnapshot.data['faqs'];
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return Column(
                              children: [
                                ExpansionTileCard(
                                  title: Text(
                                    data[i]['question'].toString(),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  elevation: 2.0,
                                  baseColor: AppColors.expandedList,
                                  expandedColor: AppColors.secondaryColor,
                                  expandedTextColor: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        data[i]['answer'],
                                        style: TextFontStyle.expandedTitleTrue,
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpaceSmall,
                              ],
                            );

                            // Column(
                            //   children: [
                            //     UIHelper.verticalSpaceSmall,
                            //     Card(
                            //       color: expandedTile
                            //           ? AppColors.secondaryColor
                            //           : AppColors.expandedList,
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(20.r),
                            //       ),
                            //       child: InkWell(
                            //         onTap: () {
                            //           setState(() {
                            //             if (expandedTile) {
                            //               _controller.forward();
                            //             } else {
                            //               _controller.reverse();
                            //             }
                            //             expandedTile = !expandedTile;
                            //           });
                            //         },
                            //         child: ListTile(
                            //           title: Text(
                            //             data[i]['question'],
                            //             style: expandedTile
                            //                 ? TextFontStyle.expandedTitleTrue
                            //                 : TextFontStyle.expandedTitleFalse,
                            //           ),
                            //           trailing: (expandedTile)
                            //               ? const Icon(
                            //                   Icons.expand_more_rounded,
                            //                   color:
                            //                       AppColors.expandedTilebgColor,
                            //                 )
                            //               : const Icon(
                            //                   Icons.expand_less_rounded,
                            //                   color:
                            //                       AppColors.appDrawerTextColor,
                            //                   size: 25,
                            //                 ),
                            //         ),
                            //       ),
                            //     ),
                            //     AnimatedContainer(
                            //       curve: Curves.easeInOut,
                            //       duration: const Duration(milliseconds: 300),
                            //       width: double.infinity,
                            //       height: expandedTile ? 100 : 0,
                            //       child: Text(
                            //         data[i]['answer'],
                            //       ),
                            //     )
                            //   ],
                            // );
                          });
                    } else if (faqSnapshot.hasError) {
                      return const SizedBox.shrink();
                    }
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: loadingIndicatorCircle(context: context),
                      ),
                    );
                  },
                ),
                UIHelper.verticalSpaceExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
