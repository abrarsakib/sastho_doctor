import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';

class PublicationList extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String dateTime;
  const PublicationList({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Container(
              height: 65.h,
              width: 65.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageUrl),
                ),
              ),
              // child: Image.network(
              //   imageUrl,
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: .7.sw,
                height: 0.065.sh,
                child: Text(
                  title,
                  style: TextFontStyle.publicationListText,
                  // overflow: TextOverflow.fade,
                ),
              ),
              UIHelper.verticalSpaceSmall,
              Text(
                dateTime,
                style: TextFontStyle.publicationDateText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
