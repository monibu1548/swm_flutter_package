import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/root/root_view.dart';
import 'package:flutter_package_sample/views/root/root_view_model.dart';
import 'package:provider/provider.dart';
import 'package:swm_flutter_package/swm_flutter_package.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FPKit.initialize(
      url: "https://dthvcgffzopawocgahnr.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR0aHZjZ2Zmem9wYXdvY2dhaG5yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTczMjcwMzgsImV4cCI6MjAzMjkwMzAzOH0.tLleczwXkLzkDHPqJfea_SFG0FddBFjbNq1WXBcBEeA"
  );
  runApp(const PackageSampleApp());
}

class PackageSampleApp extends StatelessWidget {
  const PackageSampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter Package Sample',
      theme: ThemeData(
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext content) => RootViewModel())
        ],
        child: RootView(),
      ),
    );
  }
}
