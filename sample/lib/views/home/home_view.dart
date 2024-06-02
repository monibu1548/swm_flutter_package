import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title),),
      body: Center(
        child: Text(viewModel.body),
      ),
    );
  }
}