
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/currency_coins/models/currency_coin_model.dart';

class CurrencyCoinScreen extends StatefulWidget {
  const CurrencyCoinScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CurrencyCoinScreenState();
}

class _CurrencyCoinScreenState extends State<CurrencyCoinScreen> {

  late final String coinName;

  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    coinName = arg as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...', style: Theme.of(context).textTheme.bodyLarge,),),
    );
  }
}