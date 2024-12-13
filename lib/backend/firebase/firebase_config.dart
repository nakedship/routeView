import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDMNTz09l5q44I_bw5K4yuY1ckA27nI7KA",
            authDomain: "nakedship-85d7c.firebaseapp.com",
            projectId: "nakedship-85d7c",
            storageBucket: "nakedship-85d7c.appspot.com",
            messagingSenderId: "1018177935145",
            appId: "1:1018177935145:web:73d0f153b108029cda4938",
            measurementId: "G-51J1SSBP71"));
  } else {
    await Firebase.initializeApp();
  }
}
