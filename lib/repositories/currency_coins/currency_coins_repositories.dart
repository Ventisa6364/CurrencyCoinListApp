import 'package:country_flags/country_flags.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';

class CurrencyCoinsRepositories implements AbstractCoinsRepository {

  CurrencyCoinsRepositories({required this.dio});

  final Dio dio;

  @override
  Future<List<CurrencyCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://openexchangerates.org/api/latest.json?app_id=28d58daece034dcfadc77402e46f720c',
    );

    final data = response.data as Map<String, dynamic>;

    final rates = data['rates'] as Map<String, dynamic>;

    final currencyCoinList = rates.entries
        .map(
          (e) => CurrencyCoin(
            name: e.key,
            price: 1 / (double.tryParse(e.value.toString())!),
            flag: CountryFlag.fromCurrencyCode(e.key, theme: EmojiTheme(size: 30),),
          ),
        )
        .toList();

    return currencyCoinList;
  }
}
