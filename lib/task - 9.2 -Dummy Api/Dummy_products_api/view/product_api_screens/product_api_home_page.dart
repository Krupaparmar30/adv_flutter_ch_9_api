import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/product_api_modal.dart';
import '../../provider/product_api_provider.dart';

class productApiHomePage extends StatelessWidget {
  const productApiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProductApiProvider productApiProviderFalse =
        Provider.of<ProductApiProvider>(context, listen: false);
    ProductApiProvider productApiProviderTrue =
        Provider.of<ProductApiProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,

          title: Text('Product Data'),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.search)],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.250,
                width: width * 0.960,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                        image: AssetImage('assets/images/k.jpg'))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<ProductApiProvider>(context, listen: false)
                    .fromMap(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    ProductModal? pro = snapShot.data;
                    return ListView.builder(
                        itemCount:  pro!.products.length,
                        itemBuilder: (context, index) => Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      selIndex=index
                                      ;
                                      Navigator.of(context).pushNamed('/sec');
                                    },
                                    child: Container(
                                      height: height * 0.220,
                                      width: width * 0.410,
                                      decoration: BoxDecoration(
                                          color: Colors.white,

                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  // productApiProviderTrue
                                                  //     .productModal!
                                                  //     .products[index]
                                                  //     .thumbnail
                                                  pro.products[index].thumbnail
                                              ))),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: height * 0.240,
                                    width: 175,
                                    color: Colors.white,

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * 0.020,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Text(
                                            productApiProviderTrue
                                                .productModal!
                                                .products[index]
                                                .title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.010,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              productApiProviderTrue
                                                  .productModal!
                                                  .products[index]
                                                  .category,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              productApiProviderTrue
                                                  .productModal!
                                                  .products[index]
                                                  .price
                                                  .toString(),
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              productApiProviderTrue
                                                  .productModal!
                                                  .products[index]
                                                  .rating
                                                  .toString(),
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Text(
                                        //       "Servings:${  productApiProviderTrue
                                        //           .productModal!
                                        //           .products[index]
                                        //           .reviews[index].rating}",
                                        //       style: TextStyle(fontSize: 14),
                                        //     )
                                        //   ],
                                        // ),
                                        Row(
                                          children: [
                                            Text(
                                              "Rating :⭐⭐⭐⭐⭐",
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ));
  }
}

int index = 0;
int selIndex = 0;
