import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mytaste/Constant/Colors.dart';
import 'package:mytaste/model/GeoCoding.dart';

class HomeHeading extends StatelessWidget {
  final GeoCoding geoCoding;
  final AdvancedDrawerController drawercontroller;
  const HomeHeading({
    Key key,
    this.geoCoding,
    this.drawercontroller,
  })  : assert(geoCoding != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * 0.7,
          height: 40,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8.0),
                child: Icon(
                  Icons.location_pin,
                  color: mainColor,
                  size: 35,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    geoCoding.results[0].addressComponents[1].shortName.length >
                            20
                        ? "${geoCoding.results[0].addressComponents[1].shortName.substring(0, 20)}..."
                        : geoCoding.results[0].addressComponents[1].shortName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // Divider(),
                  Text(
                    geoCoding.results[0].formattedAddress.length < 40
                        ? geoCoding.results[0].formattedAddress
                        : "${geoCoding.results[0].formattedAddress.substring(0, 40)}...",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.yellow,
          width: size.width * 0.3,
          height: 40,
          child: InkWell(
            onTap: () {
              drawercontroller.showDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: drawercontroller,
                builder: (context, value, child) {
                  return Icon(
                    value.visible ? Icons.clear : Icons.short_text,
                    size: 35,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
