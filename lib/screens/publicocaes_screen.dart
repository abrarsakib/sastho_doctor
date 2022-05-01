import 'package:contesta_na_hora/helpers/all_routes.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/networks/api_acess.dart';
import 'package:contesta_na_hora/screens/publication_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import '../helpers/appbarname_helper.dart';
import '../widgets/loading_indicators.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({Key? key}) : super(key: key);

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  @override
  void initState() {
    super.initState();
    appBarName(name: "Publicações", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          color: AppColors.primaryColor,
          onRefresh: () async {
            await getBlogHeaderRXobj.fetchBlogData();
          },
          child: StreamBuilder(
              stream: getBlogHeaderRXobj.getBlogHeaderData,
              builder: (context, AsyncSnapshot blogdata) {
                if (blogdata.hasData) {
                  List data = blogdata.data['blog_header_list'];
                  return Padding(
                    padding: EdgeInsets.only(left: 18.w, bottom: 40.h),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.62),
                      itemCount: data.length,
                      itemBuilder: (ctx, i) => InkWell(
                        onTap: () async {
                          await getBloagDetailsRXobj
                              .fetchBlogDetailsData(data[i]['id'].toString());
                          Navigator.pushNamed(
                            context,
                            Routes.navigation,
                            arguments: const PublicationDetailsScreen(),
                          );
                        },
                        child: SizedBox(
                            height: 100.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Container(
                                    child: Image.network(
                                      data[i]['thumbnail_url'],
                                      height: 160.h,
                                      width: 160.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                UIHelper.verticalSpaceSmall,
                                SizedBox(
                                  width: 160.w,
                                  height: 0.09.sh,
                                  child: Text(
                                    data[i]['title'],
                                    style: TextFontStyle.publicationListText,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  data[i]['date'],
                                  style: TextFontStyle.publicationDateText,
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                } else if (blogdata.hasError) {
                  return const SizedBox.shrink();
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: loadingIndicatorCircle(context: context),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
