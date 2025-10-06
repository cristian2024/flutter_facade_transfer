import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/account_use_case.dart';
import 'package:flutter_facade_transfer/features/accounts/ui/state/accounts_cubit/accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit(this._useCase) : super(AccountsState());

  final AccountUseCase _useCase;

  Future<void> loadAccounts() async {
    emit(state.copyWith(isLoading: true));

    final accountsList = await _useCase.getAccounts();
    emit(
      state.copyWith(
        accounts: accountsList,
        isLoading: false,
      ),
    );
  }
}
