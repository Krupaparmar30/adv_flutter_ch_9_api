import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../modal/recepies_api_modal.dart';
import '../../../provider/recepies_api_provider.dart';
import '../recepies_api_home_page.dart';

class recipesDetailsPage extends StatelessWidget {
  const recipesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              future: Provider.of<RecepiesApiProvider>(context, listen: false)
                  .fromMap(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  RecipesData? food = snapShot.data;
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
                                  food!.recipes[selIndex].image,
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
                                    food!.recipes[selIndex].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height * 0.010,
                                  ),
                                  Text(
                                    " Cuisine: ${food!.recipes[selIndex].cuisine}",
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
                                          " Difficulty : ${food!.recipes[selIndex].difficulty}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "Time :  ${food!.recipes[selIndex].cookTimeMinutes} min",
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
                                          " Servings : ${food!.recipes[selIndex].servings}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          "ReviewCount :  ${food!.recipes[selIndex].reviewCount}",
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
                                    padding:
                                        const EdgeInsets.only(top: 5, left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Instructions",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: food.recipes[selIndex]
                                          .instructions.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Text(
                                            'Step ${index + 1} - ${food.recipes[selIndex].instructions[index]}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      },
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
                                          "Ingredients",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      //physics: NeverScrollableScrollPhysics(),

                                      shrinkWrap: true,
                                      itemCount: food
                                          .recipes[selIndex].ingredients.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            '${food.recipes[selIndex].ingredients[index]}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
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
