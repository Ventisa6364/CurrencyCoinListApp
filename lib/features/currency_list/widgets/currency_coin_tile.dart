import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';

class CurrencyListTile extends StatelessWidget {
  const CurrencyListTile({
    super.key,
    required this.coin,
  });

  final CurrencyCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: coin.flag,
      trailing: const Icon(
        Icons.arrow_forward_ios, color: Color(0x80f5f5f5),),
      title: Text(coin.name.toUpperCase(),
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium,
      ),
      subtitle: Text('${(double.parse(coin.price.toStringAsFixed(2)) != 0.00) ? coin.price.toStringAsFixed(2) : '0.01'} \$',
        style: Theme
            .of(context)
            .textTheme
            .labelMedium,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin,
        );
      },
    );
  }
}