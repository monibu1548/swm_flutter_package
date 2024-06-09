import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swm_flutter_package/services/auth_service.dart';

class ApiClient {
  // 생성자에서 baseUrl을 설정하고, authService 인스턴스를 생성합니다.
  ApiClient(this.baseUrl) : authService = FPAuthService();

  final String baseUrl;
  final FPAuthService authService;

  // 공통 헤더를 생성하는 메서드입니다.
  // JWT 토큰을 가져와서 Authorization 헤더에 추가합니다.
  Map<String, String> _getHeaders() {
    final token = authService.getJWTToken();
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // GET 요청을 처리하는 메서드입니다.
  // 지정된 endpoint로 GET 요청을 보내고 응답을 처리합니다.
  Future<String> get(String endpoint) async {
    final headers = _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return _handleResponse(response);
  }

  // POST 요청을 처리하는 메서드입니다.
  // 지정된 endpoint로 POST 요청을 보내고 응답을 처리합니다.
  Future<String> post(String endpoint, Object? body) async {
    final headers = _getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  // DELETE 요청을 처리하는 메서드입니다.
  // 지정된 endpoint로 DELETE 요청을 보내고 응답을 처리합니다.
  Future<String> delete(String endpoint, Object? body) async {
    final headers = _getHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  // HTTP 응답을 처리하는 메서드입니다.
  // 상태 코드가 200-299일 경우 응답 본문을 반환하고, 그렇지 않으면 예외를 발생시킵니다.
  String _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}