import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facade_transfer/features/accounts/ui/state/accounts_cubit/accounts_state.dart';

import '../../accounts/domain/account_model.dart';
import '../../accounts/ui/account_selector.dart';
import '../../accounts/ui/state/accounts_cubit/accounts_cubit.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  AccountModel? _selectedAccount;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Transferir dinero',
                style: textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              BlocBuilder<AccountsCubit, AccountsState>(
                builder: (context, state) {
                  return AccountSelector(
                    accounts: state.accounts,
                    selectedAccount: _selectedAccount,
                    onSelectedAccount: (account) {
                      setState(() {
                        _selectedAccount = account;
                      });
                    },
                  );
                },
              ),
              SizedBox(height: 8),
              Icon(Icons.arrow_downward),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
