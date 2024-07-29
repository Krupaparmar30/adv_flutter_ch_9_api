
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/modal/product_api_modal.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/provider/product_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Dummy_recepies_api/view/recepies_api_home_page/recepies_api_home_page.dart';

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

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text('Details Screen'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height*0.020,
          ),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<ProductApiProvider>(context, listen: false)
                  .fromMap(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  ProductModal? pro = snapShot.data;
                  return Column(
                    children: [
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
                                image: NetworkImage(
                                  productApiProviderTrue
                                      .productModal!
                                      .products[selIndex].thumbnail
                                      ,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.030,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
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
                    .productModal!
                    .products[selIndex].title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  Text(
                                    " Price: ${productApiProviderTrue
                                        .productModal!
                                        .products[selIndex].price}",
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
                                        Text(
                                          " Category : ${productApiProviderTrue
                                              .productModal!
                                              .products[selIndex].category}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "Descriptioin :  ${productApiProviderTrue
                                              .productModal!
                                              .products[selIndex].description} ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          " Rating : ${productApiProviderTrue
                                              .productModal!
                                              .products[selIndex].rating}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "Rating :  ${productApiProviderTrue
                                              .productModal!
                                              .products[selIndex].reviews[index].rating}",
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
                                  // Padding(
                                  //   padding:
                                  //   const EdgeInsets.only(top: 5, left: 10),
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         "Instructions",
                                  //         style: TextStyle(
                                  //           color: Colors.black,
                                  //           fontSize: 18,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(10.0),
                                  //   child: ListView.builder(
                                  //     physics: NeverScrollableScrollPhysics(),
                                  //     shrinkWrap: true,
                                  //     itemCount: food.recipes[selIndex]
                                  //         .instructions.length,
                                  //     itemBuilder: (context, index) {
                                  //       return Padding(
                                  //         padding: const EdgeInsets.symmetric(
                                  //             vertical: 4.0),
                                  //         child: Text(
                                  //           'Step ${index + 1} - ${food.recipes[selIndex].instructions[index]}',
                                  //           style: TextStyle(
                                  //             fontSize: 15,
                                  //             color: Colors.black,
                                  //           ),
                                  //         ),
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
                                  // Divider(
                                  //   height: height * 0.050,
                                  //   indent: 1,
                                  //   endIndent: 2,
                                  //   color: Colors.black,
                                  // ),
                                  // SizedBox(
                                  //   height: height * 0.010,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         "Ingredients",
                                  //         style: TextStyle(
                                  //           color: Colors.black,
                                  //           fontSize: 18,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsets.all(8.0),
                                  //   child: ListView.builder(
                                  //     //physics: NeverScrollableScrollPhysics(),
                                  //
                                  //     shrinkWrap: true,
                                  //     itemCount: food
                                  //         .recipes[selIndex].ingredients.length,
                                  //     itemBuilder: (context, index) {
                                  //       return Padding(
                                  //         padding: const EdgeInsets.all(2.0),
                                  //         child: Text(
                                  //           '${food.recipes[selIndex].ingredients[index]}',
                                  //           style: TextStyle(
                                  //             fontSize: 15,
                                  //             color: Colors.black,
                                  //           ),
                                  //         ),
                                  //       );
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
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