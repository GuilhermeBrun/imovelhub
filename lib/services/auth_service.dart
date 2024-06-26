import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?>? _firebaseUser;
  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser!.bindStream(_auth.authStateChanges());

    ever(_firebaseUser!, (User? user) {
      if (user != null) {
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  User get user => _firebaseUser!.value!;

  static AuthService get to => Get.find<AuthService>();

  createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
