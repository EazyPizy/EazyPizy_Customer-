import 'package:eazymen_customer/core/logger.dart';
import 'package:eazymen_customer/core/services/cart_service.dart';
import 'package:eazymen_customer/core/services/category_services.dart';
import 'package:eazymen_customer/modules/EazymanProfile/model_subService_product.dart';
import 'package:eazymen_customer/modules/home/ctrl_home.dart';
import 'package:eazymen_customer/modules/home/models/main_category.dart';
import 'package:eazymen_customer/modules/home/models/model_home.dart';
import 'package:eazymen_customer/modules/home/models/subService_category.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ProfileController extends GetxController {
  ProfileController(this.eazyMen);
  final EazyMenModel eazyMen;
  final List<MainCategoryModel> mainCategories =
      CategoryService.instance.mainServiceCategories;

  late final List<MainCategoryModel> userCategories;
  final List<SubServiceModel> userSubServiceCategories = [];
  final List<SubServiceProductModel> userSubServiceProducts = [];

  final Logger _log = getLogger('Profile Controller');
  bool loading = false;

  List<SubServiceProductModel> getSubServiceProduct(
    SubServiceModel subService,
  ) {
    final data = <SubServiceProductModel>[];
    for (final element in userSubServiceProducts) {
      if (element.subServiceIDs!.contains(subService.subServiceId)) {
        data.add(element);
      }
    }
    return data;
  }

  Future<void> getUserSubServices() async {
    loading = true;
    update();
    try {
      if (userCategories.isEmpty) {
        _log.i('Empty main Category');
        return;
      }
      // final data = await FirebaseFirestore.instance
      //     .collection('SubServiceCategory')
      //     .where(
      //       'SubServiceID',
      //       whereIn: eazyMen.subServices,
      //       // arrayContains: Get.find<HomeController>()
      //       //     .categories
      //       //     .map((e) => e.serviceId)
      //       //     .toList(),
      //       // arrayContains: [userCategories[0].serviceId],
      //     )
      //     .get();

      final data = CategoryService.instance.subServiceCategories;

      // print(data.docs);
      for (final element in data) {
        if (eazyMen.subServices!.contains(element.subServiceId)) {
          userSubServiceCategories.add(element);
        }
      }
    } catch (e) {
      _log.e(e.toString());
    } finally {
      loading = false;
      update();
    }
  }

  Future<void> getUserServiceProducts() async {
    print(eazyMen.subServiceProdcuts);
    // final data = await FirebaseFirestore.instance
    //     .collection('ServiceProducts')
    //     .where(
    //       'ServiceProductID',
    //       whereIn: eazyMen.subServiceProdcuts,
    //       // arrayContains: Get.find<HomeController>()
    //       //     .categories
    //       //     .map((e) => e.serviceId)
    //       //     .toList(),
    //       // arrayContains: [userCategories[0].serviceId],
    //     )
    //     .get();

    final data = CategoryService.instance.serviceProducts;

    // print(jsonEncode(data.docs[0].data()));
    for (final element in eazyMen.subServiceProdcuts ?? []) {
      userSubServiceProducts.add(
        data.firstWhere(
          (serviceProduct) => serviceProduct.serviceProductId == element,
        ),
      );
    }
    update();
  }

  void addToCart(SubServiceProductModel product) {
    CartService.instance.addToCart(eazyMen: eazyMen, product: product);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userCategories = Get.find<HomeController>()
        .categories
        .where((mainCat) => eazyMen.mainServices!.contains(mainCat.serviceId))
        .toList();
    getUserSubServices();
    getUserServiceProducts();
  }
}
