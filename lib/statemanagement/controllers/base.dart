import 'package:get/get.dart';
import 'package:getx_starter/statemanagement/statemanagement.dart';

abstract class BaseController<T extends BaseModel> extends GetxController
    with StateMixin<List<T>> {
  final list = <T>[].obs;
  Future<void> fetchList(String url);
  Future<void> addData(String url, T data);
  Future<void> updateData(String url, T data);
  Future<void> deleteData(String url, int id);
}
