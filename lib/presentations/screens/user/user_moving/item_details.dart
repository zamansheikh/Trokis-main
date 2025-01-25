import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trokis/core/exports/exports.dart';
import 'package:trokis/core/widgets/icon_form_field.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  Map<String, String> itemAssets = {
    "Bedrooms": "assets/icons/bed.svg",
    "Dining Room": "assets/icons/tables.svg",
    "Living Room": "assets/icons/living.svg",
    "Office / Studio": "assets/icons/office.svg",
    "Electronics": "assets/icons/electronics.svg",
    "Appliances": "assets/icons/appliances.svg",
    "Lamps": "assets/icons/lamp.svg",
    "Miscellaneous": "assets/icons/miscellaneous.svg",
    "Terrace": "assets/icons/terrace.svg",
    "Corporate Offices": "assets/icons/corporate_office.svg",
    "Industrial": "assets/icons/industrial.svg",
    "Boxes and Suitcases": "assets/icons/box.svg",
  };

  List<File> _imageFiles = [];

  void _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom, // Filter by file type
      allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'], // Allow image types
    );

    if (result != null) {
      setState(() {
        _imageFiles.addAll(result.paths.map((path) => File(path!)).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "Item Details",
          style: TextStyle(
            fontFamily: "Lora",
            fontSize: 18,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              spacing: 12,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Select Item",
                      style: TextStyle(
                        fontFamily: "Lora",
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                createList(),
                  IconFormField(
                    hintText: "Upload photos/videos(optional)",
                    iconPath: "assets/icons/file.svg",
                    onTap: () {
                      _pickFiles();
                    },
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.5,
                      color: Color(0xff8a8a8a),
                    ),
                  ),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Additional details",
                      hintStyle: const TextStyle(
                        fontFamily: "Lora",
                        color: Color(0xff545454),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (_imageFiles.isNotEmpty) uploadPhotos(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: CustomButton(
                    onTap: () {},
                    text: "Next",
                    tailingIcon: "assets/icons/next.svg",
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createList() {
    return Column(
      children: [
        for (var item in itemAssets.keys)
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xfffcfdfd),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    itemAssets.keys.elementAt(0) == item ? 10 : 0),
                bottom: Radius.circular(
                    itemAssets.keys.elementAt(itemAssets.keys.length - 1) ==
                            item
                        ? 10
                        : 0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 22),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Center(
                    child: SvgPicture.asset(
                      itemAssets[item]!,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Lora",
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/arrow_down.svg"),
                const SizedBox(width: 22),
              ],
            ),
          ),
      ],
    );
  }

  Widget uploadPhotos() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Upload Photos",
              style: TextStyle(
                fontFamily: "Lora",
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          itemCount: _imageFiles.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1 / 1.5,
          ),
          itemBuilder: (context, index) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(_imageFiles[index]),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  right: -2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _imageFiles.removeAt(index);
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(90, 0, 0, 0),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ]
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: Color(0xff2b2a2a),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
