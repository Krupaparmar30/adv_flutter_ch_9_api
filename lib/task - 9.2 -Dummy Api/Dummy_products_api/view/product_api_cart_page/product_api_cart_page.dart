import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/view/prodcut_api_details_page/prodcut_api_details_page.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/view/product_api_screens/product_api_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_api_prodcut_provider.dart';
import '../../provider/product_api_provider.dart';

class productApiCartPage extends StatelessWidget {
  const productApiCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CartApiProdcutProvider cartProviderFalse = Provider.of(context, listen: false);
    CartApiProdcutProvider cartProviderTrue = Provider.of(context, listen: true);

    ProductApiProvider productApiProviderFalse =
        Provider.of<ProductApiProvider>(context, listen: false);
    ProductApiProvider productApiProviderTrue =
        Provider.of<ProductApiProvider>(context, listen: true);
    // cartProvider.onUpdate = () {
    //   if (context.mounted) {
    //     (context as Element).markNeedsBuild();
    //   }
    // };
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        centerTitle: true,
      ),
      body: Column(

        children: [

          SizedBox(
            height: height * 0.020,
          ),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: productApiProviderFalse.fromMap(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  //  ProductModal? pro = snapShot.data;
                  return Column(
                    children: [
                      ...List.generate(
                        cartList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right:0,bottom: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0,2)
                                    ,
                                  blurRadius: 2,spreadRadius: 2
                                )
                              ]

                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: height * 0.020,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Container(
                                              height: height * 0.250,
                                              width: width * 0.470,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        cartList[index].thumbnail),
                                                  )),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 35),
                                            child: Container(
                                              height: height * 0.230,
                                              width: width * 0.5,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade50,
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      cartList[index].title,
                                                      style: TextStyle(fontSize: 16),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text("Price :"),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.2,
                                                        child: Text(
                                                          '\$${cartList[index].price}',
                                                          style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 50),
                                                    child: Container(
                                                      height: height * 0.05,
                                                      width: width * 0.560,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(10),
                                                        color: Colors.white
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              cartProviderFalse.removeQty(index);

                                                            },
                                                            child: Container(


                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius.circular(5),
                                                                color: Colors.white,
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(right:5),
                                                                child: Icon(Icons.remove,
                                                                    size: 16),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(right:0),
                                                            child: Text(qty[index].toString()),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              cartProviderFalse.addQty(index);

                                                            },
                                                            icon: Icon(Icons.add,
                                                                color: Colors.red),
                                                          ),
                                                          IconButton(
                                                            onPressed: () {
                                                              cartProviderFalse.removeFromCart(index);

                                                            },
                                                            icon: Icon(Icons.delete,
                                                                color: Colors.red),
                                                          ),

                                                        ],
                                                      ),

                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.030,
                      ),
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
