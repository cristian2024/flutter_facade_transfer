abstract interface class AnalyticsRepository {
  String get title;
  Future<void> sendAnalytic(
    String message, {
    Map<String, dynamic>? optionalContent,
  });
}
