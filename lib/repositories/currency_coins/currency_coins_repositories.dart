import 'package:currency_picker/currency_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';


class CurrencyCoinsRepositories implements AbstractCoinsRepository {

  final CurrencyService _currencyService = CurrencyService();

  CurrencyCoinsRepositories(
      {required this.dio}
      );

  final Dio dio;

  @override
  Future<List<CurrencyCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://currencyrateapi.com/api/latest?base=RUB&codes=USD,EUR,UAH,GBP,ILS,JPY,KRW,AED,CHF,CNY,ETB,KZT,AUD,CAD,HKD,NZD,SEK,SGD,NOK,MXN'
    );

    final data = response.data as Map<String, dynamic>;

    final rates = data['rates'] as Map<String, dynamic>;

    final currencyCoinList = rates.entries
        .map((e) => CurrencyCoin(
      name: e.key,
      priceInRub: double.tryParse(e.value.toString()) ?? 0.0,
      flag: CurrencyUtils.currencyToEmoji(_currencyService.findByCode(e.key)!),
    ))
        .toList();

    return currencyCoinList;
  }
}