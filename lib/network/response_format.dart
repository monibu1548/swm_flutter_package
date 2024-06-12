/// API 응답 형식을 정의하는 클래스.
/// 제네릭 타입 T는 JSON으로부터 파싱될 객체 타입을 나타냅니다.
class ResponseFormat<T> {
  /// 응답 코드.
  final int code;

  /// 응답 메시지.
  final String message;

  /// 응답 결과. 제네릭 타입 T 또는 null일 수 있습니다.
  final T? result;

  /// 생성자.
  ResponseFormat({
    required this.code,
    required this.message,
    this.result,
  });

  /// JSON으로부터 ResponseFormat 객체를 생성하는 팩토리 생성자.
  /// [json]은 응답 JSON 객체이며, [fromJsonT]는 제네릭 타입 T를 파싱하는 함수입니다.
  factory ResponseFormat.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    T? parsedResult;
    if (json['result'] != null) {
      parsedResult = fromJsonT(json['result']);
    } else {
      parsedResult = null;
    }

    return ResponseFormat(
      code: json['code'],
      message: json['message'],
      result: parsedResult,
    );
  }
}

/// JSON 응답에서 결과가 없는 경우를 나타내는 클래스.
class EmptyResult {
  /// 생성자.
  EmptyResult();

  /// JSON으로부터 EmptyResult 객체를 생성하는 팩토리 생성자.
  /// [json]은 응답 JSON 객체입니다.
  factory EmptyResult.fromJson(Map<String, dynamic> json) {
    return EmptyResult();
  }
}