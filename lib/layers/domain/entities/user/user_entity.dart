import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? lastAccessAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.createdAt,
    this.updatedAt,
    this.lastAccessAt,
  });

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastAccessAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastAccessAt: lastAccessAt ?? this.lastAccessAt,
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
