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

  const PartyCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.ticketInfo,
    required this.isExpired,
    required this.expiredDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // Wrap InkWell with Material
      type: MaterialType.card, // Ensure the material is transparent
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0), // example radius
        onTap: isExpired
            ? null
            : () => context.pushNamed(RoutesDocument.partyDetailes),
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: isExpired
                  ? ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.srcOver)
                  : const ColorFilter.mode(
                      Colors.transparent, BlendMode.srcOver),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), // example radius
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8.0), // example radius
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
                                fontSize: 18, // example size
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                const Icon(Icons.music_note,
                                    color: Colors.white, size: 16),
                                const SizedBox(width: 4.0),
                                Text(
                                  genre,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                const Icon(Icons.confirmation_number,
                                    color: Colors.white, size: 16),
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
            if (isExpired)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    expiredDate.formatDate(),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
