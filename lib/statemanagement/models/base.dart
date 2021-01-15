abstract class BaseModel<T> {
  BaseModel();
  BaseModel.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

  void copyWith(T newData);
}
