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
      id: map['userId'],
      name: map['userName'],
      email: map['userEmail'],
      photoUrl: map['userPhotoUrl'],
      createdAt: map['userCreatedAt'] != null ? DateTime.parse(map['userCreatedAt']) : DateTime.now(),
      authToken: TokenDTO.fromMap(map['authToken']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': id,
      'userName': name,
      'userEmail': email,
      'userPhotoUrl': photoUrl,
      'userCreatedAt': createdAt.toIso8601String(),
      'authToken': authToken.toMap(),
    };
  }
}
