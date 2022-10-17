import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/common/widgets/custom_button.dart';
import 'package:shop_app/features/address/screens/addrees_screen.dart';
import 'package:shop_app/features/cart/widgets/cart_product.dart';
import 'package:shop_app/features/cart/widgets/cart_subtotal.dart';

import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';
import '../../search/screens/search_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'السلة',
          style: TextStyle(
              color: GlobalVariables.secondaryColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // const AddressBox(),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    itemCount: user.cart.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CartCard(index: index),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )),
          ),
          CheckoutCard(
            onTap: () => navigateToAddress(sum),
          )
        ],
      ),
    );
  }
}
