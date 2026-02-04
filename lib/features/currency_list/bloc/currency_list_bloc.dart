import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/currency_coins/currency_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'currency_list_event.dart';
part 'currency_list_state.dart';

class CurrencyListBloc extends Bloc<CurrencyListEvent, CurrencyListState> {
  CurrencyListBloc(this.coinsRepository) : super(CurrencyListInitial()) {
    on<LoadCurrencyList>((event, emit) async {
      try {
        if (state is! CurrencyListLoading) {
          emit(CurrencyListLoading());
        }
        final coinsList = await coinsRepository.getCoinsList();
        emit(CurrencyListLoaded(coinsList: coinsList));
      } catch (e, st) {
        emit(CurrencyListLoadingFailure(exception: e));
        GetIt.I<Talker>().handle(e, st);
      }
      finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}
