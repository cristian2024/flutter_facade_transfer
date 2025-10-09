import '../../accounts/domain/account_model.dart';

class TransferModel {
  final String toAccount;
  final AccountModel fromAccount;

  final double amount;

  TransferModel({
    required this.toAccount,
    required this.fromAccount,
    required this.amount,
  });

  String get analyticsMessage{
    return "from ${fromAccount.accountId} to $toAccount";
  }
}
