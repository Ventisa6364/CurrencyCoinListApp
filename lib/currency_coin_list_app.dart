import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/theme/theme.dart';

class CurrencyCoinListApp extends StatelessWidget {
  const CurrencyCoinListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency',
      theme: darkTheme,
      routes: routes,
    );
  }
}