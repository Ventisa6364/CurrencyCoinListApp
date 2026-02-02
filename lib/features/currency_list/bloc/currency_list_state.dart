part of 'currency_list_bloc.dart';

abstract class CurrencyListState extends Equatable{}

class CurrencyListInitial extends CurrencyListState {
  @override
  List<Object?> get props => [];
}

class CurrencyListLoading extends CurrencyListState {
  @override
  List<Object?> get props => [];
}

class CurrencyListLoaded extends CurrencyListState {
  CurrencyListLoaded({required this.coinsList});

  final List<CurrencyCoin> coinsList;

  @override
  List<Object?> get props => [coinsList];
}

class CurrencyListLoadingFailure extends CurrencyListState {
  final Object? exception;

  CurrencyListLoadingFailure({this.exception});

  @override
  List<Object?> get props => [exception];
}
