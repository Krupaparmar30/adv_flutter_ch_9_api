
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
    PixaApiProvider pixabayApiProviderTrue =
    Provider.of<PixaApiProvider>(context, listen: true);
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: Text('PixaBay Api'),
      ),body: FutureBuilder(future: Provider.of<PixaApiProvider>(context,listen: false).fromMap(), builder: (context, snapshot) {
      PixaModal? ha=snapshot.data;
       if(snapshot.hasData)
         {
           return ListView.builder(itemBuilder: (context, index) => Container(
             height: height*0.3,
             width: width*1,
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10)
                 ,
                 image: DecorationImage(
                     image: NetworkImage(

ha!.hits[index].userImageURL
                     )
                 )
             ),




           ),);
         }
       else

         {
           return Center(
             child: CircularProgressIndicator(),
           );
         }

      },),
    );
  }
}
