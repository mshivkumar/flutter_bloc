import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testapp/EventTransformer/blocs/counter/counter_bloc.dart';
import 'package:testapp/EventTransformer/screens/event_trans_home_page.dart';
import 'package:testapp/hyderatedBloc/blocs/counter/hydrated_counter_bloc.dart';
import 'package:testapp/hyderatedBloc/blocs/theme/theme_bloc.dart';
import 'package:testapp/hyderatedBloc/screens/hyderated_home_screen.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => HydratedThemeBloc()),
        BlocProvider(create: (BuildContext context) => HydratedCounterBloc()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: context.watch<HydratedThemeBloc>().state.appTheme ==
                  AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const HomePage(),
          routes: {
            EventTransformerHomePage.routeName: (ctx) => BlocProvider(
                create: (BuildContext context) => EventTransformerCounterBloc(),
                child: const EventTransformerHomePage()),
            HyderatedHomeScreen.routeName: (ctx) => const HyderatedHomeScreen(),
          },
        );
      }),
    );
  }
}
