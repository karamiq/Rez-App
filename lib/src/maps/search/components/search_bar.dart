import 'package:flutter/material.dart';

import 'data_.dart';
import 'options_list.dart';
import 'search_text_field.dart';

class CustomSearchBar extends StatelessWidget {
  final List<Party> allParties;
  final Function(Party?) onSelected;

  const CustomSearchBar({
    super.key,
    required this.allParties,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Party>(
      optionsViewOpenDirection: OptionsViewOpenDirection.down,
      optionsBuilder: (textEditingValue) {
        return allParties
            .where((storage) => storage.name
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
            .toList();
      },
      displayStringForOption: (storage) => storage.name,
      onSelected: onSelected,
      optionsViewBuilder: (context, onSelected, options) {
        return OptionsLIst(
          onSelected: onSelected,
          options: options,
        );
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return SearchBarTextField(
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmitted,
        );
      },
    );
  }
}
