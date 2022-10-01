import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/loader.dart';
import 'package:shop_app/features/admin/screens/add_product_screen.dart';
import 'package:shop_app/features/admin/services/admin_services.dart';
import 'package:shop_app/features/auth/widgets/singleProduct.dart';
import 'package:shop_app/models/product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminSrvices = AdminServices();
  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminSrvices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminSrvices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 15),
                itemCount: products!.length,
                itemBuilder: ((context, index) {
                  final productData = products![index];
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(start: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          child: SingleProduct(image: productData.images[0]),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: Text(
                                productData.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                              IconButton(
                                  onPressed: () =>
                                      deleteProduct(productData, index),
                                  icon: const Icon(Icons.delete_outline)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddProduct,
              tooltip: 'Add a Product',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
