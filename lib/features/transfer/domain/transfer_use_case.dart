import 'transfer_facade.dart';
import 'transfer_model.dart';

class TransferUseCase {
  final TransferFacade _facade;

  TransferUseCase(this._facade);

  Future<void> transfer(TransferModel transferInfo) =>
      _facade.transfer(transferInfo);
}
