import 'package:eazymen_customer/core/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthenticationController extends GetxController {
  final Logger _log = getLogger('AuthenticationController Controller');

  late String _verificationId;

  Future<void> verifyOtp() async {
    try {
      await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: 'smsCode',
        ),
      );
    } on FirebaseAuthException catch (e) {
      _log.e(e);
      if (e.code == 'invalid-verification-code') {
        // TODO: implement wrong otp dealing
      }
    } catch (e) {
      _log.e(e);
    }
  }

  Future<void> sendOtp() async {
    _log.v('Sending OTP...');
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 8887696014',
        verificationCompleted: (phoneAuthCredential) {
          _log.v('Verification completed');
        },
        verificationFailed: (error) {
          _log
            ..v('verificationFailed:')
            ..i(error);
        },
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      _log.e(e);
    }
  }
}
