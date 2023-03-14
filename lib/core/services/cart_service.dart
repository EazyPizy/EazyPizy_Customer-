import 'package:eazymen_customer/core/logger.dart';
import 'package:eazymen_customer/core/routes.dart';
import 'package:eazymen_customer/core/services/customer_service.dart';
import 'package:eazymen_customer/modules/Cart/View_Cart.dart';
import 'package:eazymen_customer/modules/EazymanProfile/model_subService_product.dart';
import 'package:eazymen_customer/modules/home/models/model_home.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class EazyMenCartModel {
  EazyMenCartModel({
    required this.eazyMen,
    required this.product,
    required this.itemTotal,
    this.tax = 0,
    required this.grandTotal,
  });

  final EazyMenModel eazyMen;
  final SubServiceProductModel product;
  final int itemTotal;
  final double tax;
  final double grandTotal;
}

class CartService extends GetxService {
  static CartService get instance => Get.find<CartService>();
  final Logger _log = getLogger('Cart Service');

  EazyMenCartModel? _cart;
  EazyMenCartModel? get cart => _cart;

  Future<CartService> init() async {
    // TODO: check if the user is logged in
    if (true) {}
    return this;
  }

  EazyMenCartModel _makeCartModel(
    EazyMenModel eazyMen,
    SubServiceProductModel product,
  ) {
    return EazyMenCartModel(
      eazyMen: eazyMen,
      product: product,
      itemTotal: 0,
      grandTotal: 0,
    );
  }

  void checkout() {
    if (CustomerService.instance.isLoggedIn) {
      // ! : to checkout
      Get.toNamed(Routes.checkout);
    } else {
      // ! : Login sheet
      _log.v('No customer found');
      enterMobileNumber();
    }
  }

  Future<void> addToCart({
    required EazyMenModel eazyMen,
    required SubServiceProductModel product,
  }) async {
    final cartItem = _makeCartModel(eazyMen, product);
    _cart = cartItem;
    _log.v('Item added to cart');
  }

  Future<void> clearCart() async {}
}
