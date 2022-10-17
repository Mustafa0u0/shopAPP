import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants/global_variables.dart';

import 'package:shop_app/features/auth/widgets/deal_of_day.dart';
import 'package:shop_app/features/auth/widgets/top_categories.dart';
import 'package:shop_app/features/search/screens/search_screen.dart';

import '../../../providers/user_provider.dart';
import '../../home/screens/home_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(60),
      //   child: AppBar(
      //     flexibleSpace: Container(
      //       decoration:
      //           const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      //     ),
      //     title: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Expanded(
      //           child: Container(
      //             height: 42,
      //             margin: const EdgeInsets.only(left: 15),
      //             child: Material(
      //               borderRadius: BorderRadius.circular(7),
      //               elevation: 1,
      //               child: TextFormField(
      //                 onFieldSubmitted: navigateToSearchScreen,
      //                 decoration: InputDecoration(
      //                     prefixIcon: InkWell(
      //                       onTap: () {},
      //                       child: const Padding(
      //                         padding: const EdgeInsets.only(left: 6),
      //                         child: Icon(
      //                           Icons.search,
      //                           color: Colors.black,
      //                           size: 23,
      //                         ),
      //                       ),
      //                     ),
      //                     filled: true,
      //                     fillColor: Colors.white,
      //                     contentPadding: const EdgeInsets.only(top: 10),
      //                     border: const OutlineInputBorder(
      //                       borderRadius: BorderRadius.all(
      //                         Radius.circular(7),
      //                       ),
      //                       borderSide: BorderSide.none,
      //                     ),
      //                     enabledBorder: const OutlineInputBorder(
      //                       borderRadius: BorderRadius.all(
      //                         Radius.circular(7),
      //                       ),
      //                       borderSide:
      //                           BorderSide(color: Colors.black38, width: 1),
      //                     ),
      //                     hintText: 'Search Amazon.in',
      //                     hintStyle: const TextStyle(
      //                         fontWeight: FontWeight.w500, fontSize: 17)),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Container(
      //           color: Colors.transparent,
      //           height: 42,
      //           margin: const EdgeInsets.symmetric(horizontal: 10),
      //           child: const Icon(
      //             Icons.mic,
      //             color: Colors.black,
      //             size: 25,
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
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
              '${user.name} - ${user.address}',
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
        child: Column(
          children: [
            // AddressBox(),
            // SizedBox(
            //   height: 10,
            // ),
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
                onFieldSubmitted: navigateToSearchScreen,
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
                          backgroundColor: GlobalVariables.secondaryColor,
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
            const TopCategories(),
            const SizedBox(
              height: 10,
            ),
            // CarouseImage(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SectionTitle(
                title: "الأكثر مبيعا",
                pressSeeAll: () {},
              ),
            ),
            const DealOfDay(),
          ],
        ),
      ),
    );
  }
}
