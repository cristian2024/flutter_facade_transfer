import 'package:equatable/equatable.dart';

class AccountModel extends Equatable{
  final String name;
  final String accountId;
  final String type;
  final double balance;

  const AccountModel({
    required this.name,
    required this.accountId,
    required this.type,
    required this.balance,
  });
  
  @override
  List<Object?> get props => [name, accountId, type, balance];
}
