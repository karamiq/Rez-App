import 'package:app/common_lib.dart';
import 'package:app/data/providers/settings_provider.dart';
import 'package:app/theme/theme_mode.dart';
import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);

    return const CustomScaffold(
      padding: Insets.mediumAll,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Icon(Icons.abc)),
              Expanded(flex: 11, child: TextField()),
              Expanded(child: Icon(Icons.abc)),
            ],
          )
        ],
      ),
    );
  }
}
