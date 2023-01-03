import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/NamedRoute/screens/named_home_screen.dart';
import 'package:testapp/UnnamedRoute/cubit/counter/counter_cubit.dart';
import 'package:testapp/UnnamedRoute/screens/unnamed_home_page.dart';
import 'package:testapp/onGenerateRoute/screens/generate_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PS2'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scrollable(
          viewportBuilder: (BuildContext context, ViewportOffset position) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Un Named Route'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (BuildContext context) =>
                              UnnamedCounterCubit(),
                          child: const UnnamedHomePage(),
                        ),
                      ),
                    );
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
                ListTile(
                  title: const Text('Named Route'),
                  onTap: () {
                    Navigator.pushNamed(context, NamedHomeScreen.routeName);
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
                ListTile(
                  title: const Text('onGenerate Route'),
                  onTap: () {
                    Navigator.pushNamed(context, onGenerateRouteHomeScreen.routeName);
                  },
                  trailing: const Icon(Icons.navigate_next),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
