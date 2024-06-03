import 'package:supabase_flutter/supabase_flutter.dart';

class FPUser {
  final String id;
  final Map<String, dynamic>? userMetadata;
  final String createdAt;
  final String? lastSignInAt;
  final bool isAnonymous;

  const FPUser({
    required this.id,
    required this.userMetadata,
    required this.createdAt,
    this.lastSignInAt,
    this.isAnonymous = false,
  });
}

extension SupabaseUserExtension on User {
  FPUser toFPUser() {
    return FPUser(id: id, userMetadata: userMetadata, createdAt: createdAt);
  }
}