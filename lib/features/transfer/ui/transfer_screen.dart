import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facade_transfer/core/injection.dart';

import '../../../core/status.dart';
import '../ui/state/transfer_management/transfer_management_cubit.dart';

import '../../accounts/ui/state/accounts_cubit/accounts_state.dart';
import '../../accounts/ui/account_selector.dart';
import '../../accounts/ui/state/accounts_cubit/accounts_cubit.dart';
import 'transfer_success.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferManagementCubit(
        readIt(),
      ),
      child: const _TransferBody(),
    );
  }
}

class _TransferBody extends StatefulWidget {
  const _TransferBody();

  @override
  State<_TransferBody> createState() => _TransferBodyState();
}

class _TransferBodyState extends State<_TransferBody> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocConsumer<TransferManagementCubit, TransferManagementState>(
            listener: (context, state) {
              if (state.exception != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.exception.toString()),
                  ),
                );
              } else if (state.status == Status.finished) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => TransferSuccess(),
                ));
              }
            },
            listenWhen: (previous, current) {
              return (current.exception != null &&
                      current.exception != previous.exception) ||
                  (current.status == Status.finished);
            },
            builder: (context, state) {
              final TransferManagementState(
                isValidInfo: isValid,
                :fromAccount,
                :status,
              ) = state;

              final bool isLoading = status == Status.loading;
              return Column(
                children: [
                  Text(
                    'Transferir dinero',
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Valor a transferir",
                          ),
                          inputFormatters: [
                            CurrencyTextInputFormatter.simpleCurrency(
                              decimalDigits: 0,
                            )
                          ],
                          onChanged: (value) {
                            final double amount = double.tryParse(
                                    value.replaceAll(RegExp(r'[^0-9.]'), '')) ??
                                0;
                            if (amount > 0) {
                              context
                                  .read<TransferManagementCubit>()
                                  .setAmount(amount);
                            }
                          },
                        ),
                        SizedBox(height: 32),
                        BlocBuilder<AccountsCubit, AccountsState>(
                          builder: (context, state) {
                            return AccountSelector(
                              accounts: state.accounts,
                              selectedAccount: fromAccount,
                              onSelectedAccount: (account) {
                                if (account != null) {
                                  context
                                      .read<TransferManagementCubit>()
                                      .setFromAccount(account);
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(height: 8),
                        Icon(Icons.arrow_downward),
                        SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "No. de cuenta a transferir"),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              context
                                  .read<TransferManagementCubit>()
                                  .setToAccount(value);
                            }
                          },
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed:
                              !isValid || isLoading || status == Status.fail
                                  ? null
                                  : () {
                                      context
                                          .read<TransferManagementCubit>()
                                          .transfer();
                                    },
                          child: isLoading
                              ? CircularProgressIndicator()
                              : Text("Transferir dinero"),
                        ),
                        SizedBox(height: 124),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
