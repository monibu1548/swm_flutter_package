import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/home/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeModel _model;

  HomeViewModel() : _model = HomeModel();

  String title = 'title';
  String body = 'body';
}