import 'package:flutter_facade_transfer/core/domain/custom_exception.dart';
import 'package:flutter_facade_transfer/features/transfer/domain/transfer_model.dart';
import 'package:flutter_facade_transfer/features/transfer/domain/transfer_repository.dart';

class TransferFakeApi implements TransferRepository {
  @override
  Future<void> transfer(TransferModel transferInfo, [String token = '']) async {
    await Future.delayed(Duration(seconds: 1));
    //agregando casos en los que va a fallar
    if (transferInfo.amount == 15000) {
      throw CustomException("No se pudo realizar tu transacción");
    }
    return;
  }

  @override
  Future<bool> validateFunds(String accountNumber, double amount) async{
    return accountNumber != 'ACC1001';
  }
}
