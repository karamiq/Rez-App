import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../../../common_lib.dart';
import '../../../../utils/components/input_decoration/search_map_decoration.dart';
import 'data_.dart';

class SearchMapHead extends StatelessWidget {
  SearchMapHead({
    super.key,
    this.controller,
    this.onChanged,
    this.readOnly = true,
    this.route = true,
  });
  final TextEditingController? controller;
  Function(String)? onChanged;
  final bool readOnly;
  final bool route;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Insets.mediumAll,
        child: Row(
          children: [
            IconButton.filled(
              icon: const Padding(
                padding: Insets.extraSmallAll,
                child: Icon(
                  Icons.chevron_left_outlined,
                  size: 30,
                ),
              ),
              onPressed: () => context.pop(),
              style: IconButton.styleFrom(
                  foregroundColor: const Color(0xFFA763FD),
                  backgroundColor: const Color(0x4DD67DFF)),
            ),
            const Gap(Insets.small),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                readOnly: readOnly,
                decoration: searchMapDecoration(),
                onTap: !route
                    ? null
                    : () => context.pushNamed(RoutesDocument.searchingOfMap),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final faker = Faker();

List<Party> searchparties = List.generate(6, (index) {
  return Party(
    imageUrl: imagesUrls[index], // Random image URL
    title: faker.lorem.words(3).join(' '), // Random title
    genre: faker.lorem.word(), // Random genre
    ticketInfo: faker.lorem.word(), // Random ticket info
    isExpired: false, // Random isExpired value
    expiredDate: faker.date.dateTime(), // Random expired date
    latitude: faker.randomGenerator
        .decimal(min: 33.213, scale: 0.217), // Baghdad latitude range
    longitude: faker.randomGenerator
        .decimal(min: 44.306, scale: 0.150), // Baghdad longitude range
  );
});
List<String> imagesUrls = [
  'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1539481915544-f5cd50562d66?q=80&w=2933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
];
