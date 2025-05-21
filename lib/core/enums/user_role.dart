enum UserRole {
  admin('admin'),
  patient('patient'),
  doctor('doctor');

  final String value;
  const UserRole(this.value);

  factory UserRole.fromString(String role) {
    return UserRole.values.firstWhere(
      (e) => e.value == role,
      orElse: () => throw ArgumentError('Invalid UserRole: $role'),
    );
  }
}
