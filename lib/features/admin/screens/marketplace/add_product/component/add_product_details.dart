import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddProductDetails extends StatelessWidget {
  const AddProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Product Name",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Product Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Product Price",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Product Price",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Product Description",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Enter Product Description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Product Type",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: const ["App", "Game", "Website", "Software"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Product Category",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: const [
                "Watch apps",
                "Watch faces",
                "Art & Design",
                "Auto & Vehicles",
                "Beauty",
                "Books & Reference",
                "Business",
                "Comics",
                "Communication",
                "Dating",
                "Education",
                "Entertainment",
                "Events",
                "Finance",
                "Food & Drinks",
                "Health & Fitness",
                "House & Home",
                "Libraries & Demo",
                "Lifestyle",
                "Maps & Navigation",
                "Medical",
                "Music & Audio",
                "News & Magazines",
                "Parenting",
                "Personalization",
                "Photography",
                "Productivity",
                "Shopping",
                "Social",
                "Sports",
                "Tools",
                "Travel & Local",
                "Video Players & Editors",
                "Weather",
                "Action",
                "Adventure",
                "Arcade",
                "Board",
                "Card",
                "Casino",
                "Casual",
                "Educational",
                "Music",
                "Puzzle",
                "Racing",
                "Role Playing",
                "Simulation",
                "Sports",
                "Strategy",
                "Trivia",
                "Word",
                "Others"
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlackColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text("Add Product"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
