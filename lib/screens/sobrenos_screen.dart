import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/appbarname_helper.dart';
import '../widgets/custom_text_widget.dart';

class SobrenosScreen extends StatefulWidget {
  const SobrenosScreen({Key? key}) : super(key: key);

  @override
  State<SobrenosScreen> createState() => _SobrenosScreenState();
}

class _SobrenosScreenState extends State<SobrenosScreen> {
  @override
  void initState() {
    super.initState();
    appBarName(name: "Sobre nós", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpaceSmall,
                Text(
                  "Sobre nós",
                  style: TextFontStyle.headsub1,
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                  "Somos uma equipa de advogados com valências em direito rodoviário. Temos uma vasta experiência na defesa de contraordenações (todo o tipo de infrações estradais e não estradais) assim como, experiência comprovada em todas as fases dos processos, atendendo a cada caso concreto.",
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
                  "Serviços",
                  style: TextFontStyle.headsub1,
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                    '''Prestamos um serviço personalizado informando e esclarecendo os nossos clientes como se podem e devem defender, de modo a evitar possíveis coimas e sanções acessórias de inibição de condução ou apreensão de veículo no caso de pessoas coletivas (empresa).
          
          Trabalhamos com foco na defesa das variadas infrações estradais e não estradais, tais como:''',
                    style: TextFontStyle.termsCondition.copyWith(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.appDrawerTextColor,
                    )),
                UIHelper.verticalSpaceMedium,
                const SobrenotextWidget(
                    text: "Infrações ao Código da Estrada;"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text:
                        "Infrações sobre falta de pagamento de taxas de portagem em infraestruturas rodoviárias;"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text:
                        "Circulação com excesso de peso por parte de transportadoras rodoviárias;"),
                UIHelper.verticalSpaceSmall,
                const SobrenotextWidget(
                    text:
                        "Desrespeito das regras relativas à instalação e uso do tacógrafo em veículos de transportes e também repouso diário, por exemplo."),
                UIHelper.verticalSpaceExtraLarge
              ],
            ),
          ),
        ),
      ),
    );
  }
}
