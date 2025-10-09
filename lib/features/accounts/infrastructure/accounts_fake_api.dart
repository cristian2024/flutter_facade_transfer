import 'package:flutter_facade_transfer/features/accounts/domain/account_model.dart';
import 'package:flutter_facade_transfer/features/accounts/infrastructure/fakes/fake_accounts.dart';

import '../domain/accounts_repository.dart';

class AccountsFakeApi implements AccountsRepository{
  @override
  Future<List<AccountModel>> getAccounts() async{
    return fakeAccounts;
  }
}