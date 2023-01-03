import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:testapp/EventTransformer/screens/event_trans_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PS3'),
      ),
      body: Scrollable(
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Event Transformer'),
                trailing: const Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.pushNamed(
                      context, EventTransformerHomePage.routeName);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
