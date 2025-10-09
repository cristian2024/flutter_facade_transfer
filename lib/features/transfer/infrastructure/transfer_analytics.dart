import 'dart:developer';

import 'package:flutter_facade_transfer/core/domain/analytics_repository.dart';

class TransferAnalytics implements AnalyticsRepository {
  @override
  Future<void> sendAnalytic(
    String message, {
    Map<String, dynamic>? optionalContent,
  }) async{
    log("==================");
    log(title);
    log("------------------");
    log(message);
    log("==================");
  }
  
  @override
  String get title => "Transfer analytics";
}
