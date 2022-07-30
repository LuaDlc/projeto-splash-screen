import 'package:flutter/cupertino.dart';
import 'package:projeto_splash_screen/models/post_model.dart';
import 'package:projeto_splash_screen/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;
  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);
  

  fetch() async {
    posts.value = await _homeRepository.getList();
  }
}