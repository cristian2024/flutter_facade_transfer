import 'package:flutter_facade_transfer/core/domain/security_repository.dart';

class SecurityFake implements SecurityRepository {
  @override
  Future<String> getToken() async {
    return "asdfadsfasdf";
  }
}
