import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants/global_variables.dart';

import '../../../models/product.dart';
import '../../admin/screens/category_deals_screen.dart';
import '../../auth/widgets/deal_of_day.dart';
import '../../auth/widgets/top_categories.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
void navigateToCategoryPage(BuildContext context, String category) {
  Navigator.pushNamed(context, CategoryDealsScreen.routeName,
      arguments: category);
}

class HomeScreen extends StatelessWidget {
  Product? product;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 217, 217),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: 16 / 2),
            Text(
              "زعطر الفيراج الاول",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "متجرك",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "لبيع ماتريد",
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextFormField(
                onSaved: (value) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "ابحث...",
                  border: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  errorBorder: outlineInputBorder,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset("assets/icons/Search.svg"),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16 / 2),
                    child: SizedBox(
                      width: 48,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: GlobalVariables.secondaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        onPressed: () {},
                        child: SvgPicture.asset("assets/icons/Filter.svg"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
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
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: SectionTitle(
                    title: "New Arrival",
                    pressSeeAll: () {},
                  ),
                ),
                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.58,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    for (int i = 1; i < 8; i++)
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                          start: 15,
                          end: 15,
                          top: 10,
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: GlobalVariables.secondaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text(
                                      '-50%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                // margin: const EdgeInsets.all(5),
                                child: Image.network(
                                  'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/macbook-air-space-gray-select-201810?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1633027804000',
                                  height: 120,
                                  width: 120,
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsetsDirectional.only(bottom: 8),
                              alignment: AlignmentDirectional.centerStart,
                              child: const Text(
                                'اسم المنتج',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: GlobalVariables.secondaryColor),
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: const Text(
                                'تفاصيل المنتج',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: GlobalVariables.secondaryLightColor),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'السعر \$',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: GlobalVariables.secondaryColor),
                                  ),
                                  Icon(
                                    Icons.shopping_cart_checkout,
                                    color: GlobalVariables.secondaryColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
            //           const PopularProducts(),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.pressSeeAll,
  }) : super(key: key);
  final String title;
  final VoidCallback pressSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: GlobalVariables.secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
        TextButton(
          onPressed: pressSeeAll,
          child: const Text(
            "See All",
            style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  final String price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(16 / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset(
                image,
                height: 132,
              ),
            ),
            const SizedBox(height: 16 / 2),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(width: 16 / 4),
                Text(
                  "\$" + price.toString(),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
