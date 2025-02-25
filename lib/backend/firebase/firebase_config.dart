import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyASYoz0Sh48XSuWtSUkvZ0uepw5CUWpyxA",
            authDomain: "rh-positivo-36e08.firebaseapp.com",
            projectId: "rh-positivo-36e08",
            storageBucket: "rh-positivo-36e08.firebasestorage.app",
            messagingSenderId: "416740174321",
            appId: "1:416740174321:web:048f8937313182b868bc50",
            measurementId: "G-R0R1LL85BQ"));
  } else {
    await Firebase.initializeApp();
  }
}
