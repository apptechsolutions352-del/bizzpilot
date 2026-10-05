import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.title, required this.child, super.key});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)), const SizedBox(width: 8)]), body: Row(children: [NavigationRail(selectedIndex: _selectedIndex(context), onDestinationSelected: (index) => context.go(_paths[index]), labelType: NavigationRailLabelType.all, leading: Padding(padding: const EdgeInsets.only(bottom: 24), child: CircleAvatar(backgroundColor: AppTheme.primary, child: Text('B', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))), destinations: const [NavigationRailDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: Text('Home')), NavigationRailDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: Text('Products')), NavigationRailDestination(icon: Icon(Icons.people_outline), selectedIcon: Icon(Icons.people), label: Text('Customers')), NavigationRailDestination(icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart), label: Text('Reports')), NavigationRailDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome), label: Text('Ask BizPilot'))]), Expanded(child: LayoutBuilder(builder: (context, constraints) => SingleChildScrollView(padding: const EdgeInsets.all(24), child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight), child: child)) ))]));
  static const _paths = ['/', '/products', '/customers', '/reports', '/assistant'];
  int _selectedIndex(BuildContext context) { final location = GoRouterState.of(context).uri.path; final index = _paths.indexOf(location); return index < 0 ? 0 : index; }
}
