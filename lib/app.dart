import 'package:flutter/material.dart';
import 'package:form_design_patterns2/main.dart';
import 'package:form_design_patterns2/pages/login/main.dart';
import 'package:form_design_patterns2/pages/registration/main.dart';
import 'package:form_design_patterns2/theme/theme.dart';
import 'package:form_design_patterns2/utils/log/logger.dart';

class MyApp extends StatelessWidget {

  const MyApp({
    Key? key
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    locator<Logger>().log('I0100001');

    return MaterialApp(
      builder: (context, child) {
        return Theme(
          data: AppTheme.theme(context),
          child: child!,
        );
      },
      title: '入力フォームのカタログ',
      home: LoginMainPage(),
      // home: RegistrationMainPage()
    );
  }
}