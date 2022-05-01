import 'package:contesta_na_hora/helpers/url_lunch.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_color.dart';
import '../constants/app_consotants.dart';
import '../constants/text_font_style.dart';
import '../helpers/all_routes.dart';
import '../helpers/ui_helpers.dart';
import '../networks/api_acess.dart';
import '../screens/publicocaes_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/appbarname_helper.dart';
import '../widgets/homecard_widget.dart';
import '../widgets/loading_indicators.dart';
import '../widgets/pablication_list_widget.dart';
import 'contestar_screen.dart';
import 'publication_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    appBarName(name: "Home", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: RefreshIndicator(
            color: AppColors.primaryColor,
            onRefresh: () async {
              await getBlogHeaderRXobj.fetchBlogData();
            },
            child: ListView(
              children: [
                HomecardWidget(
                  imageUrl: AssetIcons.motorCar,
                  bigTitle: "Recebeu uma multa? Conteste na hora!",
                  smallText:
                      "Somos a sua equipa de advogados com valências em direito rodoviário.",
                  buttonText: "Contestar agora",
                  cardColor: AppColors.secondaryColor,
                  buttonColor: AppColors.primaryColor,
                  navigation: () {
                    Navigator.pushNamed(context, Routes.navigation,
                        arguments: const ContestarScreen());
                  },
                ),
                HomecardWidget(
                  header: 'Novidade',
                  imageUrl: AssetIcons.book,
                  bigTitle: 'Direito Estradal para Todos & Carta por Pontos',
                  smallText: ' José Carlos Godinho Rocha',
                  buttonText:
                      getProfileRXobj.getProfileData.value['button_name'],
                  cardColor: AppColors.tudoColor,
                  buttonColor: AppColors.secondaryColor,
                  navigation: () {
                    var url = 
                        getProfileRXobj.getProfileData.value['button_url']
                            .toString();
                    launch(url);
                  },
                ),
                const Divider(
                  color: AppColors.deviderColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Publicações',
                      style: TextFontStyle.publicationText,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.navigation,
                            arguments: const PublicationScreen());
                      },
                      child: Text(
                        'Ver tudo',
                        style: TextFontStyle.verTudoText,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpaceMedium,
                StreamBuilder(
                    stream: getBlogHeaderRXobj.getBlogHeaderData,
                    builder: (context, AsyncSnapshot blogData) {
                      if (blogData.hasData) {
                        List data = blogData.data['blog_header_list'];
                        return ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () async {
                                    await getBloagDetailsRXobj
                                        .fetchBlogDetailsData(
                                            data[index]['id'].toString());
                                    Navigator.popAndPushNamed(
                                        context, Routes.navigation,
                                        arguments:
                                            const PublicationDetailsScreen());
                                  },
                                  child: PublicationList(
                                    title: data[index]['title'],
                                    imageUrl: data[index]['thumbnail_url'],
                                    dateTime: data[index]['date'],
                                  ),
                                ),
                            separatorBuilder: (context, index) => const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  child: Divider(
                                    color: AppColors.deviderColor,
                                  ),
                                ),
                            itemCount: data.length <= 3 ? data.length : 3);
                      } else if (blogData.hasError) {
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
                UIHelper.verticalSpaceMedium,
                UIHelper.verticalSpaceLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
