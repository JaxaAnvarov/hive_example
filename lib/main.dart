import 'package:flutter/material.dart';
import 'package:hive_example/core/routes/routes.dart';
import 'package:hive_example/hive_model/user_hive_model.dart';
import 'package:hive_example/provider/hive_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UsersModelAdapter());
  await Hive.openBox('usersBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (contexst) => HiveProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return AppRoutes.generateRoute(settings);
      },
    );
  }
}
