import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swm_flutter_package/network/response_format.dart';
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
  Future<ResponseFormat<T>> get<T>(String endpoint, T Function(Map<String, dynamic>) fromJsonT) async {
    final headers = _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return _handleResponse<T>(response, fromJsonT);
  }

  // POST 요청을 처리하는 메서드입니다.
  // 지정된 endpoint로 POST 요청을 보내고 응답을 처리합니다.
  Future<ResponseFormat<T>> post<T>(String endpoint, Object? body, T Function(Map<String, dynamic>) fromJsonT) async {
    final headers = _getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
    return _handleResponse<T>(response, fromJsonT);
  }

  // DELETE 요청을 처리하는 메서드입니다.
  // 지정된 endpoint로 DELETE 요청을 보내고 응답을 처리합니다.
  Future<ResponseFormat<T>> delete<T>(String endpoint, Object? body, T Function(Map<String, dynamic>) fromJsonT) async {
    final headers = _getHeaders();
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
    return _handleResponse<T>(response, fromJsonT);
  }

  // HTTP 응답을 처리하는 메서드입니다.
  // 상태 코드가 200-299일 경우 응답 본문을 반환하고, 그렇지 않으면 예외를 발생시킵니다.
  ResponseFormat<T> _handleResponse<T>(http.Response response, T Function(Map<String, dynamic>) fromJsonT) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return ResponseFormat<T>.fromJson(jsonResponse, fromJsonT);
    } else {
      return ResponseFormat(code: -999, message: "Parsing Error", result: null);
    }
  }
}