import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_scaffold.dart';
class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});
  @override
  State<AiAssistantScreen> createState() => _AiAssistantState();
}
class _AiAssistantState extends State<AiAssistantScreen> {
  final controller = TextEditingController();
  final messages = <String>[];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: 'Ask BizPilot', child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Your business assistant', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)), const SizedBox(height: 6), const Text('Answers are based on verified business records. The initial MVP uses a transparent mock provider.'), const SizedBox(height: 24), messages.isEmpty ? const SizedBox(height: 160, child: Center(child: Text('Try “How much did I sell this month?”'))) : Column(children: messages.map((message) => Card(child: Padding(padding: const EdgeInsets.all(16), child: Text(message))).toList()), const SizedBox(height: 12), Row(children: [Expanded(child: TextField(controller: controller, decoration: const InputDecoration(hintText: 'Ask about your business...'))), const SizedBox(width: 8), IconButton.filled(onPressed: () { final question = controller.text.trim(); if (question.isEmpty) return; setState(() { messages.add('You: $question\n\nBizPilot: I can answer this once your transaction data is connected to the assistant service.'); controller.clear(); }); }, icon: const Icon(Icons.send))])]));
  }
}
