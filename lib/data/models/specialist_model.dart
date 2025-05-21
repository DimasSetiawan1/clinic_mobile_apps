class SpecialistModel {
  int? id;
  String? name;

  SpecialistModel({required this.id, required this.name});

  //to json
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  //from map
  factory SpecialistModel.fromMap(Map<String, dynamic> map) {
    return SpecialistModel(
      id: map['id'],
      name: map['name'],
    );
  }

  //tolist
  static List<SpecialistModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((e) => SpecialistModel.fromMap(e)).toList();
  }


}
