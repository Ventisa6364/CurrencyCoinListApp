import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';

abstract class AbstractCoinsRepository {
  Future<List<CurrencyCoin>> getCoinsList();
}