import 'package:trokis/core/exports/exports.dart';

class TrackDriverResquestWidget extends StatelessWidget {
  final VoidCallback? onTapConfirm;
  final VoidCallback? onTapCancel;
  final String truckNumber;
  final String palletSpaces;
  final int amoutOfPeople;
  final int trailerSize;
  final String driverName;
  final String driverPhoto;
  final double driverRating;
  final double bidPrice;
  const TrackDriverResquestWidget({
    super.key,
    this.onTapConfirm,
    this.onTapCancel,
    required this.truckNumber,
    required this.palletSpaces,
    required this.amoutOfPeople,
    required this.trailerSize,
    required this.driverName,
    required this.driverPhoto,
    required this.driverRating,
    required this.bidPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Truck Information",
            fontsize: 20,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Truck Number",
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: truckNumber,
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Trailer Size",
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "$trailerSize ft",
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Pallet Spaces",
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: palletSpaces,
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Amount of People",
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "$amoutOfPeople",
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  driverPhoto,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              CustomText(
                text: driverName,
                fontsize: 16,
              ),
              CustomText(
                text: "$driverRating",
                fontsize: 16,
              ),
              CustomButton(
                onTap: () {},
                text: "\$ $bidPrice",
                width: 10.w,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  onTap: () {
                    if (onTapConfirm != null) {
                      onTapConfirm!();
                    }
                  },
                  text: "Accept",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomButton(
                  textStyle: TextStyle(color: Colors.red, fontSize: 16),
                  color: Colors.grey[200],
                  onTap: () {
                    if (onTapCancel != null) {
                      onTapCancel!();
                    }
                  },
                  text: "Cancel",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
