import 'package:flutter_test/flutter_test.dart';
import 'package:bizpilot/shared/models/business_models.dart';
void main() {
  test('sale stores historical cost and calculates gross profit', () {
    final sale = Sale(id: 's1', createdAt: DateTime(2026), items: const [SaleItem(productId: 'p1', quantity: 2, unitPrice: 10, unitCost: 6)], total: 20, paymentMethod: PaymentMethod.cash);
    expect(sale.total, 20);
    expect(sale.costOfGoodsSold, 12);
    expect(sale.total - sale.costOfGoodsSold, 8);
  });
  test('low stock is derived from threshold', () {
    const product = Product(id: 'p1', name: 'Bread', sellingPrice: 15, costPrice: 10, stockQuantity: 5, lowStockThreshold: 5);
    expect(product.isLowStock, isTrue);
  });
}
