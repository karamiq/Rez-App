import 'package:flutter/material.dart';
import 'package:app/common_lib.dart';

import '../../../utils/components/buttons/like_button.dart';

class PartyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;
  final String ticketInfo;
  final bool isExpired;
  final DateTime expiredDate;
  final String type;

  const PartyCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.ticketInfo,
    required this.isExpired,
    required this.expiredDate,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.small),
      child: InkWell(
        borderRadius: BorderSize.mediumRadius,
        onTap: isExpired
            ? null
            : () async {
                if (type == 'ticket') {
                  await context.pushNamed(RoutesDocument.partyDetailes);
                } else {
                  await context.pushNamed(RoutesDocument.choosingSeat);
                }
              },
        child: Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderSize.mediumRadius,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderSize.mediumRadius,
                    child: ColorFiltered(
                      colorFilter: isExpired
                          ? ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.srcOver)
                          : const ColorFilter.mode(Colors.transparent, BlendMode.color),
                      child: Image.network(
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                        imageUrl,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Text(
                              'Image failed to load',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: LikeButton(),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: Insets.mediumAll,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: FontsTheme.bigSize,
                              color:
                                  isExpired ? Colors.white.withOpacity(.3) : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: Insets.small,
                          ),
                          Row(
                            children: [
                              Icon(Icons.music_note,
                                  color: isExpired
                                      ? Colors.white.withOpacity(.3)
                                      : Colors.white,
                                  size: FontsTheme.mediumSize),
                              const SizedBox(width: Insets.small),
                              Text(
                                genre,
                                style: TextStyle(
                                  color: isExpired
                                      ? Colors.white.withOpacity(.3)
                                      : Colors.white,
                                ),
                              ),
                              const SizedBox(width: Insets.small),
                              Icon(Icons.confirmation_number,
                                  color: isExpired
                                      ? Colors.white.withOpacity(.3)
                                      : Colors.white,
                                  size: FontsTheme.mediumSize),
                              const SizedBox(width: Insets.small),
                              Text(
                                ticketInfo,
                                style: TextStyle(
                                  color: isExpired
                                      ? Colors.white.withOpacity(.3)
                                      : Colors.white,
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
            if (isExpired)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Expired at ${expiredDate.formatDate()}',
                    style: const TextStyle(
                        fontSize: FontsTheme.bigSize, fontWeight: FontWeight.bold),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
