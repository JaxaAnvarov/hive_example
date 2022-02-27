import 'package:dio/dio.dart';
import 'package:hive_example/core/constants/base_url.dart';
import 'package:hive_example/hive_model/user_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserHiveService {
  late Box<UsersModel> userBox;
  Future<List<UsersModel>> getUsers() async {
    Response response = await Dio().get(BaseUrl.usersUrl);
    return (response.data as List).map((e) {
      Hive.box('usersBox').add(UsersModel.fromJson(e));
      return UsersModel.fromJson(e);
    }).toList();
  }
}
