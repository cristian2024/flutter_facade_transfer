import 'package:flutter_facade_transfer/features/accounts/domain/account_model.dart';

const List<AccountModel> fakeAccounts = [
  AccountModel(
    name: "Cuenta Ahorros Principal",
    accountId: "ACC1001",
    type: "Ahorros",
    balance: 3250000.50,
  ),
  AccountModel(
    name: "Cuenta Nómina",
    accountId: "ACC1002",
    type: "Corriente",
    balance: 2400000.00,
  ),
  AccountModel(
    name: "Cuenta Ahorros Viajes",
    accountId: "ACC1003",
    type: "Ahorros",
    balance: 850000.75,
  ),
  AccountModel(
    name: "Cuenta Inversiones",
    accountId: "ACC1004",
    type: "Ahorros",
    balance: 12000000.00,
  ),
  AccountModel(
    name: "Cuenta de Emergencias",
    accountId: "ACC1005",
    type: "Ahorros",
    balance: 500000.00,
  ),
];
