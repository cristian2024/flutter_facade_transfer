import 'package:flutter/material.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/account_model.dart';
import 'package:flutter_facade_transfer/features/accounts/ui/account_card.dart';

class AccountSelector extends StatelessWidget {
  const AccountSelector({
    super.key,
    required this.accounts,
    required this.onSelectedAccount,
    this.selectedAccount,
  });

  final List<AccountModel> accounts;
  final AccountModel? selectedAccount;

  final void Function(AccountModel? account) onSelectedAccount;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<AccountModel>(
      value: selectedAccount,
      hint: Text('Selecciona una de tus cuentas disponibles'),
      isExpanded: true,
      itemHeight: 60,
      items: accounts.map(
        (account) {
          return DropdownMenuItem<AccountModel>(
            value: account,
            child: AccountCard(account: account),
          );
        },
      ).toList(),
      onChanged: onSelectedAccount,
    );
  }
}
