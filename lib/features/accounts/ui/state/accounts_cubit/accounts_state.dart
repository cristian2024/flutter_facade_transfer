import 'package:equatable/equatable.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/account_model.dart';

class AccountsState extends Equatable {
  final bool isLoading;
  final List<AccountModel> accounts;

  const AccountsState({
    this.isLoading = false,
    this.accounts = const [],
  });

  AccountsState copyWith({
    bool? isLoading,
    List<AccountModel>? accounts,
  }) {
    return AccountsState(
      isLoading: isLoading ?? this.isLoading,
      accounts: accounts ?? this.accounts,
    );
  }

  @override
  List<Object?> get props => [isLoading, accounts];
}
