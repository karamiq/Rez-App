import 'package:flutter/material.dart';
import 'package:app/common_lib.dart';

import '../../../utils/components/buttons/like_button.dart';

class PartyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final String ticketInfo;

  const PartyCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.ticketInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // Wrap InkWell with Material
      type: MaterialType.card, // Ensure the material is transparent
      child: InkWell(
        borderRadius: BorderSize.smallRadius,
        onTap: () => context.pushNamed(RoutesDocument.partyDetailes),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: LikeButton(),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: FontsTheme.mediumBigSize,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.assetsSvgMusic,
                            width: 16,
                            height: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            genre,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Gap(Insets.small),
                          SvgPicture.asset(
                            Assets.assetsSvgTicket,
                            width: 16,
                            height: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            ticketInfo,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
