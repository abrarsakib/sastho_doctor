import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/helpers/url_lunch.dart';
import 'package:contesta_na_hora/networks/api_acess.dart';
import 'package:contesta_na_hora/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/appbarname_helper.dart';

class PublicationDetailsScreen extends StatefulWidget {
  final Map? data;

  const PublicationDetailsScreen({this.data, Key? key}) : super(key: key);

  @override
  State<PublicationDetailsScreen> createState() =>
      _PublicationDetailsScreenState();
}

class _PublicationDetailsScreenState extends State<PublicationDetailsScreen> {
  @override
  void initState() {
    super.initState();
    appBarName(name: "Publicações", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: StreamBuilder(
                stream: getBloagDetailsRXobj.getBlogDetailsData,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data['date'],
                            style: TextFontStyle.publicationDateText),
                        UIHelper.verticalSpaceMedium,
                        Text(snapshot.data['title'],
                            style: TextFontStyle.publicationHeadText),
                        UIHelper.verticalSpaceMedium,
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                            snapshot.data['thumbnail_url'],
                            height: 344.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        UIHelper.verticalSpaceMedium,
                        Html(
                          data: snapshot.data['description'],
                          // style: TextFontStyle.publicationDetailText,
                        ),
                        UIHelper.verticalSpaceLarge,
                        UIHelper.verticalSpaceLarge,
                        if (snapshot.data['button_name'] != "" &&
                            snapshot.data['button_url'] != "")
                          customeButton(
                              name: snapshot.data['button_name'],
                              onCallBack: () {
                                urlLunch(snapshot.data['button_url']);
                              },
                              height: 50.h,
                              minWidth: double.infinity,
                              borderRadius: 20.r,
                              color: AppColors.secondaryColor,
                              textStyle: TextFontStyle.submitButtonText,
                              context: context),
                        UIHelper.verticalSpaceExtraLarge,
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
          ),
        ),
      ),
    );
  }
}
