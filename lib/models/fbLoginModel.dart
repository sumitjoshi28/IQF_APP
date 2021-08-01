class FbLoginModel {
  final String name;
  FbLoginModel({required this.name});
  FbLoginModel.fromJson(Map<String, dynamic> json) : name = json['name'];
  Map<String, dynamic> toJson() => {'name': name};
}
