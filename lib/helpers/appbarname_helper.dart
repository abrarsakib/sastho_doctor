import 'package:contesta_na_hora/controller/appbarname.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

appBarName({required String name, required BuildContext context}) {
  AppbarName appbar = Provider.of<AppbarName>(context, listen: false);
  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
    appbar.changename(name);
  });
}
