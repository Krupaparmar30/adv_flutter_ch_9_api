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


    ],
        )
    );
  }
}

TextEditingController txtSearchImages = TextEditingController();
