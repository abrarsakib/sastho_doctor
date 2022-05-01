import 'package:contesta_na_hora/helpers/url_lunch.dart';
import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';

class AppLinkWidget extends StatelessWidget {
  final String url;
  final VoidCallback onPressed;

  const AppLinkWidget({
    Key? key,
    required this.url,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          url,
          style: TextFontStyle.links,
        )),
        Text(
          'IR PARA O SITE',
          style: TextFontStyle.iParaOSite,
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.link,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
