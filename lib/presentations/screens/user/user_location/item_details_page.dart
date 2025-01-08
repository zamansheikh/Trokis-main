import 'package:dotted_border/dotted_border.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/presentations/screens/user/user_location/moving_information_page.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({super.key});

  @override
  ItemDetailsPageState createState() => ItemDetailsPageState();
}

class ItemDetailsPageState extends State<ItemDetailsPage> {
  final Map<String, int> itemCounts = {
    'Bed Rooms': 0,
    'Dining Room': 0,
    'Living Room': 0,
    'Office / Studio': 0,
    'Electronics': 0,
    'Appliances': 0,
    'Lamps': 0,
    'Miscellaneous': 0,
    'Terrace': 0,
    'Corporate Offices': 0,
    'Industrial': 0,
    'Boxes and Suitcases': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: "Item Details",
          fontsize: 20,
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
        forceMaterialTransparency: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Add back functionality here
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Select Item',
              fontsize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            ...itemCounts.keys.map((item) => ExpansionTile(
                  title: Row(
                    children: [
                      Icon(Icons.bed), // Replace with the relevant icon
                      SizedBox(width: 10),
                      CustomText(text: item),
                    ],
                  ),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            setState(() {
                              if (itemCounts[item]! > 0) {
                                itemCounts[item] = itemCounts[item]! - 1;
                              }
                            });
                          },
                        ),
                        CustomText(
                          text: 'Total: ${itemCounts[item]}',
                          fontsize: 16,
                        ),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            setState(() {
                              itemCounts[item] = itemCounts[item]! + 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Upload Video',
                suffixIcon: Icon(Icons.attach_file),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Additional details',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            CustomText(
              text: 'Upload photos',
              fontsize: 16,
            ),
            SizedBox(height: 10),
            Stack(
              children: [
                DottedBorder(
                  strokeWidth: 3,
                  dashPattern: [8, 4],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 200,
                      width: 120,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(Icons.add, size: 40, color: Colors.black),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Get.to(() => MovingInformationPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.chevron_right, size: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
