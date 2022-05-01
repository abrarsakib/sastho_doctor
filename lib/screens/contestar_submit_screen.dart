import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/helpers/url_lunch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_color.dart';
import '../constants/app_consotants.dart';
import '../widgets/homecard_widget.dart';

class ContestarSubmitScreen extends StatefulWidget {
  const ContestarSubmitScreen({Key? key}) : super(key: key);

  @override
  State<ContestarSubmitScreen> createState() => _ContestarSubmitScreenState();
}

class _ContestarSubmitScreenState extends State<ContestarSubmitScreen> {
  List url = [
    'www.joserochadvogados.pt',
    'www.contestanahora.pt',
    'www.tudosobredivorcio.pt',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/thankyou.svg',
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                  'Obrigado',
                  style: TextFontStyle.head1,
                ),
                UIHelper.verticalSpaceSmall,
                Text(
                  'por submeter o nosso formulário',
                  style: TextFontStyle.headsub2,
                ),
                UIHelper.verticalSpaceMedium,
                HomecardWidget(
                  header: 'Novidade',
                  imageUrl: AssetIcons.book,
                  bigTitle: 'Direito Estradal para Todos & Carta por Pontos',
                  smallText: ' José Carlos Godinho Rocha',
                  buttonText: 'Compre já',
                  cardColor: AppColors.tudoColor,
                  buttonColor: AppColors.secondaryColor,
                  navigation: () {},
                ),
                UIHelper.verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Links Úteis',
                      textAlign: TextAlign.left,
                      style: TextFontStyle.publicationText,
                    ),
                  ],
                ),
                UIHelper.verticalSpaceSmall,
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              url[index],
                              style: TextFontStyle.links,
                            )),
                            Text(
                              'IR PARA O SITE',
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  letterSpacing: 1,
                                  color: AppColors.primaryColor),
                            ),
                            IconButton(
                              onPressed: () {
                                urlLunch('https://${url[index]}');
                              },
                              icon: const Icon(
                                Icons.link,
                                color: AppColors.primaryColor,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          color: AppColors.deviderColor,
                        ),
                    itemCount: url.length),
                UIHelper.verticalSpaceExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
