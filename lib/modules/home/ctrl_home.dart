import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eazymen_customer/core/logger.dart';
import 'package:eazymen_customer/modules/home/models/main_category.dart';
import 'package:eazymen_customer/modules/home/models/model_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  HomeController(this.widget);
  final TickerProvider widget;
  bool loading = true;
  bool catLoading = false;
  List<EazyMenModel> eazyMen = [];
  late List<MainCategoryModel> categories;

  late final TabController tabController;

  final Logger _log = getLogger('Home Controller');

  Future<void> getAllCategories() async {
    _log.v('Getting Categories');
    catLoading = true;
    update();
    try {
      final data =
          await FirebaseFirestore.instance.collection('ServiceCategory').get();
      categories = MainCategoryModel.jsonListToObject(data.docs);
    } catch (e) {
      _log.e(e.toString());
    } finally {
      catLoading = false;
      update();
    }
  }

  Future<void> getEasyMen(String serviceId) async {
    _log.v('Getting EazyMen');
    loading = true;
    update();
    eazyMen.clear();
    try {
      final data = await FirebaseFirestore.instance
          .collection('EazyMen')
          .where(
            'Main_Services',
            arrayContains: serviceId,
          )
          .get();

      if (data.docs.isNotEmpty) {
        // debugPrint(data.docs[0].data());
        for (final element in data.docs) {
          eazyMen.add(EazyMenModel.fromJson(element.data()));
        }
      }
    } catch (e) {
      _log.e(e.toString());
    } finally {
      loading = false;
      update();
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getAllCategories();
    tabController = TabController(length: categories.length, vsync: widget);
    tabController.addListener(() {
      getEasyMen(categories[tabController.index].serviceId ?? '');
    });
    await getEasyMen(categories[0].serviceId ?? '');
  }
}
