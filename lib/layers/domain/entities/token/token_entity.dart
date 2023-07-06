import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final String token;
  final DateTime tokenExpirationAt;

  const TokenEntity({
    required this.token,
    required this.tokenExpirationAt,
  });

  bool get isUserLogged {
    return token.isNotEmpty && !isTokenExpired;
  }

  bool get isTokenExpired {
    return DateTime.now().isAfter(tokenExpirationAt);
  }

  TokenEntity copyWith({
    String? token,
    DateTime? tokenExpirationAt,
  }) {
    return TokenEntity(
      token: token ?? this.token,
      tokenExpirationAt: tokenExpirationAt ?? this.tokenExpirationAt,
    );
  }

  @override
  String toString() {
    return 'AuthEntity(token: $token, tokenExpirationAt: $tokenExpirationAt)';
  }

  @override
  List<Object?> get props => [
        token,
        tokenExpirationAt,
      ];
}
