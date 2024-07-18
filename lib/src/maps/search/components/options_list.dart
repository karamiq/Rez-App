import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import 'data_.dart';

class OptionsLIst extends StatelessWidget {
  const OptionsLIst({
    super.key,
    required this.onSelected,
    required this.options,
  });
  final Function(Party) onSelected;
  final Iterable<Party> options;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderSize.mediumRadius,
          border: Border.all(
            width: 200,
            color: Colors.red,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: options.length,
          itemBuilder: (context, index) {
            final storage = options.elementAt(index);
            return ListTile(
              title: Text(storage.title),
              onTap: () {
                onSelected(storage);
              },
            );
          },
        ),
      ),
    );
  }
}
