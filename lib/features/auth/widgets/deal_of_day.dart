import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/loader.dart';
import 'package:shop_app/features/auth/services/home_services.dart';
import 'package:shop_app/features/product_details/screens/product_details_screen.dart';

import 'package:shop_app/models/product.dart';

import '../../../constants/global_variables.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(context, ProductDetailScreen.routeName,
        arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailScreen,
                // child: Column(
                //   children: [
                //     Container(
                //       alignment: Alignment.topLeft,
                //       padding: const EdgeInsets.only(left: 10, top: 15),
                //       child: const Text(
                //         'Deal of the day',
                //         style: TextStyle(fontSize: 20),
                //       ),
                //     ),
                //     Image.network(
                //       product!.images[0],
                //       height: 235,
                //       fit: BoxFit.fitHeight,
                //     ),
                //     Container(
                //       padding: const EdgeInsets.only(
                //         left: 15,
                //       ),
                //       alignment: Alignment.topLeft,
                //       child: const Text(
                //         '\$100',
                //         style: TextStyle(fontSize: 18),
                //       ),
                //     ),
                //     Container(
                //       alignment: Alignment.topLeft,
                //       padding:
                //           const EdgeInsets.only(left: 15, top: 5, right: 40),
                //       child: const Text(
                //         'Mustafa',
                //         maxLines: 2,
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //     ),
                //     SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: product!.images
                //             .map(
                //               (e) => Image.network(
                //                 e,
                //                 fit: BoxFit.fitWidth,
                //                 height: 100,
                //                 width: 100,
                //               ),
                //             )
                //             .toList(),
                //       ),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.symmetric(vertical: 15)
                //           .copyWith(left: 15),
                //       alignment: Alignment.topLeft,
                //       child: Text(
                //         'See All deals',
                //         style: TextStyle(color: Colors.cyan.shade800),
                //       ),
                //     )
                //   ],
                // ),
                child: GridView.count(
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
                            Container(
                              margin: const EdgeInsets.all(5),
                              child: Image.network(
                                product!.images[0],
                                height: 120,
                                width: 120,
                                // fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsetsDirectional.only(bottom: 8),
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                product!.name,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: GlobalVariables.secondaryColor),
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                product!.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
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
                                    '${product!.price}\$',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: GlobalVariables.secondaryColor),
                                  ),
                                  const Icon(
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
                ));
  }
}
