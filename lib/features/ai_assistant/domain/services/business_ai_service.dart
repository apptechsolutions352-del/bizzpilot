import '../../../../shared/models/business_models.dart';
abstract interface class BusinessAIService {
  Future<AIAnswer> ask({required String question, required DashboardSummary verifiedSummary});
}
class AIAnswer { const AIAnswer({required this.text, required this.verifiedData}); final String text; final Map<String, Object?> verifiedData; }
class MockBusinessAIService implements BusinessAIService {
  @override
  Future<AIAnswer> ask({required String question, required DashboardSummary verifiedSummary}) async => AIAnswer(text: 'Based on your verified records, sales are ZMW ${verifiedSummary.sales.toStringAsFixed(2)} and estimated profit is ZMW ${verifiedSummary.estimatedProfit.toStringAsFixed(2)}. This is an estimate, not audited accounting data.', verifiedData: {'sales': verifiedSummary.sales, 'estimatedProfit': verifiedSummary.estimatedProfit});
}
