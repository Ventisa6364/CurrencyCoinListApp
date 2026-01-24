import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/currency_list/widgets/widgets.dart';


class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key, required this.title});

  final String title;

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
          scrolledUnderElevation: 0
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => Divider(color: Color(0x16FFFFFF),),
        itemBuilder: (context, index) {
          const coinName = 'Dollar';
          return CurrencyListTile(coinName: coinName);
        },
      ),
    );
  }
}

