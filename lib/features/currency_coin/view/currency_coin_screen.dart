import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../currency_list/bloc/currency_list_bloc.dart';
import '../../currency_list/widgets/currency_to_currency_coin_tile.dart';

class CurrencyCoinScreen extends StatefulWidget {
  const CurrencyCoinScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CurrencyCoinScreenState();
}

class _CurrencyCoinScreenState extends State<CurrencyCoinScreen> {
  late final CurrencyCoin coin;
  late final CurrencyCoin coinsList;
  late final CurrencyListBloc _currencyListBloc;

  @override
  void initState() {
    super.initState();
    _currencyListBloc = CurrencyListBloc(
      GetIt.I<AbstractCoinsRepository>(),
    );
    _currencyListBloc.add(LoadCurrencyList());
  }

  @override
  void dispose() {
    _currencyListBloc.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    coin = ModalRoute.of(context)?.settings.arguments as CurrencyCoin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (coin.name.toUpperCase()),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          context.read<CurrencyListBloc>().add(
            LoadCurrencyList(completer: completer),
          );
          return completer.future;
        },
        child: BlocBuilder<CurrencyListBloc, CurrencyListState>(
          builder: (context, state) {
            if (state is CurrencyListLoaded) {
              return ListView.separated(
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) =>
                    Divider(color: Color(0x16FFFFFF)),
                itemBuilder: (context, index) {
                  final coinToList = state.coinsList[index];
                  return CurrencyToCurrencyListTile(
                    coin: coinToList,
                    baseCurrency: coin,
                  );
                },
              );
            }
            if (state is CurrencyListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Please try again later',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: () {
                        _currencyListBloc.add(LoadCurrencyList());
                      },
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
