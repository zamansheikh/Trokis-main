import 'package:trokis/core/exports/exports.dart';

class CompleteRequestScreen extends StatefulWidget {
  const CompleteRequestScreen({super.key});

  @override
  State<CompleteRequestScreen> createState() => _CompleteRequestScreenState();
}

class _CompleteRequestScreenState extends State<CompleteRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        elevation: 0,
        title: CustomText(
          text: 'Complete Request',
          color: Colors.black,
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
