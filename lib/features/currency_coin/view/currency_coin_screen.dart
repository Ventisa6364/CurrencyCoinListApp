import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';

class CurrencyCoinScreen extends StatefulWidget {
  const CurrencyCoinScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CurrencyCoinScreenState();
}

class _CurrencyCoinScreenState extends State<CurrencyCoinScreen> {

  late final CurrencyCoin coin;

  @override
  void didChangeDependencies() {
    coin = ModalRoute.of(context)?.settings.arguments as CurrencyCoin;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        ('${coin.name.toUpperCase()} ${coin.flag}'), style: Theme.of(context).textTheme.bodyLarge,),
      ),
    );
  }
}