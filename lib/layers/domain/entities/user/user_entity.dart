import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastAccessAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.lastAccessAt,
  });

  UserEntity updateUser({
    String? name,
    String? email,
    String? photoUrl,
  }) {
    return UserEntity(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      lastAccessAt: lastAccessAt,
    );
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, photoUrl: $photoUrl, createdAt: $createdAt, updatedAt: $updatedAt, lastAccessAt: $lastAccessAt)';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        photoUrl,
        createdAt,
        updatedAt,
        lastAccessAt,
      ];
}
