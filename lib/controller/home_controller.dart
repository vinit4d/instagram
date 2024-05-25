import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../config/instagram_data.dart';
import '../models/home_screen_model.dart';

class HomeController extends GetxController {
  RxList<HomeScreenModel> posts = <HomeScreenModel>[].obs;
  Rx<TextEditingController> comment = TextEditingController().obs;



RxString data = "".obs;
  updateLike(int idx) {
    posts.value[idx].likes = !posts[idx].like!;
update();

  }

  Future<void> shuffleList()async{
    posts.shuffle();
    await Future.delayed(const Duration(seconds: 2));
  }

  fetchData() {
    List data = InstagramData.data['data'];
    try {
      posts.clear();
      for (var i in data) {
        posts.add(HomeScreenModel.fromJson(i));
      }
      posts.shuffle();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


}
