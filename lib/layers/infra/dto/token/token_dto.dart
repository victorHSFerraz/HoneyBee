import '../../../domain/domain.dart';

class TokenDTO extends TokenEntity {
  const TokenDTO({
    required token,
    required tokenExpirationAt,
  }) : super(
          token: token,
          tokenExpirationAt: tokenExpirationAt,
        );

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
}
