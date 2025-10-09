import 'package:flutter_facade_transfer/core/domain/analytics_repository.dart';
import 'package:flutter_facade_transfer/core/domain/security_repository.dart';
import 'package:flutter_facade_transfer/features/transfer/domain/transfer_repository.dart';

import '../../../core/domain/custom_exception.dart';
import 'transfer_model.dart';

class TransferFacade {
  final TransferRepository _repository;
  final AnalyticsRepository _analyticsRepository;
  final SecurityRepository _securityRepository;

  TransferFacade(
    this._repository,
    this._analyticsRepository,
    this._securityRepository,
  );

  Future<void> transfer(TransferModel transferInfo) async {
    await Future.delayed(Duration(seconds: 1));
    final String token = await _securityRepository.getToken();
    _analyticsRepository.sendAnalytic(transferInfo.analyticsMessage);

    final sufficientFunds = await _repository.validateFunds(
      transferInfo.fromAccount.accountId,
      transferInfo.amount,
    );
    if(!sufficientFunds){
      throw CustomException("Fondos insuficientes");
    }
    await _repository.transfer(transferInfo, token);
  }
}
