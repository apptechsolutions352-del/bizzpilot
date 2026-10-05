import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/demo_business_repository.dart';
import '../../domain/repositories/business_repository.dart';
final businessRepositoryProvider = Provider<BusinessRepository>((ref) => DemoBusinessRepository());
final businessProvider = FutureProvider((ref) => ref.watch(businessRepositoryProvider).getBusiness());
final dashboardProvider = FutureProvider((ref) => ref.watch(businessRepositoryProvider).getDashboard());
final productsProvider = FutureProvider.family((ref, String query) => ref.watch(businessRepositoryProvider).getProducts(query: query));
final customersProvider = FutureProvider.family((ref, String query) => ref.watch(businessRepositoryProvider).getCustomers(query: query));
