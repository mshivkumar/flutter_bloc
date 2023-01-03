import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testapp/NamedRoute/cubit/counter/counter_cubit.dart';
import 'package:testapp/NamedRoute/screens/named_home_screen.dart';
import 'package:testapp/NamedRoute/screens/named_show_counter_screen.dart';
import 'package:testapp/UnnamedRoute/screens/unamed_show_counter_screen.dart';
import 'package:testapp/UnnamedRoute/screens/unnamed_home_page.dart';
import 'package:testapp/onGenerateRoute/cubits/counter/counter_cubit.dart';
import 'package:testapp/onGenerateRoute/screens/generate_home_screen.dart';
import 'package:testapp/onGenerateRoute/screens/generate_show_counter_screen.dart';

import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NamedCounterCubit _namedCounterCubit = NamedCounterCubit();
  final onGenerateCounterCubit _generateCounterCubit = onGenerateCounterCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const HomeScreen(),
      onGenerateRoute: (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case onGenerateRouteHomeScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                    value: _generateCounterCubit,
                    child: const onGenerateRouteHomeScreen()));
          case onGenerateRouteShowCounterScreen.routeName:
            return MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                    value: _generateCounterCubit,
                    child: const onGenerateRouteShowCounterScreen()));
        }
      },
      routes: {
        UnnamedHomePage.routeName: (ctx) => const UnnamedHomePage(),
        UnnamedShowCounterScreen.routeName: (ctx) =>
            const UnnamedShowCounterScreen(),
        NamedHomeScreen.routeName: (ctx) => BlocProvider.value(
            value: _namedCounterCubit, child: const NamedHomeScreen()),
        NamedShowCounterScreen.routeName: (ctx) => BlocProvider.value(
            value: _namedCounterCubit, child: const NamedShowCounterScreen()),
        onGenerateRouteHomeScreen.routeName: (ctx) =>
            const onGenerateRouteHomeScreen(),
      },
    );
  }

  @override
  void dispose() {
    _namedCounterCubit.close();
    _generateCounterCubit.close();
    super.dispose();
  }
}
