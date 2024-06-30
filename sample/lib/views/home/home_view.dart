import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:swm_flutter_package/network/api_client.dart';
import 'package:swm_flutter_package/network/response_format.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    // HomeViewModel을 Provider를 통해 가져옴
    var viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('홈 화면'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 로그인한 유저 ID를 표시하는 텍스트 위젯
            Text(
              '로그인한 유저 ID: ${viewModel.userID()}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                // 로그아웃 버튼을 눌렀을 때의 동작
                viewModel.signOut();
              },
              child: Text('로그아웃'),
            ),
            ElevatedButton(
              onPressed: () async {
                // 로그아웃 버튼을 눌렀을 때의 동작
                await viewModel.requestPermission();
              },
              child: Text(viewModel.pushNotificationStatusText),
            ),
          ],
        ),
      ),
    );
  }
}
