import 'package:contesta_na_hora/controller/contasa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

appBarName({required String name, required BuildContext context}) {
  Contasa contasa = Provider.of<Contasa>(context, listen: false);
  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
    contasa.changename(name);
  });
}
