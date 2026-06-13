import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

/// Persistent header showing the live auth state (driven by [onAuthChange]).
class SessionHeader extends StatelessWidget {
  const SessionHeader({super.key, required this.client});
  final BetterAuthClient client;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return StreamBuilder<User?>(
      stream: client.onAuthChange,
      builder: (context, snapshot) {
        final user = snapshot.data;
        final signedIn = user != null;
        return Material(
          color: scheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      signedIn ? Icons.check_circle : Icons.cancel,
                      size: 18,
                      color: signedIn ? Colors.green : Colors.redAccent,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      signedIn ? 'Signed in' : 'Signed out',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: 'refreshSession()',
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.refresh, size: 18),
                      onPressed: FlutterBetterAuth.refreshSession,
                    ),
                  ],
                ),
                if (signedIn) ...[
                  Text(
                    '${user.name} · ${user.email}',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'id: ${user.id}'
                    '${user.isAnonymous ? '  (anonymous)' : ''}'
                    '${user.role != null ? '  role: ${user.role}' : ''}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
