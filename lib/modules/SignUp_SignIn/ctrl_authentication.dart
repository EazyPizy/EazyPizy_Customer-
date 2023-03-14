import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazymen_customer/core/logger.dart';
import 'package:eazymen_customer/core/services/customer_service.dart';
import 'package:eazymen_customer/modules/Cart/View_Cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class AuthenticationController extends GetxController {
  final Logger _log = getLogger('AuthenticationController Controller');

  final mobileNumberController = TextEditingController();
  final otpController = TextEditingController();

  late String _verificationId;

  Future<void> verifyOtp() async {
    final otp = otpController.text.trim();
    _log.i('OTP - $otp');
    await _signIn(
      PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      ),
    );
  }

  Future<void> _signIn(PhoneAuthCredential credentials) async {
    try {
      _log.v('signing in...');
      final userCredentials = await FirebaseAuth.instance.signInWithCredential(
        credentials,
      );

      if (userCredentials.additionalUserInfo?.isNewUser == true) {
        _log.v('new customer, setting customer...');
        final customer = CustomerModel(
          id: userCredentials.user!.uid,
          phoneNumber: userCredentials.user!.phoneNumber!,
        );
        await FirebaseFirestore.instance
            .collection('Customers')
            .doc(customer.id)
            .set(customer.toJson());
      } else {
        /// if old user
      }
      Get.back();
      Get.back();
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
    final number = mobileNumberController.text.trim();
    _log
      ..v('Sending OTP...')
      ..i(number);
    try {
      _validateNumber(mobileNumberController);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 $number',
        verificationCompleted: (phoneAuthCredential) {
          _log.v('Verification completed');
          _signIn(phoneAuthCredential);
        },
        verificationFailed: (error) {
          _log
            ..v('verificationFailed:')
            ..i(error);
        },
        codeSent: (verificationId, forceResendingToken) {
          _log.v('OTP sent');
          _verificationId = verificationId;
          // Get.back();
          enterOTP();
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _log.v('codeAutoRetrievalTimeout');
        },
      );
    } catch (e) {
      _log.e(e);
    }
  }

  void _validateNumber(TextEditingController mobileNumberController) {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    otpController.dispose();
    mobileNumberController.dispose();
  }
}
