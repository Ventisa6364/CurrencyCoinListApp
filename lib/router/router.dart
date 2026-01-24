import 'package:flutter_application_1/features/currency_coin/view/view.dart';
import '../features/currency_list/view/view.dart';

final routes = {
  '/' : (context) => const CurrencyListScreen(title: 'Currency exchange'),
  '/coin' : (context) => const CurrencyCoinScreen(),
};