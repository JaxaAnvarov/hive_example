import 'package:flutter/material.dart';
import 'package:hive_example/hive_model/user_hive_model.dart';
import 'package:hive_example/service/user_hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Hive.box('usersBox').clear();
    UserHiveService().getUsers().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: Hive.box('usersBox').listenable(),
            builder: (context, Box box, widget) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  UsersModel users = box.get(index);
                  return Text(users.name.toString());
                },
                itemCount: box.length,
              );
            },
          ),
        ));
  }

  appBar() {
    return AppBar(
      title: const Text(
        'Home Page',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
