import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/constants/global_variables.dart';
import 'package:shop_app/features/admin/screens/category_deals_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({Key? key}) : super(key: key);
  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: 60,
    //   child: ListView.builder(
    //       itemCount: GlobalVariables.categoryImages.length,
    //       scrollDirection: Axis.horizontal,
    //       itemExtent: 75,
    //       itemBuilder: (context, index) {
    //         return GestureDetector(
    //           onTap: () => navigateToCategoryPage(
    //             context,
    //             GlobalVariables.categoryImages[index]['title']!,
    //           ),
    //           child: Column(
    //             children: [
    //               Container(
    //                 padding: const EdgeInsets.symmetric(horizontal: 10),
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(50),
    //                   child: Image.asset(
    //                     GlobalVariables.categoryImages[index]['image']!,
    //                     fit: BoxFit.cover,
    //                     height: 40,
    //                     width: 40,
    //                   ),
    //                 ),
    //               ),
    //               Text(
    //                 GlobalVariables.categoryImages[index]['title']!,
    //                 style: const TextStyle(
    //                     fontSize: 12, fontWeight: FontWeight.w400),
    //               )
    //             ],
    //           ),
    //         );
    //       }),
    // );
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: GlobalVariables.categoryImages[index]['image']!,
          title: GlobalVariables.categoryImages[index]['title']!,
          press: () => navigateToCategoryPage(
            context,
            GlobalVariables.categoryImages[index]['title']!,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 16 / 2, horizontal: 16 / 4),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 16 / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
