import 'package:go_router/go_router.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/products/presentation/screens/products_screen.dart';
import '../../features/customers/presentation/screens/customers_screen.dart';
import '../../features/reports/presentation/screens/reports_screen.dart';
import '../../features/ai_assistant/presentation/screens/assistant_screen.dart';
final appRouter = GoRouter(initialLocation: '/', routes: [GoRoute(path: '/', builder: (context, state) => const DashboardScreen()), GoRoute(path: '/products', builder: (context, state) => const ProductsScreen()), GoRoute(path: '/customers', builder: (context, state) => const CustomersScreen()), GoRoute(path: '/reports', builder: (context, state) => const ReportsScreen()), GoRoute(path: '/assistant', builder: (context, state) => const AiAssistantScreen())]);
