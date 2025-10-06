import 'package:flutter_facade_transfer/features/accounts/domain/account_model.dart';

abstract interface class AccountsRepository {
  Future<List<AccountModel>> getAccounts();
}
