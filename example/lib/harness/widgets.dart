import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

/// Holds the rolling text output for one tab's console.
class ConsoleController extends ValueNotifier<String> {
  ConsoleController() : super('');
  void log(String message) =>
      value = '$message${value.isEmpty ? '' : '\n\n$value'}';
  void clear() => value = '';
}

/// Runs a Better Auth call and writes a formatted result to [console].
Future<void> runAction<T>(
  ConsoleController console,
  String name,
  Future<Result<T>> Function() action,
) async {
  console.log('▶ $name …');
  try {
    final result = await action();
    final error = result.error;
    if (error != null) {
      console.log('✗ $name → [${error.code}] ${error.message}');
    } else {
      console.log('✓ $name → ${result.data ?? 'ok'}');
    }
  } catch (e) {
    console.log('✗ $name → EXCEPTION: $e');
  }
}

/// Standard layout for a plugin tab: scrollable actions over a sticky console.
class HarnessTab extends StatelessWidget {
  const HarnessTab({
    super.key,
    required this.console,
    required this.children,
  });

  final ConsoleController console;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final child in children)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: child,
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ConsoleView(controller: console),
        ),
      ],
    );
  }
}

class ConsoleView extends StatelessWidget {
  const ConsoleView({super.key, required this.controller});
  final ConsoleController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF101317),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'OUTPUT',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 11,
                  letterSpacing: 1,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: controller.clear,
                child: const Icon(
                  Icons.delete_outline,
                  size: 16,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(
            child: SingleChildScrollView(
              child: ValueListenableBuilder<String>(
                valueListenable: controller,
                builder: (_, text, _) => SelectableText(
                  text.isEmpty ? '—' : text,
                  style: const TextStyle(
                    color: Color(0xFF8BE9A8),
                    fontFamily: 'monospace',
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A labelled single-line text input bound to [controller].
class Field extends StatelessWidget {
  const Field(this.label, this.controller, {super.key, this.obscure = false});
  final String label;
  final TextEditingController controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

/// A left-aligned action button.
class Act extends StatelessWidget {
  const Act(this.label, this.onTap, {super.key});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FilledButton.tonal(onPressed: onTap, child: Text(label)),
    );
  }
}

/// A small section heading inside a tab.
class SectionLabel extends StatelessWidget {
  const SectionLabel(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 2),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 11,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
