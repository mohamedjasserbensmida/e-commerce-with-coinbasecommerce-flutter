import 'package:flutter/material.dart';
import 'package:financeLine/constants/global_variables.dart';
import 'package:financeLine/features/home/screens/category_deals_screen.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);

  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 120,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth >= 768 ? (screenWidth - 600) / 2 : 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          IconData iconData;
          switch (GlobalVariables.categoryImages[index]['title']) {
            case 'Sport':
              iconData = Icons.sports_basketball;
              break;
            case 'Sante':
              iconData = Icons.favorite;
              break;
            case 'Transport':
              iconData = Icons.directions_car;
              break;
            case 'Technologie':
              iconData = Icons.laptop;
              break;
            case 'Fashion':
              iconData = Icons.shopping_bag;
              break;
            default:
              iconData = Icons.category;
              break;
          }
          return GestureDetector(
            onTap: () => navigateToCategoryPage(
                context, GlobalVariables.categoryImages[index]['title']!),
            child: Container(
              width: screenWidth >= 768 ? 120 : (screenWidth - 80) / 3,
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth >= 768 ? 10 : 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Icon(
                      iconData,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    GlobalVariables.categoryImages[index]['title']!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
