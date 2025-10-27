class UsersModel {
  int? id_user;
  final name;
  final birth_date;
  final image;
  final type;
  final state;

  UsersModel({
    this.id_user,
    required this.name,
    required this.birth_date,
    required this.image,
    required this.type,
    required this.state,
  });

  factory UsersModel.fromMap(Map<String, dynamic> mapa) {
    return UsersModel(
      id_user: mapa['id_user'],
      name: mapa['name'],
      birth_date: mapa['birth_date'],
      image: mapa['image'],
      type: mapa['type'],
      state: mapa['state'],
    );
  }
}
