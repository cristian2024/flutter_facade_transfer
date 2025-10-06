import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facade_transfer/core/injection.dart';
import 'package:flutter_facade_transfer/features/accounts/ui/state/accounts_cubit/accounts_cubit.dart';
import 'package:flutter_facade_transfer/features/transfer/ui/transfer_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountsCubit(readIt())..loadAccounts(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        home: TransferScreen(),
      ),
    );
  }
}
