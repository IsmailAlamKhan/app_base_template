import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:getx_starter/statemanagement/statemanagement.dart';

enum CudState {
  Add,
  Update,
  Delete,
}

abstract class BaseProvider<T extends BaseModel> extends GetConnect {
  ///TODO API Address
  final String apiAddress = '';
  @override
  void onInit() {
    httpClient.baseUrl = apiAddress;
    super.onInit();
  }

  Future<List<T>> getList(
    String url,
    Decoder<T> decoder,
  ) async {
    final Response res = await get(
      url,
      decoder: decoder,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      return res.body;
    }
  }

  Future<String> cud(CudState cudState, String url, {T data, int id}) async {
    Response res;
    switch (cudState) {
      case CudState.Add:
        res = await post(
          url,
          data.toJson(),
        );
        break;
      case CudState.Update:
        res = await put(
          url,
          data.toJson(),
        );
        break;
      case CudState.Delete:
        res = await delete(
          "$url?id=$id",
        );
        break;
      default:
        return Future.error('No cudState');
        break;
    }
    if (res.hasError) {
      return Future.error(res.statusText);
    } else {
      return Future.value('$T sucessfully Updated');
    }
  }
}
