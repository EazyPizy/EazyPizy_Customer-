import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazymen_customer/core/logger.dart';
import 'package:eazymen_customer/core/typedefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CustomerModel {
  CustomerModel({
    required this.id,
    required this.phoneNumber,
    this.name,
    this.address,
    this.pincode,
  });
  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json['id'] as String,
        phoneNumber: json['phoneNumber'] as String,
        address: json['address'] != null
            ? List.from(json['address'] as Iterable)
            : null,
        name: json['name'] as String?,
        pincode: json['pincode'] as String?,
      );

  DynamicMap toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'pincode': pincode,
        'phoneNumber': phoneNumber
      };

  final String id;
  final String phoneNumber;
  final String? name;
  final List<String>? address;
  final String? pincode;

  /// if the customer has address and name to complete checkout
  bool isApplicable() {
    if (address != null && name != null) {
      return true;
    }
    return false;
  }
}

class CustomerService extends GetxService {
  static CustomerService get instance => Get.find<CustomerService>();
  final Logger _log = getLogger('Customer Service');

  final _firebaseAuth = FirebaseAuth.instance;

  CustomerModel? _customer;

  /// returns true if user is logged in, else false
  bool get isLoggedIn => _firebaseAuth.currentUser != null;

  /// null if the customer is not logged in.
  CustomerModel? get customer => _customer;

  Stream<User?> stateChange() => _firebaseAuth.authStateChanges();

  /// fetches the customer if they are logged in
  Future<CustomerService> init() async {
    if (isLoggedIn) {
      // TODO: change to offline fetch
      _log.v('Getting logged in customer...');
      _customer = CustomerModel.fromJson(
        (await FirebaseFirestore.instance
                .collection('Customers')
                .doc(_firebaseAuth.currentUser!.uid)
                .get())
            .data()!,
      );
      _log.i(_customer);
    }
    return this;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    // TODO: delete from offline storage
  }
}
