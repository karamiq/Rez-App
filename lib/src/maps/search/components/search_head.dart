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
        padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
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
    isExpired: faker.randomGenerator.boolean(), // Random isExpired value
    expiredDate: faker.date.dateTime(), // Random expired date
    latitude: faker.randomGenerator
        .decimal(min: 33.213, scale: 0.217), // Baghdad latitude range
    longitude: faker.randomGenerator
        .decimal(min: 44.306, scale: 0.150), // Baghdad longitude range
  );
});
List<String> imagesUrls = [
  'https://s3-alpha-sig.figma.com/img/1543/3cb8/cd926f18468d7804e7dda333397c6d39?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GL3B2JewZCAuSfNd5-4sqP-INvTINa2BlPT-PQZ~tW7VI7H2AnzrLB9XMQFmjkQCoQNzil2v8h59njuSMYLO8ERd96HysZx9ujT4VQpVfz6z8rpz9YXMcBl0HCNyEMlybNo4uCOlj1zeB5F6NiRTxnpPZYLuhBuliea5W8~cJLB7r8ClJEIHBCEplDmY78mDXfUMR7iT7~jXlu9~WGN9ylUnW5jLwRwHQ69ZGsXL4A4w--dgbshnDpI5j8GIG~mok7FafvKabWeeV3oTNtKp~Y~D1IPt93qvLJEzZTS7s-uNMB035WFVq2XqJ1UrDIHRfC~JKDmzb-aj5hudo-40hg__',
  'https://s3-alpha-sig.figma.com/img/5af1/98e3/f270cd486976bd3900e567c283a931e7?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=meUKdEkXHUtvqG-rZTKSHGvFAXhJRJIjqtIBhawq9~NJcDCDbRAAInIycfJ3t-NQagcVTBfMAOHsRFyNMRjni23GVYlgq6LevG8bh~fv4e3j4SY1q3mKwLzQaG6aquiqZ3vvNJKMR5Ssh4LABPXycWHmxCLz4st6yzhGwhcIRreW29litpVre2RR6wHNGr~oTBuGXWNyKt8Ci-DeyVFWGOxFlV7IzDtUANoLYSCuFtN4J5ArSS2R~CxatRAI1czereqKgycDBbiMd85L0ohHg3DCIn5TcaFIeyjiwuiUjzRG9WT1KqC7ZRh9b1nO1k-zqXXvnbCFp2WtndQmVgrOaw__',
  'https://s3-alpha-sig.figma.com/img/b8ad/51eb/f9dacde03dabf1a045067e83e36d6e73?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aKmz5RMykqJl9ru4SnqTFfR6eGETv4pnrvjjkTE17--C5Ugwfz9MGX7c2Hu5~NOQbhDFjkg45Hr0dBHApDXUZWHM3lMXgISn5QxR3hz1F3jF1RUbpy0O7c~HVmo3RFPUCSJljvzRoKRXmiBYHiRI3Q4uutP~Cq8cRNf3iFcnO9INRbcwneKmMieKOFFOlMcG3He44cC3rOUKlFiRIwKooE40mUFJkQN0VdC~3V~CM~fXIBPbthWsTb151Eu07T2~GXzan2UUgMzjUkIoNEcQUQ3fpbkC7kVL8h1MyisUpN1Gyh7luYqAmuErjHyriBS8ghIb5okzhxeUdcb3NIeM5A__',
  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3c81bf4c-53df-47dd-bd2d-0015c90567ba/dhrqtx7-07c2bddb-c86c-4853-a4f0-bec3f7445822.jpg/v1/fill/w_1193,h_670,q_70,strp/wallpaper_pink_with_glitter_sky_clouds_by_xrebelyellx_dhrqtx7-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzNjODFiZjRjLTUzZGYtNDdkZC1iZDJkLTAwMTVjOTA1NjdiYVwvZGhycXR4Ny0wN2MyYmRkYi1jODZjLTQ4NTMtYTRmMC1iZWMzZjc0NDU4MjIuanBnIiwiaGVpZ2h0IjoiPD03MTkiLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS53YXRlcm1hcmsiXSwid21rIjp7InBhdGgiOiJcL3dtXC8zYzgxYmY0Yy01M2RmLTQ3ZGQtYmQyZC0wMDE1YzkwNTY3YmFcL3hyZWJlbHllbGx4LTQucG5nIiwib3BhY2l0eSI6OTUsInByb3BvcnRpb25zIjowLjQ1LCJncmF2aXR5IjoiY2VudGVyIn19.RogbEqeQgwzNu0khDcHRjsuvkgvAKPnmCrsh--twsc0',
  'https://c4.wallpaperflare.com/wallpaper/1011/416/24/anime-attack-on-titan-attack-on-titan-colossal-titan-wallpaper-preview.jpg',
  'https://c4.wallpaperflare.com/wallpaper/291/819/697/illustration-city-anime-painting-wallpaper-preview.jpg',
];
