import 'transfer_model.dart';

abstract interface class TransferRepository {
  Future<void> transfer(TransferModel transferInfo, [String token = '']);
  Future<bool> validateFunds(String accountNumber, double amount);
}
