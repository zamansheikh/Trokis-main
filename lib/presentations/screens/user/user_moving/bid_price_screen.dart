import 'package:trokis/presentations/screens/user/user_moving/driver_information_screen.dart';
import 'package:trokis/presentations/screens/user/user_moving/track_driver_resquest_widget.dart';

import '../../../../core/exports/exports.dart';

class BidPriceScreen extends StatefulWidget {
  const BidPriceScreen({super.key});

  @override
  State<BidPriceScreen> createState() => _BidPriceScreenState();
}

class _BidPriceScreenState extends State<BidPriceScreen> {
  List<TrackDriverResquestWidget> allDriverRequests = List.generate(
      5,
      (index) => TrackDriverResquestWidget(
            onTapConfirm: () {
              Get.to(() => const DriverInformationScreen());
            },
            truckNumber: 'Truck Number',
            palletSpaces: 'Pallet Spaces',
            amoutOfPeople: 2,
            trailerSize: 2,
            driverName: 'Driver Name',
            driverPhoto:
                'https://s3-alpha-sig.figma.com/img/1ac6/1c9d/bf615b3716c8ec45b9ad288eb805885d?Expires=1737331200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jja-DkUf63mnpyWS6H7u0HmNAH321r0seAMkiD227axZ2acxu~NzGBD2xzRtUUMtgEUaJt6r9fa688qoHFJry9GVjVixwhkqJFc7NwixDDn3PCoSux8OmYq479sYPe4GnMDgGDXXunhMc0DER1Mdm842oPLr5wQ0j1aZKOx6lz7zqtnlKQKXC6PlX~mTGG4jQh8S9vuWgQzIMCRQ6oyP-1fBy0tuLo-3flN0VeN-QrQ1nGHy1uAQu5lVIA4erKpeXT23OQ3-Gq1ujtzAYSi3i6VazHJ~VE-6xYXyzhRWYK9O4vyX6kl0tqklh3SpbyuT8v45I~6vqDKNq27dnz4dqg__',
            driverRating: 4.5,
            bidPrice: 700,
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        title: const Text('Bid Price'),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: allDriverRequests,
        ),
      ),
    );
  }
}
