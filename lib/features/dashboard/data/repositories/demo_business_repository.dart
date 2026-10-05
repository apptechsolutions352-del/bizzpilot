import 'package:uuid/uuid.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../shared/models/business_models.dart';
import '../../domain/repositories/business_repository.dart';
class DemoBusinessRepository implements BusinessRepository {
  DemoBusinessRepository() {
    products.addAll(const [Product(id: 'coke', name: 'Coca-Cola 500ml', sellingPrice: 8, costPrice: 5, stockQuantity: 50, lowStockThreshold: 10), Product(id: 'bread', name: 'Bread', sellingPrice: 15, costPrice: 10, stockQuantity: 20, lowStockThreshold: 5), Product(id: 'milk', name: 'Milk 1L', sellingPrice: 25, costPrice: 18, stockQuantity: 10, lowStockThreshold: 5)]);
    customers.add(const Customer(id: 'walk-in', name: 'Walk-in Customer'));
  }
  final products = <Product>[];
  final customers = <Customer>[];
  final sales = <Sale>[];
  final expenses = <Expense>[];
  final _uuid = const Uuid();
  @override
  Future<Business> getBusiness() async => const Business(id: 'demo-business-0001', name: 'Demo Shop', countryCode: 'ZM', currencyCode: 'ZMW', timezone: 'Africa/Lusaka', locale: 'en-ZM', businessType: 'Retail');
  @override
  Future<List<Product>> getProducts({String query = '', bool lowStockOnly = false}) async => products.where((p) => p.active && p.name.toLowerCase().contains(query.toLowerCase()) && (!lowStockOnly || p.isLowStock)).toList();
  @override
  Future<List<Customer>> getCustomers({String query = ''}) async => customers.where((c) => c.name.toLowerCase().contains(query.toLowerCase()) || c.phone.contains(query)).toList();
  @override
  Future<Sale> createSale({required List<SaleItem> items, required PaymentMethod paymentMethod, String? customerId}) async {
    if (items.isEmpty) throw const ValidationFailure('Add at least one product.');
    for (final item in items) {
      final product = products.firstWhere((p) => p.id == item.productId);
      if (product.stockQuantity < item.quantity) throw const InsufficientStockFailure();
    }
    for (final item in items) {
      final index = products.indexWhere((p) => p.id == item.productId);
      final product = products[index];
      products[index] = Product(id: product.id, name: product.name, sku: product.sku, category: product.category, sellingPrice: product.sellingPrice, costPrice: product.costPrice, stockQuantity: product.stockQuantity - item.quantity, lowStockThreshold: product.lowStockThreshold);
    }
    final sale = Sale(id: _uuid.v4(), createdAt: DateTime.now(), items: List.unmodifiable(items), total: items.fold(0, (sum, i) => sum + i.total), paymentMethod: paymentMethod, customerId: customerId);
    sales.insert(0, sale);
    return sale;
  }
  @override
  Future<Expense> createExpense({required double amount, required String category, required String description, required DateTime date, required PaymentMethod paymentMethod}) async {
    if (amount <= 0) throw const ValidationFailure('Expense amount must be greater than zero.');
    final expense = Expense(id: _uuid.v4(), amount: amount, category: category, description: description, expenseDate: date, paymentMethod: paymentMethod);
    expenses.insert(0, expense);
    return expense;
  }
  @override
  Future<DashboardSummary> getDashboard({DateTime? start, DateTime? end}) async => DashboardSummary(sales: sales.fold(0, (sum, s) => sum + s.total), expenses: expenses.fold(0, (sum, e) => sum + e.amount), costOfGoods: sales.fold(0, (sum, s) => sum + s.costOfGoodsSold), outstanding: customers.fold(0, (sum, c) => sum + c.outstanding), recentSales: sales.take(5).toList(), lowStockProducts: products.where((p) => p.isLowStock).toList());
}
