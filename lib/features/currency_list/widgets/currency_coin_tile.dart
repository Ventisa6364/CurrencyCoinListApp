import 'package:flutter/material.dart';
import '../../../repositories/currency_coins/models/currency_coin_model.dart';

class CurrencyListTile extends StatelessWidget {
  const CurrencyListTile({
    super.key,
    required this.coin,
  });

  final CurrencyCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(coin.flag),
      trailing: const Icon(
        Icons.arrow_forward_ios, color: Color(0x80f5f5f5),),
      title: Text(coin.name.toUpperCase(),
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium,
      ),
      subtitle: Text('${(1 / coin.priceInRub).toStringAsFixed(2)}₽',
        style: Theme
            .of(context)
            .textTheme
            .labelMedium,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin.name.toUpperCase(),
        );
      },
    );
  }
}