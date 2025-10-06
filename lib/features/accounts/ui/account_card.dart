import 'package:flutter/material.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/account_model.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.simpleCurrency();

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.account,
  });

  final AccountModel account;
  @override
  Widget build(BuildContext context) {
    final AccountModel(:accountId, :type, :balance) = account;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                type,
                style: textTheme.titleMedium,
              ),
              Text(
                accountId,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          Text(
            formatCurrency.format(balance),
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
