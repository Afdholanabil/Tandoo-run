import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tandu_run/routes/app_routes.dart';
import 'package:tandu_run/services/sharedPreference/user.dart';
import 'package:tandu_run/utils/app_style.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String emailP, String passP) async {
    try {
      await auth.signInWithEmailAndPassword(email: emailP, password: passP);
      Get.snackbar("Berhasil Masuk", "Selamat Datang ${emailP}",
          backgroundColor: green, colorText: white);

      User? user = auth.currentUser;
      await UserData().addUser(emailP);
      Get.toNamed(Routes.dashboard);

// Memeriksa apakah pengguna sudah diotentikasi
      if (user != null) {
        print('Pengguna sudah diotentikasi dengan email: ${user.email}');
        // Lanjutkan ke akses Firebase Storage atau tindakan lain yang memerlukan autentikasi
      } else {
        print('Pengguna belum diotentikasi');
        // Redirect ke layar login atau tampilkan pesan bahwa pengguna harus login
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        print("Password yang dimasukkan salah");
        Get.snackbar("Gagal Login !", "Email atau password salah",
            backgroundColor: oren, colorText: white);
      } else if (e.code == 'too-many-requests') {
        print("Terlalu banyak percobaan login gagal, coba lagi nanti");
        Get.snackbar("Gagal Login !",
            "Terlalu banyak percobaan login gagal. Coba lagi nanti atau reset password Anda.",
            backgroundColor: oren, colorText: white);
      } else {
        print("FirebaseAuthException: ${e.code}");
        Get.snackbar("Terjadi kesalahan", "Coba beberapa saat lagi !",
            backgroundColor: oren, colorText: white);
      }

      // Get.snackbar("Terjadi kesalahan", "Coba beberapa saat lagi !",
      //     backgroundColor: oren, colorText: white);
    }
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Get.snackbar("Berhasil Keluar", "");
      Get.offAllNamed(Routes.login);
      Get.snackbar(
          "Berhasil Keluar", "Masukan alamat email dan password untuk login!",
          backgroundColor: green, colorText: white);
    } catch (r) {
      print("error:" + r.toString());
      Get.snackbar("Gagal Keluar", "Terdapat kesalahan, harap coba lagi nanti!",
          backgroundColor: oren, colorText: white);
    }
  }

  void resetPW(String emailP) async {
    if (emailP != "" && GetUtils.isEmail(emailP)) {
      try {
        // Periksa apakah email sudah terdaftar
        var methods =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailP);

        if (methods.isNotEmpty) {
          // Email terdaftar, kirim reset password
          await FirebaseAuth.instance.sendPasswordResetEmail(email: emailP);

          Get.defaultDialog(
            confirmTextColor: hitam2,
            buttonColor: green,
            title: "Berhasil",
            middleText: "Cek email anda untuk melanjutkan reset password.",
            onConfirm: () {
              Get.back();
              Get.back();
            },
            textConfirm: "Ya, saya mengerti",
          );
        } else {
          // Email tidak terdaftar
          Get.defaultDialog(
            confirmTextColor: hitam2,
            buttonColor: oren,
            title: "Terjadi Kesalahan",
            middleText: "Email tidak terdaftar.",
          );
        }
      } catch (e) {
        print("error:" + e.toString());
        Get.defaultDialog(
          confirmTextColor: hitam2,
          buttonColor: oren,
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat mengirimkan reset password.",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email tidak valid",
        confirmTextColor: hitam2,
        buttonColor: oren,
      );
    }
  }

  void resetPW2(String emailP) async {
    if (emailP != "" && GetUtils.isEmail(emailP)) {
      try {
        // Periksa apakah email sudah terdaftar

        Get.defaultDialog(
          confirmTextColor: hitam2,
          buttonColor: green,
          title: "Berhasil",
          middleText: "Cek email anda untuk melanjutkan reset password.",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya, saya mengerti",
        );
      } catch (e) {
        print("error:" + e.toString());
        Get.defaultDialog(
          confirmTextColor: hitam2,
          buttonColor: oren,
          title: "Terjadi Kesalahan",
          middleText: "Tidak dapat mengirimkan reset password.",
        );
      }
    } else {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Email tidak valid",
        confirmTextColor: hitam2,
        buttonColor: oren,
      );
    }
  }
}
