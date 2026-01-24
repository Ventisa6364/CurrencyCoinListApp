
import 'package:flutter/material.dart';

class CurrencyCoinScreen extends StatefulWidget {
  const CurrencyCoinScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CurrencyCoinScreenState();
}

class _CurrencyCoinScreenState extends State<CurrencyCoinScreen> {

  String? coinName;

  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    assert(arg != null && arg is String, 'U must provide String arg');
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