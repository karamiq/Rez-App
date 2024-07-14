import 'package:app/common_lib.dart';
import 'package:app/utils/components/buttons/gardient_border_button.dart';
import 'package:app/utils/components/custom_item_select.dart';
import 'package:app/utils/components/gardient/custom_svg_style.dart';
import 'package:app/utils/components/input_decoration/ticketing_info.dart';
import 'package:flutter/material.dart';

import 'components/buying_head_1.dart';

class Buying1stPage extends StatefulWidget {
  const Buying1stPage({super.key, required this.bookedSeats});
  final int bookedSeats;

  @override
  createState() => _Buying1stPageState();
}

class _Buying1stPageState extends State<Buying1stPage> {
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController(text: '+964');
  late List<TextEditingController> nameControllers;
  late List<TextEditingController> phoneControllers;
  late List<TextEditingController> countryCodeControllers;

  @override
  void initState() {
    super.initState();
    nameControllers =
        List.generate(widget.bookedSeats, (_) => TextEditingController());
    phoneControllers =
        List.generate(widget.bookedSeats, (_) => TextEditingController());
    countryCodeControllers = List.generate(
        widget.bookedSeats, (_) => TextEditingController(text: '+964'));
  }

  void next() {
    if (formKey.currentState!.validate()) {
      // Collect data and send to API
      List<Map<String, String>> ticketsData = [];
      for (int i = 0; i < widget.bookedSeats; i++) {
        ticketsData.add({
          'name': nameControllers[i].text,
          'phone': phoneControllers[i].text,
          'countryCode': countryCodeControllers[i].text,
        });
      }
      print(ticketsData);
      context.pushNamed(RoutesDocument.buying2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const BuyingHead1(
                appBarTitle: 'ne',
                imageUrl:
                    'https://media.istockphoto.com/id/501387734/photo/dancing-friends.jpg?s=1024x1024&w=is&k=20&c=qneEFMVnKvFkagvbMmZqYU1rLRweq9889MXbu6f8mO4=',
                title: 'Jazz Night',
                subTitle: 'with Ali Jasseb',
                description:
                    'A pretty night with calm and relax jazz A pretty night with calm and relax jazz A pretty night with calm and relax jazz',
              ),
              const Gap(Insets.medium),
              Padding(
                padding: Insets.mediumAll,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomISvgStyle(
                              icon: Assets.assetsSvgBuildings,
                            ),
                            const Gap(Insets.small),
                            const Text('Al-Yarmook Club'),
                          ],
                        ),
                        Row(
                          children: [
                            CustomISvgStyle(
                              icon: Assets.assetsSvgCalendarOutlined,
                            ),
                            const Gap(Insets.small),
                            const Text('2024/2/4'),
                          ],
                        ),
                      ],
                    ),
                    const Gap(Insets.medium),
                    ...List.generate(widget.bookedSeats, (index) {
                      return TicketForm(
                        ticketNumber: index,
                        nameController: nameControllers[index],
                        phoneController: phoneControllers[index],
                        countryCodeController: countryCodeControllers[index],
                      );
                    }),
                    const Gap(Insets.extraLarge),
                    GradientBorderButton(onPressed: next, text: 'Next'),
                    const Gap(Insets.extraLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketForm extends StatelessWidget {
  const TicketForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.countryCodeController,
    required this.ticketNumber,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController countryCodeController;
  final int ticketNumber;

  @override
  Widget build(BuildContext context) {
    String? validator(String? query) {
      if (query == null || query.isEmpty) {
        return 'Field is required';
      } else {
        return null;
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Insets.small),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ticket Num ${ticketNumber + 1}',
                    style: const TextStyle(
                      fontWeight: FontsTheme.mediumBigWeight,
                      fontSize: FontsTheme.mediumBigSize,
                      color: ColorsTheme.subtitle,
                    ),
                  ),
                  const Text(
                    'Section P, Row 3',
                    style: TextStyle(
                      fontWeight: FontsTheme.mediumBigWeight,
                      fontSize: FontsTheme.smallSize,
                      color: ColorsTheme.subtitle,
                    ),
                  )
                ],
              ),
              const Gap(Insets.small),
              TextFormField(
                  decoration: ticketingInfoDecoration(labelText: 'Holder name'),
                  controller: nameController,
                  validator: validator),
              Row(
                children: [
                  Expanded(
                    child: CustomItemSelect(
                        labelText: countryCodeController.text,
                        controller: countryCodeController,
                        itemList: const {
                          'Iraq': '+964',
                          'Kuwait': '+965',
                          'Saudi Arabia': '+966',
                        },
                        validator: validator),
                  ),
                  const Gap(Insets.medium),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: phoneController,
                      validator: validator,
                      decoration:
                          ticketingInfoDecoration(labelText: 'Phone number'),
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: phoneController,
                validator: validator,
                decoration: ticketingInfoDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
