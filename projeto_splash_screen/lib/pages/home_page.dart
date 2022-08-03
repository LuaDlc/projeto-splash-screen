import 'package:flutter/material.dart';
import 'package:projeto_splash_screen/repositories/home_repository_imp.dart';

import '../controllers/home_controller.dart';
import '../models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              leading: Text(list[idx].id.toString()),
              title: Text(list[idx].title),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.of(context).pushNamed('/details',
              arguments: list[idx],
              ),
            ),
            separatorBuilder: (_, __) => Divider(),
            );
        }
      ),
    );
  }
}