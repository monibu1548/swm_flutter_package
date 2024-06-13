library swm_flutter_package;

import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FPKit {
  static Supabase? _supabase;
  static FirebaseApp? _firebaseApp;

  static Future initialize({required String url, required String anonKey}) async {
    _supabase = await Supabase.initialize(
      url: url,
      anonKey: anonKey,
    );

    _firebaseApp = await Firebase.initializeApp();
  }
}
