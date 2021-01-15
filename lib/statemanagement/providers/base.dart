import 'package:get/get_connect/connect.dart';
import 'package:getx_starter/statemanagement/statemanagement.dart';

enum CurdState {
  Add,
  Update,
  Delete,
}

abstract class BaseProvider<T extends BaseModel> extends GetConnect {
  ///TODO Own API Address
  final String apiAddress = '';
  @override
  void onInit() {
    httpClient.baseUrl = apiAddress;
    super.onInit();
  }

  Future<List<Map<String, dynamic>>> getList(
    String url,
  ) async {
    final Response res = await get(
      url,
    );
    if (res.status.hasError) {
      return Future.error(res.statusText);
    } else {
      return res.body;
    }
  }

  Future<String> cud(CurdState curdState, String url, {T data, int id}) async {
    Response res;
    switch (curdState) {
      case CurdState.Add:
        res = await post(
          url,
          data.toJson(),
        );
        break;
      case CurdState.Update:
        res = await put(
          url,
          data.toJson(),
        );
        break;
      case CurdState.Delete:
        res = await delete(
          "$url?id=$id",
        );
        break;
      default:
        return Future.error('No curdState');
        break;
    }
    if (res.hasError) {
      return Future.error(res.statusText);
    } else {
      return Future.value('$T sucessfully Updated');
    }
  }
}
