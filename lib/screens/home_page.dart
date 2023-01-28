import 'package:flutter/material.dart';
import 'package:testapp/repositories/weather_repository.dart';
import 'package:testapp/services/weather_api_services.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
