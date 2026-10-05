enum SubscriptionPlan { free, starter, business, pro }
class PlanLimits { const PlanLimits({required this.monthlySales, required this.users, required this.aiAssistant, required this.advancedReports}); final int? monthlySales; final int users; final bool aiAssistant, advancedReports; }
abstract interface class SubscriptionService {
  Future<SubscriptionPlan> currentPlan(String businessId);
  Future<PlanLimits> limits(String businessId);
  Future<bool> canUse(String businessId, String feature);
}
