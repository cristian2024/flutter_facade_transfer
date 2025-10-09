import 'package:flutter/material.dart';

import 'transfer_screen.dart';

class TransferSuccess extends StatelessWidget {
  const TransferSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check),
            Text("Transacción exitosa"),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => TransferScreen(),
                  ),
                );
              },
              child: Text("Hacer otra transacción"),
            ),
          ],
        ),
      ),
    );
  }
}
