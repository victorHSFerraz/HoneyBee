import '../../../domain/domain.dart';
import '../dto.dart';

class UserDTO extends UserEntity {
  final TokenDTO authToken;

  const UserDTO({
    required id,
    required name,
    required email,
    required photoUrl,
    required createdAt,
    required this.authToken,
  }) : super(
          id: id,
          name: name,
          email: email,
          photoUrl: photoUrl,
          createdAt: createdAt,
        );

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : DateTime.now(),
      authToken: TokenDTO.fromMap(map['authToken']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'createdAt': createdAt.toIso8601String(),
      'authToken': authToken.toMap(),
    };
  }
}
