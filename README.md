# Getx Statemanagement template for any app

Use this template as a base for your apps Statemanagement that uses Getx.

There is a BaseController with StateMixin extend your controller with BaseController.

Your model should extend BaseModel.

Your model should look like this

```
class Model extends BaseModel {
  int id;
  Model({
    this.id,
  });

  @override
  Model.fromJson(Map<String, dynamic> json);

  @override
  void copyWith(newData) {}

  @override
  Map<String, dynamic> toJson() {}
}
```

Controller

````
class MyController extends BaseController<BaseModel> {
  @override
  Future<void> addData(String url, BaseModel data) async {}

  @override
  Future<void> deleteData(String url, int id) async {}

  @override
  Future<void> fetchList(String url) async {}

  @override
  Future<void> updateData(String url, BaseModel data) async {}
}```
````
