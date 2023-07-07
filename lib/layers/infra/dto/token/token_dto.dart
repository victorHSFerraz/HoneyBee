import '../../../domain/domain.dart';

class TokenDTO {
  final String token;
  final DateTime tokenExpirationAt;

  const TokenDTO({
    required this.token,
    required this.tokenExpirationAt,
  });

  factory TokenDTO.fromMap(Map<String, dynamic> map) {
    return TokenDTO(
      token: map['token'],
      tokenExpirationAt: map['tokenExpirationAt'] != null ? DateTime.parse(map['tokenExpirationAt']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'tokenExpirationAt': tokenExpirationAt.toIso8601String(),
    };
  }

  TokenEntity toTokenEntity() {
    return TokenEntity(
      token: token,
      tokenExpirationAt: tokenExpirationAt,
    );
  }
}
