class Users {
  final String id;
  final String email;
  final String name;
  final String usia;
  final String gender;
  final String profilePicture;

  Users(
    this.id,
    this.email, {
    required this.name,
    required this.usia,
    required this.gender,
    required this.profilePicture,
  });
}
