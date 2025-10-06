import 'package:flutter_facade_transfer/features/accounts/domain/account_model.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/accounts_repository.dart';

class AccountUseCase {
  final AccountsRepository _repository;

  AccountUseCase(this._repository);

  Future<List<AccountModel>> getAccounts() {
    return _repository.getAccounts();
  }
}
