part of 'transfer_management_cubit.dart';

class TransferManagementState extends Equatable {
  const TransferManagementState({
    this.fromAccount,
    this.toAccount,
    this.amount,
    this.status = Status.initialized,
    this.exception,
  });
  final String? toAccount;
  final AccountModel? fromAccount;
  final double? amount;

  final Status status;
  final CustomException? exception;

  @override
  List<Object?> get props => [
        fromAccount,
        toAccount,
        status,
        amount,
        exception,
      ];

  bool get isValidInfo {
    return fromAccount != null && toAccount != null && (amount ?? 0) > 0;
  }

  TransferModel getTransferModel() {
    if (!isValidInfo) {
      throw CustomException(
          "No es posible generar el modelo con los datos proporcionados");
    }

    return TransferModel(
      toAccount: toAccount!,
      fromAccount: fromAccount!,
      amount: amount!,
    );
  }

  TransferManagementState copyWith({
    String? toAccount,
    AccountModel? fromAccount,
    double? amount,
    Status? status,
    CustomException? exception,
  }) {
    // Status newStatus;

    Status newStatus = status ??
        (this.status == Status.fail ? Status.initialized : this.status);


    return TransferManagementState(
      exception: exception,
      amount: amount ?? this.amount,
      status: newStatus,
      toAccount: toAccount ?? this.toAccount,
      fromAccount: fromAccount ?? this.fromAccount,
    );
  }
}
