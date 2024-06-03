import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swm_flutter_package/entities/user.dart';

class FPAuthService {
  FPAuthService();

  /// 현재 사용자가 로그인되어 있는지 확인합니다.
  bool isSignedIn() {
    return getCurrentUser() != null;
  }

  /// 현재 사용자의 인증 상태 변경을 스트림으로 반환합니다.
  Stream<FPUser?> getUserStream() {
    return Supabase.instance.client.auth.onAuthStateChange.map((event) => event.session?.user.toFPUser());
  }

  /// 현재 인증된 사용자를 가져옵니다. (있다면)
  FPUser? getCurrentUser() {
    return Supabase.instance.client.auth.currentSession?.user.toFPUser();
  }

  /// 현재 세션의 JWT 액세스 토큰을 가져옵니다.
  String? getJWTToken() {
    return Supabase.instance.client.auth.currentSession?.accessToken;
  }

  /// Kakao OAuth Provider를 사용하여 사용자를 로그인합니다.
  /// redirectTo에는 로그인 완료 후 돌아올 링크(현재 앱의 app scheme)을 입력합니다.
  Future<bool> signInWithKakao({required String appScheme}) async {
    return await Supabase.instance.client.auth.signInWithOAuth(
        OAuthProvider.kakao,
        authScreenLaunchMode: LaunchMode.externalApplication,
        redirectTo: appScheme
    );
  }

  /// 사용자를 익명으로 로그인합니다.
  /// Supabase Console > Project Settings > Authentication > Allow anonymous sign-ins를 먼저 활성화해야합니다.
  Future<void> signInAnonymously() async {
    await Supabase.instance.client.auth.signInAnonymously();
    return;
  }

  /// 현재 사용자를 로그아웃합니다.
  Future<void> signOut() async {
    return await Supabase.instance.client.auth.signOut();
  }
}