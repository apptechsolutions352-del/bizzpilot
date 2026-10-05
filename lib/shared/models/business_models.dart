enum MemberRole { owner, admin, manager, staff }
enum PaymentMethod { cash, mobileMoney, card, bank, credit, other }
enum PaymentStatus { paid, partial, unpaid }
enum InventoryMovementType { purchase, sale, adjustment, returnMovement }
class Business {
  const Business({required this.id, required this.name, required this.countryCode, required this.currencyCode, required this.timezone, required this.locale, required this.businessType});
  final String id, name, countryCode, currencyCode, timezone, locale, businessType;
}
class Product {
  const Product({required this.id, required this.name, required this.sellingPrice, required this.costPrice, required this.stockQuantity, required this.lowStockThreshold, this.sku = '', this.category = 'Other', this.active = true});
  final String id, name, sku, category;
  final double sellingPrice, costPrice;
  final int stockQuantity, lowStockThreshold;
  final bool active;
  bool get isLowStock => stockQuantity <= lowStockThreshold;
}
class Customer {
  const Customer({required this.id, required this.name, this.phone = '', this.email = '', this.outstanding = 0});
  final String id, name, phone, email;
  final double outstanding;
}
class SaleItem {
  const SaleItem({required this.productId, required this.quantity, required this.unitPrice, required this.unitCost});
  final String productId;
  final int quantity;
  final double unitPrice, unitCost;
  double get total => quantity * unitPrice;
  double get costTotal => quantity * unitCost;
}
class Sale {
  const Sale({required this.id, required this.createdAt, required this.items, required this.total, required this.paymentMethod, this.customerId});
  final String id;
  final DateTime createdAt;
  final List<SaleItem> items;
  final double total;
  final PaymentMethod paymentMethod;
  final String? customerId;
  double get costOfGoodsSold => items.fold(0, (sum, item) => sum + item.costTotal);
}
class Expense {
  const Expense({required this.id, required this.amount, required this.category, required this.description, required this.expenseDate, required this.paymentMethod});
  final String id, category, description;
  final double amount;
  final DateTime expenseDate;
  final PaymentMethod paymentMethod;
}
class DashboardSummary {
  const DashboardSummary({required this.sales, required this.expenses, required this.costOfGoods, required this.outstanding, required this.recentSales, required this.lowStockProducts});
  final double sales, expenses, costOfGoods, outstanding;
  final List<Sale> recentSales;
  final List<Product> lowStockProducts;
  double get estimatedProfit => sales - costOfGoods - expenses;
}
