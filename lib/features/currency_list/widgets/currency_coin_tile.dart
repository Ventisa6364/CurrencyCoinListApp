import 'package:flutter/material.dart';

class CurrencyListTile extends StatelessWidget {
  const CurrencyListTile({
    super.key,
    required this.coinName,
  });

  final String coinName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.attach_money, color: Color(0xc0f5f5f5)),
      trailing: const Icon(
        Icons.arrow_forward_ios, color: Color(0x80f5f5f5),),
      title: Text(coinName,
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium,
      ),
      subtitle: Text('80₽',
        style: Theme
            .of(context)
            .textTheme
            .labelMedium,
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coinName,
        );
      },
    );
  }
}