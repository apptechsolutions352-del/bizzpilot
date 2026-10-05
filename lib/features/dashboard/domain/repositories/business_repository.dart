import '../../../../shared/models/business_models.dart';
abstract interface class BusinessRepository {
  Future<Business> getBusiness();
  Future<DashboardSummary> getDashboard({DateTime? start, DateTime? end});
  Future<List<Product>> getProducts({String query = '', bool lowStockOnly = false});
  Future<List<Customer>> getCustomers({String query = ''});
  Future<Sale> createSale({required List<SaleItem> items, required PaymentMethod paymentMethod, String? customerId});
  Future<Expense> createExpense({required double amount, required String category, required String description, required DateTime date, required PaymentMethod paymentMethod});
}
