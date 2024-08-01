class ReelsModel {
  final String id;
  final String admin;
  final String name;
  final int v;

  ReelsModel({
    required this.id,
    required this.admin,
    required this.name,
    required this.v,
  });

  factory ReelsModel.fromJson(Map<String, dynamic> json) {
    return ReelsModel(
      id: json['_id'],
      admin: json['admin'],
      name: json['name'],
      v: json['__v'],
    );
  }
}
