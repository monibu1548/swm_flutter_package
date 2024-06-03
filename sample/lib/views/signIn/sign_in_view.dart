import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/signIn/sign_in_view_model.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SignInViewModel>(context);

    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("카카오톡 로그인"),
                onPressed: () {
                  viewModel.signInWithKakao();
                },
              ),
              ElevatedButton(
                child: Text("익명 로그인"),
                onPressed: () {
                  viewModel.signInAnonymously();
                },
              ),
            ],
          )
      ),
    );
  }
}