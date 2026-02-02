import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/currency_coin_list_app.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';
import 'package:get_it/get_it.dart';


void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CurrencyCoinsRepositories(dio: Dio()));
  runApp(const CurrencyCoinListApp());
}



