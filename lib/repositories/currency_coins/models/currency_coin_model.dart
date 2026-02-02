import 'package:equatable/equatable.dart';

class  CurrencyCoin extends Equatable{
  const CurrencyCoin({
    required this.name,
    required this.priceInRub,
    required this.flag,
  });

  final String name;
  final double priceInRub;
  final String flag;

  @override
  List<Object?> get props => [name, priceInRub, flag];
}