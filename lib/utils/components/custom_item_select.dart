// ignore_for_file: camel_case_types, library_private_types_in_public_api, prefer_const_constructors

import 'package:app/common_lib.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:app/utils/components/input_decoration/ticketing_info.dart';
import 'package:flutter/material.dart';

class CustomItemSelect extends StatelessWidget {
  CustomItemSelect({
    super.key,
    required this.labelText,
    required this.controller,
    required this.itemList,
    required this.validator,
    this.onChanged,
    this.prefixIcon,
  });

  final String labelText;
  final dynamic validator;
  final TextEditingController controller;
  final Map<String, String> itemList;
  final String? prefixIcon;
  Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: ticketingInfoDecoration(
        labelText: labelText,
      ),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onTap: () async {
        dynamic result = await showModalBottomSheet(
          context: context,
          builder: (context) => showSelectionBottomSheet(
            itemListFuture: itemList,
            controller: controller,
          ),
        );
        if (onChanged != null) {
          onChanged!(result);
        }
      },
    );
  }
}

class showSelectionBottomSheet extends StatefulWidget {
  const showSelectionBottomSheet(
      {super.key,
      required Map<String, String> itemListFuture,
      required this.controller})
      : _originalList = itemListFuture;

  final Map<String, String> _originalList;
  final TextEditingController controller;

  @override
  _showSelectionBottomSheetState createState() =>
      _showSelectionBottomSheetState();
}

class _showSelectionBottomSheetState extends State<showSelectionBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, String> _filteredList = {};
  @override
  void initState() {
    super.initState();
    _filteredList = widget._originalList;
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredList = Map.fromEntries(
        widget._originalList.entries.where((entry) =>
            entry.key.toLowerCase().contains(query.toLowerCase()) ||
            entry.value.toLowerCase().contains(query.toLowerCase())),
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget._originalList.length > 4 ? 650 : 350,
      decoration: BoxDecoration(),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: Insets.medium,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 207, 207, 207),
                borderRadius: BorderRadius.circular(30),
              ),
              height: 5,
              width: 80,
            ),
          ),
          SizedBox(
            height: Insets.medium,
          ),
          TextField(
            controller: _searchController,
            decoration: ticketingInfoDecoration(labelText: 'Search'),
            onChanged: _filterCountries,
          ),
          SizedBox(height: Insets.medium),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                var key = _filteredList.keys.elementAt(index);
                var value = _filteredList.values.elementAt(index);
                return ListTile(
                  title: Text(key),
                  onTap: () {
                    // Handle country selection
                    widget.controller.text = value;
                    context.pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
