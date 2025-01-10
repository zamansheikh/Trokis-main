import 'package:flutter_svg/svg.dart';
import 'package:trokis/core/exports/exports.dart';

class DriverInfoWidget extends StatefulWidget {
  final String? status;
  const DriverInfoWidget({
    this.status,
    super.key,
  });

  @override
  State<DriverInfoWidget> createState() => _DriverInfoWidgetState();
}

class _DriverInfoWidgetState extends State<DriverInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Driver Details
          const SizedBox(height: 20),
          Text(
            widget.status ?? 'Driver Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'DHK METRO HA 64-8549',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 5),
          const Text(
            '48-foot trailer—24 pallets',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),

          const SizedBox(height: 20),

          // Driver Profile Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/images/confirm.png'), // Replace with your image
              ),
              const SizedBox(width: 15),

              // Driver Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sabbir Hossein',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          SizedBox(width: 5),
                          Text(
                            '4.65',
                            style:
                                TextStyle(fontSize: 10, color: Colors.black87),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 15,
                        width: .5,
                        child: VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '+995 654654',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 15,
                        width: .5,
                        child: VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'example@gmail.com',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Send Message Button
              ElevatedButton.icon(
                onPressed: () {
                  // Message action
                },
                icon: SvgPicture.asset(
                  'assets/icons/message_icon.svg',
                  height: 20,
                ),
                label: CustomText(
                    text: 'Send A Free Message',
                    color: Colors.black,
                    fontsize: 16),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  backgroundColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                        color: Colors.black), // Added black border
                  ),
                ),
              ),

              // Call Button
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/phone_icon.svg',
                  height: 25,
                  width: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
