import 'dart:io';

import 'package:contesta_na_hora/helpers/url_lunch.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_color.dart';
import '../constants/app_consotants.dart';
import '../constants/text_font_style.dart';
import '../helpers/all_routes.dart';
import '../helpers/ui_helpers.dart';
import '../networks/api_acess.dart';
import '../screens/contestar_submit_screen.dart';
import '../widgets/custom_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/appbarname_helper.dart';
import '../widgets/custome_textfield.dart';
import '../widgets/popup_item_widget.dart';

class ContestarScreen extends StatefulWidget {
  const ContestarScreen({Key? key}) : super(key: key);

  @override
  State<ContestarScreen> createState() => _ContestarScreenState();
}

class _ContestarScreenState extends State<ContestarScreen> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _multaTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  final TextEditingController _messageTextController = TextEditingController();

  bool _value = false;
  List<File>? file = [];
  List<String> path = [];
  List<String> fileNames = [];

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();

  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/counter.txt');
  // }

  @override
  void initState() {
    super.initState();
    appBarName(name: "Contestar/Submeter Multa", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tipo de Multa',
                  style: TextFontStyle.contestarBodyText,
                ),
                UIHelper.verticalSpaceSmall,
                PopupWidget(
                  multa: _multaTextController,
                ),
                UIHelper.verticalSpaceSmall,
                Text(
                  'Preencha os dados',
                  style: TextFontStyle.contestarBodyText,
                ),
                Form(
                  child: Column(
                    children: [
                      UIHelper.verticalSpaceMedium,
                      CustomNumberFormField(
                        // hintText: "ex:Sauvik Ray",
                        labelText: "Nome",
                        textEditingController: _nameTextController,
                        inputType: TextInputType.name,
                      ),
                      UIHelper.verticalSpaceSmall,
                      CustomNumberFormField(
                        // hintText: "ex:test01@test.com",
                        labelText: "E-mail",
                        textEditingController: _emailTextController,
                        inputType: TextInputType.emailAddress,
                      ),
                      UIHelper.verticalSpaceSmall,
                      CustomNumberFormField(
                        // hintText: "ex:011-88XXXXXXX",
                        labelText: "Contacto Telefónico",
                        textEditingController: _phoneNumberTextController,
                        inputType: TextInputType.number,
                      ),
                      UIHelper.verticalSpaceSmall,
                      CustomNumberFormField(
                        // hintText: "ex:Sauvik Ray is a good boy",
                        labelText: "Mensagem",
                        textEditingController: _messageTextController,
                        inputType: TextInputType.text,
                        fieldHeight: 80.h,
                        maxline: 3,
                      ),
                      // UIHelper.verticalSpaceSmall,
                      // CustomNumberFormField(
                      //   hintText: "ex:file size should not exit 100 k",
                      //   labelText: "Upload de Doumentos",
                      //   textEditingController: _nameTextController,
                      //   inputType: TextInputType.name,
                      // ),
                      UIHelper.verticalSpaceSmall,
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors
                                    .textFieldBorderColor, //                   <--- border color
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            onTap: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles(allowMultiple: true);
                              if (result != null) {
                                setState(() {
                                  for (var element in result.files) {
                                    path.add(element.path!);
                                    fileNames.add(element.name);
                                  }
                                });
                              } else {
                                const snackBar = SnackBar(
                                  content: Text('No File Selected'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            title: Text(
                              fileNames.isNotEmpty
                                  ? fileNames.toString()
                                  : "Upload de Doumentos",
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.normal,
                                color: AppColors.linkColor,
                              ),
                            ),
                            trailing: Image.asset(
                              AssetIcons.upload,
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          )),
                      UIHelper.verticalSpaceMedium,
                      Row(
                        children: [
                          customCheckBox(),
                          UIHelper.horizontalSpaceSmall,
                          const Text(
                            'Concordo com a ',
                            style: TextFontStyle.termsCondition,
                          ),
                          InkWell(
                            onTap: () {
                              var url = getTermsandConditionRXobj
                                  .getTermsandConditionData.value['link']
                                  .toString();
                              launch(url);
                            },
                            child: const Text(
                              'política de privacidade',
                              style: TextFontStyle.termsConditionBold,
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpaceMedium,
                      customeButton(
                        name: "Submeter Multa",
                        context: context,
                        height: 50.h,
                        color: AppColors.secondaryColor,
                        borderRadius: 20.r,
                        minWidth: double.infinity,
                        textStyle: TextFontStyle.submitButtonText,
                        onCallBack: () async {
                          if (path.isNotEmpty) {
                            for (var element in path) {
                              file?.add(File(element));
                            }

                            if (_value) {
                              postFileRXobj.clean();
                              await postFileRXobj.postFileData(
                                _multaTextController.text,
                                _nameTextController.text,
                                _emailTextController.text,
                                _phoneNumberTextController.text,
                                _messageTextController.text,
                                file,
                              );

                              if (!postFileRXobj.getFileData.hasError) {
                                Navigator.pushNamed(context, Routes.navigation,
                                    arguments: const ContestarSubmitScreen());
                              }
                            } else {
                              const snackBar = SnackBar(
                                content:
                                    Text('Verifique a Política de Privacidade'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          } else {
                            const snackBar = SnackBar(
                              content: Text('Anexe o Documento'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      ),
                      UIHelper.verticalSpaceExtraLarge,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell customCheckBox() {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.linkColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: (_value == true)
            ? Container(
                height: 11.h,
                width: 11.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              )
            : Container(),
      ),
    );
  }
}
