import '../../../domain/domain.dart';

class TokenDTO extends TokenEntity {
  final String userToken;
  final DateTime tokenExpiration;

  const TokenDTO({
    required this.userToken,
    required this.tokenExpiration,
  }) : super(token: userToken, tokenExpirationAt: tokenExpiration);

  factory TokenDTO.fromMap(Map<String, dynamic> map) {
    return TokenDTO(
      userToken: map['token'],
      tokenExpiration: map['tokenExpirationAt'] != null ? DateTime.parse(map['tokenExpirationAt']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'tokenExpirationAt': tokenExpirationAt.toIso8601String(),
    };
  }
}
