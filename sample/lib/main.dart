import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/home/home_view.dart';
import 'package:flutter_package_sample/views/home/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(const PackageSampleApp());
}

class PackageSampleApp extends StatelessWidget {
  const PackageSampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext content) => HomeViewModel())
        ],
        child: HomeView(),
      ),
    );
  }
}
