import 'package:get/get.dart';
import 'package:getx_starter/statemanagement/statemanagement.dart';

abstract class BaseRepository<T extends BaseModel> {
  Future<List<T>> getList({String url, Decoder<T> decoder});
  Future<String> add({String url, T data});
  Future<String> update({String url, T data});
  Future<String> delete({String url, int id});
}
