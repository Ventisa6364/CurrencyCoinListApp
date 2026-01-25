import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/currency_list/widgets/widgets.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';
import 'package:get_it/get_it.dart';


class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key, required this.title});

  final String title;

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {

  List<CurrencyCoin>? _currencyCoinsList;

  @override
  void initState() {
    _loadCurrencyCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            widget.title,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
          ),
          scrolledUnderElevation: 0
      ),
      body: (_currencyCoinsList == null)
          ? const Center(child: CircularProgressIndicator(),)
          : ListView.separated(
        itemCount: _currencyCoinsList!.length,
        separatorBuilder: (context, index) =>
            Divider(color: Color(0x16FFFFFF),),
        itemBuilder: (context, index) {
          final coin = _currencyCoinsList![index];
          return CurrencyListTile(coin: coin,);
        },
      ),
    );
  }


  Future<void> _loadCurrencyCoin() async {
    _currencyCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
