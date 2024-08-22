import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Authservice{
  // Google signin
  signInWithGoogle() async{
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    // create a new creential for users
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    // finally lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

