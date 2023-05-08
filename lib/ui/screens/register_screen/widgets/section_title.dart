

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          Expanded(
            flex: 2,
            child: Text(
              "Register",
              style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 48,
          ),
        ],
      ),
    );
  }
}