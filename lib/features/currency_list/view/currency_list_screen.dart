import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/currency_list/bloc/currency_list_bloc.dart';
import 'package:flutter_application_1/features/currency_list/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key, required this.title});

  final String title;

  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CurrencyListBloc>().add(LoadCurrencyList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.bodyLarge),
        scrolledUnderElevation: 0,
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
                  final coin = state.coinsList[index];
                  return CurrencyListTile(coin: coin);
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
                        context.read<CurrencyListBloc>().add(
                          LoadCurrencyList(),
                        );
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
