import 'dart:math';
import 'package:app/src/maps/search/components/custom_marker.dart';
import 'package:app/src/maps/search/components/search_google_map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import '../../../common_lib.dart';
import '../../../data/providers/location.dart';
import '../../likes/likes.dart';
import 'components/search_bar.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  get currentLocation => ref.watch(locationProvider);
  late GoogleMapController mapController;
  Map<String, Marker> markers = {};
  List<Party> ok = [];
  String themeForMap = '';

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString(Assets.assetsThemesDarkMapTheme)
        .then((value) {
      themeForMap = value;
    });
  }

  LatLng getRandomLocation(
      double minLat, double maxLat, double minLng, double maxLng) {
    final random = Random();
    final lat = minLat + (maxLat - minLat) * random.nextDouble();
    final lng = minLng + (maxLng - minLng) * random.nextDouble();
    return LatLng(lat, lng);
  }

  void onSelected(option) {
    final selectedMarker = markers[option.id];
    if (selectedMarker != null) {
      mapController
          .animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(option.latitude, option.longitude),
            zoom: 13,
          ),
        ),
      )
          .then((_) {
        setState(() {
          selectedMarker.onTap!();
        });
      });
    }
  }

  Future<void> addMarker(String id, LatLng location) async {
    final marker = Marker(
      onTap: () => print('the marker pos: $location'),
      markerId: MarkerId(id),
      position: location,
      icon: await CustomMarker(location: location)
          .toBitmapDescriptor(logicalSize: const Size(450, 450)),
    );

    setState(() {
      markers[id] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    LatLng pos;
    if (currentLocation == null) {
      pos = DefaultVars.defaultLocation;
    } else {
      pos = LatLng(currentLocation?.latitude, currentLocation?.longitude);
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CustomGoogleMap(
            markers: markers,
            themeForMap: themeForMap,
            mapControllerCallback: (controller) {
              mapController = controller;
              mapController.setMapStyle(themeForMap);
              for (var i = 0; i < 30; i++) {
                const minLat = 33.2000;
                const maxLat = 33.4000;
                const minLng = 44.2000;
                const maxLng = 44.5000;
                final randomLocation =
                    getRandomLocation(minLat, maxLat, minLng, maxLng);
                addMarker('marker_$i', randomLocation);
              }
              addMarker('marker_me', const LatLng(33.34162, 44.27447));
              markers['marker_0'] = const Marker(
                icon: BitmapDescriptor.defaultMarker,
                markerId: MarkerId('123'),
                position: LatLng(33.34162, 44.27447),
              );
            },
            initialPosition: pos,
          ),
          SafeArea(
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
                    child: CustomSearchBar(
                      allParties: [],
                      onSelected: onSelected,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
