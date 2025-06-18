class UserProfileEntity {
  final String id;
  final String name;
  final String email;

  const UserProfileEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  UserProfileEntity copyWith({String? id, String? name, String? email}) {
    return UserProfileEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
