import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';

class CurrencyToCurrencyListTile extends StatelessWidget {

  final CurrencyCoin coin;
  final CurrencyCoin baseCurrency;

  const CurrencyToCurrencyListTile({super.key,
    required this.coin,
    required this.baseCurrency
  });

  @override
  Widget build(BuildContext context) {
    if (coin != baseCurrency) {
      final double ratio = coin.price / baseCurrency.price;
      return ListTile(
        leading: coin.flag,
        title: Text(coin.name.toUpperCase(),
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,
        ),
        subtitle: Text(ratio.toStringAsFixed(2),
          style: Theme
              .of(context)
              .textTheme
              .labelMedium,
        ),
      );
    }
    return ListTile(
      leading: Text('🇷🇺'),
      title: Text('RUB',
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium,
      ),
      subtitle: Text((1 / coin.price).toStringAsFixed(2),
        style: Theme
            .of(context)
            .textTheme
            .labelMedium!
            .copyWith(
          color: Colors.grey,
        ),
      ),
    );
  }
}