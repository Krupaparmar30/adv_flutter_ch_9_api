import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/modal/product_api_modal.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/provider/product_api_provider.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/view/product_api_screens/product_api_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_api_prodcut_provider.dart';

class productDeatilsPage extends StatelessWidget {
  const productDeatilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProductApiProvider productApiProviderFalse =
        Provider.of<ProductApiProvider>(context, listen: false);
    ProductApiProvider productApiProviderTrue =
        Provider.of<ProductApiProvider>(context, listen: true);
    CartProvider cartApiProdcutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text('Details Screen'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.020,
          ),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<ProductApiProvider>(context, listen: false)
                  .fromMap(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  ProductModal? pro = snapShot.data;
                  return Column(children: [
                    Center(
                      child: Container(
                        height: height * 0.3,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              )
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(productApiProviderTrue
                                  .productModal!.products[selIndex].thumbnail),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.030,
                    ),
                    Expanded(
                        child: Container(
                      height: height * 1,
                      width: width * 0.950,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            SizedBox(
                              height: height * 0.020,
                            ),
                            Text(
                              productApiProviderTrue
                                  .productModal!.products[selIndex].title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Text(
                              " Price: ${productApiProviderTrue.productModal!.products[selIndex].price}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        " Category : ${productApiProviderTrue.productModal!.products[selIndex].category}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    "DiscountPercentage :  ${productApiProviderTrue.productModal!.products[selIndex].discountPercentage} ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " Rating : ${productApiProviderTrue.productModal!.products[selIndex].rating}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Reviews Rating :  ${productApiProviderTrue.productModal!.products[selIndex].reviews[index].rating}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: height * 0.050,
                              indent: 1,
                              endIndent: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                // 'Step ${index + 1} - ${food.recipes[selIndex].instructions[index]}',
                                "${productApiProviderTrue.productModal!.products[selIndex].description}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Divider(
                              height: height * 0.050,
                              indent: 1,
                              endIndent: 2,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "All Review Infometioin",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${productApiProviderTrue.productModal!.products[selIndex].reviews[index].comment}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Rating :⭐⭐⭐⭐⭐",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${productApiProviderTrue.productModal!.products[selIndex].reviews[index].reviewerName}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${productApiProviderTrue.productModal!.products[selIndex].reviews[index].reviewerEmail}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${productApiProviderTrue.productModal!.products[selIndex].reviews[index].runtimeType}",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.010,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  cartList.add(productApiProviderFalse
                                      .productModal!.products[selIndex]);
                                  for (int i = 0;
                                      i <
                                          productApiProviderFalse
                                              .productModal!.products.length;
                                      i++) {
                                    qty.add(selIndex);
                                  }
                                  cartApiProdcutProvider.discountedPrice();
                                  cartApiProdcutProvider.totalPrice();
                                  Navigator.pushNamed(context, '/cart');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                ),
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                  ]);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


List cartList = [];
List<int> qty = [];
