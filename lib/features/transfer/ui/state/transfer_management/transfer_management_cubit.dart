import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facade_transfer/core/domain/custom_exception.dart';
import 'package:flutter_facade_transfer/core/status.dart';
import 'package:flutter_facade_transfer/features/accounts/domain/account_model.dart';
import 'package:flutter_facade_transfer/features/transfer/domain/transfer_use_case.dart';

import '../../../domain/transfer_model.dart';

part 'transfer_management_state.dart';

class TransferManagementCubit extends Cubit<TransferManagementState> {
  TransferManagementCubit(this._useCase) : super(TransferManagementState());

  final TransferUseCase _useCase;

  void setFromAccount(AccountModel fromAccount) {
    emit(state.copyWith(fromAccount: fromAccount));
  }

  void setToAccount(String toAccount) {
    emit(state.copyWith(toAccount: toAccount));
  }

  void setAmount(double amount) {
    emit(state.copyWith(amount: amount));
  }

  Future<void> transfer() async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _useCase.transfer(state.getTransferModel());
      emit(state.copyWith(status: Status.finished));
    } on CustomException catch (e) {
      emit(
        state.copyWith(
          status: Status.fail,
          exception: e,
        ),
      );
    }
  }
}
