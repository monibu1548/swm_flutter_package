import 'package:flutter/material.dart';
import 'package:flutter_package_sample/views/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:swm_flutter_package/network/api_client.dart';
import 'package:swm_flutter_package/network/response_format.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  // ApiClient 인스턴스를 생성하여 API 엔드포인트를 설정
  ApiClient apiClient = ApiClient('https://dthvcgffzopawocgahnr.supabase.co/functions/v1/api');

  @override
  Widget build(BuildContext context) {
    // HomeViewModel을 Provider를 통해 가져옴
    var viewModel = Provider.of<HomeViewModel>(context);
    // TextEditingController 인스턴스를 생성하여 TextField와 연결
    TextEditingController textController = TextEditingController();

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
            SizedBox(height: 20),
            // 사용자로부터 입력을 받을 TextField
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Token',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // API 요청을 위한 버튼들을 포함하는 Row
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // '추가' 버튼을 눌렀을 때 API의 POST 엔드포인트를 호출
                    apiClient.post<EmptyResult>('/users/v1/fcmToken', {'fcmToken': textController.text}, (json) => EmptyResult.fromJson(json))
                        .then((value) => print(value)) // 응답을 출력
                        .catchError((error) => print(error)); // 에러를 출력
                  },
                  child: Text('추가'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // '삭제' 버튼을 눌렀을 때 API의 DELETE 엔드포인트를 호출
                    apiClient.delete<EmptyResult>('/users/v1/fcmToken', {'fcmToken': textController.text}, (json) => EmptyResult.fromJson(json))
                        .then((value) => print(value)) // 응답을 출력
                        .catchError((error) => print(error)); // 에러를 출력
                  },
                  child: Text('삭제'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // '조회' 버튼을 눌렀을 때 API의 GET 엔드포인트를 호출
                    apiClient.get<FCMTokensResult>('/users/v1/fcmToken', (json) => FCMTokensResult.fromJson(json))
                        .then((value) => print(value.result?.tokens)) // 응답을 출력
                        .catchError((error) => print(error)); // 에러를 출력
                  },
                  child: Text('조회'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FCMTokensResult {
  final List<String> tokens;

  FCMTokensResult({required this.tokens});

  factory FCMTokensResult.fromJson(Map<String, dynamic> json) {
    return FCMTokensResult(tokens: List<String>.from(json['fcmTokens']));
  }
}