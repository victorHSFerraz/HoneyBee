import '../../../domain/domain.dart';
import '../dto.dart';

class UserDTO extends UserEntity {
  final String userId;
  final String userName;
  final String userEmail;
  final String userPhotoUrl;
  final DateTime userCreatedAt;
  final TokenDTO authToken;

  const UserDTO({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhotoUrl,
    required this.userCreatedAt,
    required this.authToken,
  }) : super(
          id: userId,
          name: userName,
          email: userEmail,
          photoUrl: userPhotoUrl,
          createdAt: userCreatedAt,
        );

  factory UserDTO.fromMap(Map<String, dynamic> map) {
    return UserDTO(
      userId: map['userId'],
      userName: map['userName'],
      userEmail: map['userEmail'],
      userPhotoUrl: map['userPhotoUrl'],
      userCreatedAt: map['userCreatedAt'] != null ? DateTime.parse(map['userCreatedAt']) : DateTime.now(),
      authToken: TokenDTO.fromMap(map['authToken']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'userPhotoUrl': userPhotoUrl,
      'userCreatedAt': userCreatedAt.toIso8601String(),
      'authToken': authToken.toMap(),
    };
  }
}
