import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/presentations/screens/user/user_moving/get_price_screen.dart';

class MovingInformationPage extends StatelessWidget {
  const MovingInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Information",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionCard(
              title: "Starting Address",
              content: """
2972 Westheimer Rd. Santa Ana, Illinois
Location Type: House
Floor Level: 04
Is There An Elevator?: Normal Elevator
Choose Parking Type: The Parking Is Right Outside The House
""",
              editable: true,
            ),
            const SizedBox(height: 20),
            SectionCard(
              title: "Destination Address",
              content: """
2972 Westheimer Rd. Santa Ana, Illinois
Location Type: House
Floor Level: 04
Is There An Elevator?: Normal Elevator
Choose Parking Type: The Parking Is Right Outside The House
""",
              editable: true,
            ),
            const SizedBox(height: 20),
            SectionCard(
              title: "Date and Time",
              content: "Date: 12-12-2024     Time: 10:45 AM",
              editable: true,
            ),
            const SizedBox(height: 20),
            SectionCard(
              title: "Items",
              content: """
Bedrooms
- King Bed (Includes Mattress): 2
- Queen Bed (Includes Mattress): 2
Dining Room
- Queen Bed (Includes Mattress): 3
Office / Studio
- King Bed (Includes Mattress): 2
""",
              editable: false,
            ),
            const SizedBox(height: 20),
            const TextField(
              maxLines: 2,
              decoration: InputDecoration(
                labelText: "Additional details",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Upload Photos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[300],
                      child:
                          const Icon(Icons.photo, size: 40, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Center(
                            child: Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text:
                                        "The Estimate Price for\nthis Moving is:",
                                    fontsize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 20),
                                  CustomText(
                                    text: "\$ 700",
                                    fontsize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                      Get.to(() => const GetPriceScreen());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      "Confirm",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));

                      //  AlertDialog(
                      //   title: const Text(
                      //       'The Estimate Price for this Moving is: \$ 700'),
                      //   content: const Text('Are you sure you want to submit?'),
                      //   actions: [
                      //     TextButton(
                      //       onPressed: () {
                      //         Navigator.of(context).pop(); // Close the dialog
                      //       },
                      //       child: const Text('Cancel'),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         Navigator.of(context).pop(); // Close the dialog
                      //         Get.to(() =>
                      //             const GetPriceScreen()); // Navigate to GetPriceScreen
                      //       },
                      //       child: const Text('Confirm'),
                      //     ),
                      //   ],
                      // );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Get Prices",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String content;
  final bool editable;

  const SectionCard({
    super.key,
    required this.title,
    required this.content,
    this.editable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            if (editable)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Handle edit functionality
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
