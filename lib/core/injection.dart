import 'package:flutter_facade_transfer/core/domain/analytics_repository.dart';
import 'package:flutter_facade_transfer/core/domain/security_repository.dart';
import 'package:flutter_facade_transfer/core/infrastructure/security_fake.dart';
import 'package:flutter_facade_transfer/features/transfer/domain/transfer_facade.dart';
import 'package:flutter_facade_transfer/features/transfer/domain/transfer_repository.dart';
import 'package:flutter_facade_transfer/features/transfer/domain/transfer_use_case.dart';
import 'package:flutter_facade_transfer/features/transfer/infrastructure/transfer_analytics.dart';
import 'package:flutter_facade_transfer/features/transfer/infrastructure/transfer_fake_api.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/account_use_case.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/accounts_repository.dart';
import 'package:flutter_facade_transfer/features/accounts/infrastructure/accounts_fake_api.dart';

final _getIt = GetIt.instance;
void injection() {
  final AccountsRepository accountsRepository = AccountsFakeApi();
  final TransferRepository transferRepository = TransferFakeApi();
  final AnalyticsRepository transferAnalytics = TransferAnalytics();
  final SecurityRepository securityRepository = SecurityFake();

  final TransferFacade transferFacade = TransferFacade(
    transferRepository,
    transferAnalytics,
    securityRepository,
  );

  final AccountUseCase accountUseCase = AccountUseCase(accountsRepository);
  final TransferUseCase transferUseCase = TransferUseCase(transferFacade);

  _getIt.registerSingleton(accountUseCase);
  _getIt.registerSingleton(transferUseCase);
}

T readIt<T extends Object>() {
  return _getIt();
}
