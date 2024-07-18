import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../common_lib.dart';
import 'ticket_shape.dart';

class QrcodeAndDate extends StatelessWidget {
  const QrcodeAndDate({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.qrData,
  });
  final String qrData;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    return TicketClipShape(
        imageUrl: imageUrl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              child: QrImageView(
                dataModuleStyle: const QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.circle),
                foregroundColor: Colors.white,
                data: qrData,
                version: QrVersions.auto,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 35,
                  padding: Insets.smallAll,
                  decoration: const BoxDecoration(
                      borderRadius: BorderSize.mediumRadius,
                      color: Color(0x806E1B93)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          height: 13, Assets.assetsSvgCalendarOutlined),
                      const Gap(Insets.extraSmall),
                      Text(formatDateRange(startDate, endDate))
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 35,
                  padding: Insets.smallAll,
                  decoration: const BoxDecoration(
                      borderRadius: BorderSize.mediumRadius,
                      color: Color(0x806E1B93)),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          height: 13, Assets.assetsSvgLocationOutlined),
                      const Gap(Insets.extraSmall),
                      Text(formatDateRange(startDate, endDate))
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
