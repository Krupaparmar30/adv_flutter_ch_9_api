class PixaModal {
  List<Hit> hits = [];

  PixaModal({required this.hits});

  factory PixaModal.fromJson(Map m1) {
    return PixaModal(
        hits: (m1['hits'] as List).map((e) => Hit.fromJson(e)).toList());
  }
}

class Hit {
  late int id, likes, comments, views;
  late String user, userImageURL;

  Hit(
      {required this.id,
      required this.likes,
      required this.comments,
      required this.views,
      required this.user,
      required this.userImageURL});

  factory Hit.fromJson(Map m1) {
    return Hit(
        id: m1['id'],
        likes: m1['likes'],
        comments: m1['comments'],
        views: m1['views'],
        user: m1['user'],
        userImageURL: m1['userImageURL']);
  }
}
