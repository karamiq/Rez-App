import 'package:app/src/maps/search/components/custom_marker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import '../../../../common_lib.dart';
import '../../../../data/providers/location.dart';
import '../components/data_.dart';
import '../components/search_head.dart';
import '../components/show_party_bottom_sheet.dart';

class SearchMapPage extends ConsumerStatefulWidget {
  const SearchMapPage({super.key});

  @override
  ConsumerState<SearchMapPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchMapPage> {
  get currentLocation => ref.watch(locationProvider);
  static late GoogleMapController mapController;
  String themeForMap = '';
  Map<String, Marker> markers = {};

  void onSelected(Party option) {
    final selectedMarker = markers[option.title];
    if (selectedMarker != null) {
      print(option);
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
        // Assuming selectedMarker.onTap!() handles the UI update
        selectedMarker.onTap!();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context)
        .loadString(Assets.assetsThemesDarkMapTheme)
        .then((value) {
      themeForMap = value;
    });
  }

  Future<void> addMarker(String id, LatLng location) async {
    final marker = Marker(
      onTap: () => showPartyModalBottomSheet(context),
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
      body: Padding(
        padding: Insets.noneAll,
        child: Stack(
          children: [
            GoogleMap(
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
              markers: markers.values.toSet(),
              zoomControlsEnabled: false,
              onTap: (pos) => print('Taped pos: $pos'),
              onMapCreated: (controller) {
                mapController = controller;
                mapController.setMapStyle(themeForMap);
                mapController = controller;

                for (var party in searchparties) {
                  addMarker(
                    party.title,
                    LatLng(party.latitude, party.longitude),
                  );
                }
              },
              initialCameraPosition: CameraPosition(
                zoom: 11,
                target: pos,
              ),
            ),
            const SearchMapHead()
          ],
        ),
      ),
    );
  }
}

/*
class CustomSearchDelegate extends SearchDelegate {
  final List<Party> itemsList;

  CustomSearchDelegate(
      {super.searchFieldLabel,
      super.searchFieldStyle,
      super.searchFieldDecorationTheme,
      super.keyboardType,
      super.textInputAction,
      required this.itemsList});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  Widget buildSearchField(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      fillColor: const Color(0x4DD67DFF),
      hintText: 'Search',
      hintStyle: const TextStyle(
        color: Color.fromARGB(255, 247, 0, 0),
      ),
      prefixIcon: Padding(
        padding: Insets.smallAll,
        child: SvgPicture.asset(Assets.assetsSvgSearchNormal),
      ),
      border: const OutlineInputBorder(borderRadius: BorderSize.smallRadius),
    ));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // Customize the overall AppBar theme
    return ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.transparent),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Color(0x4DD67DFF),
          filled: true,
          iconColor: Colors.amber,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderSize.extraLargeRadius,
              borderSide: BorderSide.none),
        ));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: Insets.extraSmallAll,
      child: IconButton.filled(
        icon: const Icon(
          Icons.chevron_left_outlined,
          size: 30,
        ),
        onPressed: () => context.pop(),
        style: IconButton.styleFrom(
            foregroundColor: const Color(0xFFA763FD),
            backgroundColor: const Color(0x4DD67DFF)),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in itemsList) {
      if (item.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.title);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(matchQuery[index]),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in itemsList) {
      if (item.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item.title);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(matchQuery[index]),
      ),
    );
  }
}
*/

/**
 * Autocomplete<Party>(
                    optionsViewOpenDirection: OptionsViewOpenDirection.down,
                    optionsBuilder: (textEditingValue) {
                      return Searchparties.where((storage) => storage.title
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()))
                          .toList();
                    },
                    displayStringForOption: (storage) => storage.title,
                    onSelected: (option) {
                      final selectedMarker = markers[option.title];
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
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Padding(
                        padding: Insets.smallAll,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: ColorsTheme.backGround,
                              borderRadius: BorderSize.mediumRadius,
                              border: Border.all(
                                color: ColorsTheme.border,
                              ),
                            ),
                            child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                final party = options.elementAt(index);
                                return ListTile(
                                  title: Text(party.title),
                                  onTap: () {
                                    onSelected(party);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    fieldViewBuilder:
                        (context, controller, focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: controller,
                        focusNode: focusNode,
                        decoration: searchMapDecoration(),
                        onSubmitted: (value) {
                          if (value.isNotEmpty) onFieldSubmitted();
                        },
                      );
                    },
                  )
 */
