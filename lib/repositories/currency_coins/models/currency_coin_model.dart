import 'package:country_flags/country_flags.dart';
import 'package:equatable/equatable.dart';

class  CurrencyCoin extends Equatable{
  const CurrencyCoin({
    required this.name,
    required this.price,
    required this.flag,
  });

  final String name;
  final double price;
  final CountryFlag flag;

  @override
  List<Object?> get props => [name, price, flag];
}