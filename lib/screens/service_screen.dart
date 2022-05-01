import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/url_lunch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../helpers/appbarname_helper.dart';
import '../helpers/ui_helpers.dart';

import '../widgets/app_link_widget.dart';
import '../widgets/custom_text_widget.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    super.initState();
    appBarName(name: "Serviços Personalizados", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''A equipa José Rocha & Advogados desenvolveu, durante anos, um conjunto de habilidades da qual se mantém atualizados para prestar os melhores serviços jurídicos aos seus clientes.
        
Todos os Advogados do nosso escritório têm experiência nas suas áreas de atividade e trabalham para prestar serviços de qualidade aos seus clientes.
        
O escritório tem competências na maioria das áreas do direito, dando também, especial atenção aos modernos meios de comunicação para obtenção e intercâmbio de informações para um acompanhamento personalizado aos seus clientes.''',
                  style: TextFontStyle.termsCondition.copyWith(
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.appDrawerTextColor,
                  ),
                ),
                UIHelper.verticalSpaceMedium,
                UIHelper.customDivider(),
                UIHelper.verticalSpaceMedium,
                Text(
                  'Apresentamos ainda como principais serviços:',
                  style: TextFontStyle.serVicosText,
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                  'A Equipa tudo sobre divórcio -  Divórcio mútuo-acordo',
                  style: TextFontStyle.serVicosText
                      .copyWith(color: AppColors.primaryColor),
                ),
                UIHelper.verticalSpaceMedium,
                const SobrenotextWidget(
                    text: "Divórcio e partilha de bens por mútuo acordo"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text:
                        "Reconhecimento da união de facto com divisão de bens por mútuo acordo"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text:
                        "Atribuição da casa de morada de família por mútuo acordo"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text:
                        "Regulação das responsabilidades parentais por comum acordo"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text: "Processo de maior acompanhado por mútuo acordo"),
                UIHelper.verticalSpaceMedium,
                UIHelper.customDivider(),
                AppLinkWidget(
                  url: 'www.tudosobredivorcio.pt',
                  onPressed: () {
                    urlLunch('https://www.tudosobredivorcio.pt');
                  },
                ),
                UIHelper.customDivider(),
                Text(
                  'A Equipa do escritório José Rocha & Advogados',
                  style: TextFontStyle.serVicosText
                      .copyWith(color: AppColors.primaryColor),
                ),
                UIHelper.verticalSpaceMedium,
                const SobrenotextWidget(text: "Prática Forense Em Tribunal"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text:
                        "Acompanhamento Junto De Entidades Públicas oou Privadas"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(text: "Aconselhamento Jurídico"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text:
                        "Pareceresassessoria Jurídica Pontual Ou Por Avença minutas"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(text: "Tratos"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(text: "Requerimentos"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(text: "Cartas"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(text: "Exposições"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(text: "Certificações"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text: "Reconhecimentos E Autenticações"),
                UIHelper.verticalSpaceMedium,
                UIHelper.customDivider(),
                AppLinkWidget(
                    url: 'www.joserochadvogados.pt',
                    onPressed: () {
                      urlLunch('https://www.joserochadvogados.pt');
                    }),
                UIHelper.customDivider(),
                UIHelper.verticalSpaceMedium,
                Text(
                  'A Equipa Contesta na hora- para todo o tipo de contraordenações rodoviárias',
                  style: TextFontStyle.serVicosText
                      .copyWith(color: AppColors.primaryColor),
                ),
                UIHelper.verticalSpaceMedium,
                UIHelper.customDivider(),
                AppLinkWidget(
                    url: 'www.contestanahora.pt',
                    onPressed: () {
                      urlLunch('https://www.contestanahora.pt');
                    }),
                UIHelper.customDivider(),
                UIHelper.verticalSpaceExtraLarge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
