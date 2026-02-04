import 'package:flutter/material.dart';
import 'package:flutter_application_1/repositories/currency_coins/abstract_coins_repository.dart';
import 'package:flutter_application_1/router/router.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'features/currency_list/bloc/currency_list_bloc.dart';

class CurrencyCoinListApp extends StatelessWidget {
  const CurrencyCoinListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CurrencyListBloc(GetIt.I<AbstractCoinsRepository>())
                ..add(LoadCurrencyList()),
        ),
      ],
      child: MaterialApp(title: 'Currency', theme: darkTheme, routes: routes, navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>())
      ],),
    );
  }
}
