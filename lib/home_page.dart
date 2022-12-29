import 'package:flutter/material.dart';
import 'package:testapp/Counter-Cubit/screens/counter_cubit_home_page.dart';
import 'package:testapp/Cubit-2-Cubit-Communication/screens/cubit_communication_home_page.dart';
import 'package:testapp/Theme-Bloc/screens/theme_bloc_home_page.dart';
import 'package:testapp/Theme-Cubit/screens/theme_cubit_home_page.dart';

import 'Counter-Bloc/screens/counter_bloc_home_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Counter-Cubit'),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CounterCubitHomePage.routeName);
                  },
                ),
                ListTile(
                  title: const Text('Counter-Bloc'),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CounterBlocHomePage.routeName);
                  },
                ),
                ListTile(
                  title: const Text('Theme-Cubit'),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ThemeCubitHomePage.routeName);
                  },
                ),
                ListTile(
                  title: const Text('Theme-Bloc'),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ThemeBlocHomePage.routeName);
                  },
                ),
                ListTile(
                  title: const Text('Cubit-2-Cubit'),
                  trailing: const Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CubitCommunicationHomePage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
