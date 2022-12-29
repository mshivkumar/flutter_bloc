import 'package:flutter/material.dart';
import 'package:testapp/Counter-Cubit/screens/counter_cubit_home_page.dart';

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
