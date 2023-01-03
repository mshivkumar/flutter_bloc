import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testapp/named_route/cubit/counter/counter_cubit.dart';
import 'package:testapp/named_route/screens/named_home_screen.dart';
import 'package:testapp/named_route/screens/named_show_counter_screen.dart';
import 'package:testapp/unnamed_route/cubit/counter/counter_cubit.dart';
import 'package:testapp/unnamed_route/screens/unamed_show_counter_screen.dart';
import 'package:testapp/unnamed_route/screens/unnamed_home_page.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: const HomeScreen(),
      routes: {
        UnnamedHomePage.routeName: (ctx) => const UnnamedHomePage(),
        UnnamedShowCounterScreen.routeName: (ctx) =>
            const UnnamedShowCounterScreen(),
        NamedHomeScreen.routeName: (ctx) => BlocProvider.value(
            value: _namedCounterCubit, child: const NamedHomeScreen()),
        NamedShowCounterScreen.routeName: (ctx) => BlocProvider.value(
            value: _namedCounterCubit, child: const NamedShowCounterScreen()),
      },
    );
  }

  @override
  void dispose() {
    _namedCounterCubit.close();
    super.dispose();
  }
}
