import 'package:get_it/get_it.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/account_use_case.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/accounts_repository.dart';
import 'package:flutter_facade_transfer/features/accounts/infrastructure/accounts_fake_api.dart';

final _getIt = GetIt.instance;
void injection(){
  final AccountsRepository accountsRepository = AccountsMockApi();  


  final AccountUseCase accountUseCase = AccountUseCase(accountsRepository);

  

  _getIt.registerSingleton(accountUseCase);
}


T readIt<T extends Object>(){
  return _getIt();
}

