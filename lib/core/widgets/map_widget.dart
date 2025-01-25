import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';

class MapWidget extends StatelessWidget {
  final double? height;
  final bool showPin;
  const MapWidget({
    super.key,
    this.height,
    this.showPin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "map",
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/map.png",
              fit: BoxFit.cover,
              height: height ?? MediaQuery.of(context).size.width,
            ),
          ),
          if(showPin)
          SvgPicture.asset("assets/icons/red_pin.svg"),
        ],
      ),
    );
  }
}
