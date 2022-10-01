import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants/global_variables.dart';
import 'package:shop_app/features/auth/widgets/orders.dart';
import 'package:shop_app/features/auth/widgets/top_buttons.dart';
import 'package:shop_app/providers/user_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/amazon_in.png',
                    width: 120, height: 45, color: Colors.black),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Icon(Icons.search_outlined),
                    ],
                  ))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                      text: 'hello ',
                      style: const TextStyle(fontSize: 22, color: Colors.black),
                      children: [
                        TextSpan(
                            text: user.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Colors.black))
                      ]),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TopButtons(),
          const SizedBox(
            height: 20,
          ),
          const Orders(),
        ],
      ),
    );
  }
}
