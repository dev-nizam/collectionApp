class CostomerRegisterModel {
  CostomerRegisterModel({
    this.success,
    this.massage,
  });

  CostomerRegisterModel.fromJson(dynamic json) {
    success = json['success'];
    massage = json['massage'];
  }

  bool? success;
  String? massage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['massage'] = massage;
    return map;
  }
}
