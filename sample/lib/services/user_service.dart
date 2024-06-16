import 'package:swm_flutter_package/entities/user.dart';
import 'package:swm_flutter_package/network/api_client.dart';
import 'package:swm_flutter_package/network/response_format.dart';
import 'package:swm_flutter_package/services/auth_service.dart';

class UserService {
  // API 클라이언트 인스턴스를 생성하여 사용자 API 엔드포인트 설정
  ApiClient apiClient = ApiClient('https://dthvcgffzopawocgahnr.supabase.co/functions/v1/api/users');
  FPAuthService authService = FPAuthService();

  // 현재 로그인한 사용자 정보를 가져오는 메서드
  FPUser? getCurrentUser() {
    return authService.getCurrentUser();
  }

  // FCM 토큰을 삽입 또는 업데이트하는 메서드
  Future<void> upsertFCMToken({required String fcmToken}) async {
    return apiClient.post<EmptyResult>('/v1/fcmToken', {'fcmToken': fcmToken}, (json) => EmptyResult.fromJson(json))
        .then((value) => print(value)) // 성공 응답을 출력
        .catchError((error) => print(error)); // 에러를 출력
  }

  // FCM 토큰을 삭제하는 메서드
  Future<void> deleteFCMToken({required String fcmToken}) async {
    return apiClient.delete<EmptyResult>('/v1/fcmToken', {'fcmToken': fcmToken}, (json) => EmptyResult.fromJson(json))
        .then((value) => print(value)) // 성공 응답을 출력
        .catchError((error) => print(error)); // 에러를 출력
  }

  Future<void> signOut() async {
    await deleteFCMToken(fcmToken: "TODO: FCM 토큰을 가져오는 코드를 작성하세요.");
    return authService.signOut();
  }
}