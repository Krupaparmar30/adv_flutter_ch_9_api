// class PixaModal {
//   List<Hit> hits = [];
//
//   PixaModal({required this.hits});
//
//   factory PixaModal.fromJson(Map m1) {
//     return PixaModal(
//         hits: (m1['hits'] as List).map((e) => Hit.fromJson(e)).toList());
//   }
// }
//
// class Hit {
//   late String user, largeImageURL;
//   late int id, likes, comments, views;
//
//
//   Hit(
//       {required this.id,
//       required this.likes,
//       required this.comments,
//       required this.views,
//       required this.user,
//       required this.largeImageURL});
//
//   factory Hit.fromJson(Map m1) {
//     return Hit(
//         id: m1['id'],
//         likes: m1['likes'],
//         comments: m1['comments'],
//         views: m1['views'],
//         user: m1['user'],
//         largeImageURL: m1['largeImageURL']);
//   }
// }

class PixaBayModal{
  List<Hit> hits = [];

  PixaBayModal({required this.hits});

  factory PixaBayModal.fromjson(Map m1)
  {
    return PixaBayModal(hits: (m1['hits'] as List).map((e)=>Hit.fromjson(e)).toList());
  }
}

class Hit
{
  late String tags,largeImageURL;
  late int views,downloads,likes;

  Hit({required this.tags,required this.largeImageURL,required this.views,required this.downloads,required this.likes});

  factory Hit.fromjson(Map m1)
  {
    return Hit(tags: m1['tags'], largeImageURL: m1['largeImageURL'], views: m1['views'], downloads: m1['downloads'], likes: m1['likes']) ;
  }
}
