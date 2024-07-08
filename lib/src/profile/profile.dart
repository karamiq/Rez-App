import 'package:app/utils/components/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          Row(),
          Center(
            child: Text('profile'),
          ),
        ],
      ),
    );
  }
}
