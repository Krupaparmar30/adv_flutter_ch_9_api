import 'package:adv_flutter_ch_9/task%20-9.1%20Pixabay%20Api/modal/modal.dart';
import 'package:adv_flutter_ch_9/task%20-9.1%20Pixabay%20Api/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class pixaPage extends StatelessWidget {
  const pixaPage({super.key});

  @override
  Widget build(BuildContext context) {
    PixaApiProvider pixabayApiProviderFalse =
    Provider.of<PixaApiProvider>(context, listen: false);

    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;


    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.blue.shade50,
          title: Center(child: Text('PixaBay Api')),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                cursorColor: Colors.black,
                 onSubmitted: (value) {
                    pixabayApiProviderFalse.getImages(value);
                  },
                controller:txtSearchImages ,
                decoration: InputDecoration(
                  label: const Text(
                    'Search Images',
                    style: TextStyle(color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<PixaApiProvider>(context, listen: false)
                    .fromMap(Provider.of<PixaApiProvider>(context, listen: true).searchIma),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    PixaBayModal? ha = snapShot.data;
                    return
                   Padding(padding: EdgeInsets.all(8.0)

                   ,child:    ListView.builder(
                       itemCount: ha!.hits.length,
                       itemBuilder: (context, index) {
                         return Padding(
                             padding: const EdgeInsets.all(8.0)
                             ,
                             child
                                 :
                             Container
                               (
                               height
                                   :
                               height * 0.3,
                               width: width * 0.7,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 image: DecorationImage(
                                   image: NetworkImage(
                                       ha.hits[index].largeImageURL

                                   ),
                                   fit: BoxFit.cover,
                                 ),

                               ),
                             )
                         );
                       },

                     ),

                   );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
        // Expanded(
        //       child: FutureBuilder(
        //         future: Provider.of<PixabayProvider>(context, listen: false)
        //             .fromMap(Provider.of<PixabayProvider>(context, listen: true).searchImg),
        //         builder: (context, snapShot) {
        //           if (snapShot.hasData) {
        //             PixaBayModal? image = snapShot.data;
        //             return Padding(
        //               padding: const EdgeInsets.all(5.0),
        //               child: ListView.builder(
        //                 physics: const BouncingScrollPhysics(),
        //                 itemCount: image!.hits.length,
        //                 itemBuilder: (context, index) {
        //                   int likes = image.hits[index].likes;
        //                   bool isLiked = false;
        //                   return Container(
        //                     height: 200,
        //                     margin: const EdgeInsets.all(10),
        //                     decoration: BoxDecoration(
        //                       color: Colors.grey[200],
        //                       borderRadius: BorderRadius.circular(20),
        //                       image: DecorationImage(
        //                         image: NetworkImage(image.hits[index].largeImageURL),
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //
        //                   );
        //                 },
        //               ),
        //             );
        //           } else {
        //             return const Center(
        //               child: CircularProgressIndicator(),
        //             );
        //           }
        //         },
        //       ),
        // )

    ],
        )
    );
  }
}

// import 'dart:ffi';
// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:image_downloader/image_downloader.dart';
// import 'package:provider/provider.dart';
//
// import '../../modal/modal.dart';
// import '../../provider/provider.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     PixabayProvider pixabayProviderFalse = Provider.of<PixabayProvider>(context, listen: false);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           leading: const Icon(
//             Icons.pageview,
//             color: Colors.green,
//             size: 30,
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           scrolledUnderElevation: 0.4,
//           title: const Text('Pixabay',style: TextStyle(
//               color: Colors.green,
//               fontWeight: FontWeight.bold
//           ),),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 10,
//                   bottom: 10,
//                   left: 10,
//                   right: 10
//               ),
//               child: TextField(
//                 cursorColor: Colors.green,
//                 onSubmitted: (value) {
//                   pixabayProviderFalse.getImages(value);
//                 },
//                 controller: txtSearchImages,
//                 decoration: InputDecoration(
//
//                   label: const Text('Search Images',style: TextStyle(
//                       color: Colors.grey
//                   ),),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   prefixIcon: const Icon(
//                     Icons.search,
//                     size: 25,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: FutureBuilder(
//                 future: Provider.of<PixabayProvider>(context, listen: false)
//                     .fromMap(Provider.of<PixabayProvider>(context, listen: true).searchImg),
//                 builder: (context, snapShot) {
//                   if (snapShot.hasData) {
//                     PixaBayModal? image = snapShot.data;
//                     return Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: ListView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: image!.hits.length,
//                         itemBuilder: (context, index) {
//                           int likes = image.hits[index].likes;
//                           bool isLiked = false;
//                           return Container(
//                             height: 200,
//                             margin: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(20),
//                               image: DecorationImage(
//                                 image: NetworkImage(image.hits[index].largeImageURL),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//
//                           );
//                         },
//                       ),
//                     );
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
TextEditingController txtSearchImages = TextEditingController();
