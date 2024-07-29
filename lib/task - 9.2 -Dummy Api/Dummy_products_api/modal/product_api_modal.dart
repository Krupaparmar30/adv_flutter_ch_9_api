// class ProductModal {
//   late List<Products> products;
//
//
//   ProductModal(
//       {required this.products,
//     });
//
//   factory ProductModal.fromJson(Map m1) {
//     return ProductModal(
//         products:
//             (m1['products'] as List).map((e) => Products.fromJson(e)).toList(),
//
//     );
//   }
// }
//
// class Products {
//   late int id, stock, weight;
//   late String title,
//       description,
//       category,
//       brand,
//       sku,
//       warrantyInformation,
//       shippingInformation,
//       availabilityStatus,
//       returnPolicy,
//       thumbnail;
//   late List tags;
//   late List images;
//
//   Products(
//       {required this.id,
//       required this.stock,
//       required this.weight,
//       required this.title,
//       required this.description,
//       required this.category,
//       required this.brand,
//       required this.sku,
//       required this.warrantyInformation,
//       required this.shippingInformation,
//       required this.availabilityStatus,
//       required this.returnPolicy,
//       required this.thumbnail,
//       required this.tags,
//       required this.images});
//
//   factory Products.fromJson(Map m1) {
//     return Products(
//         id: m1['id'],
//         stock: m1['stock'],
//         weight: m1['weight'],
//         title: m1['title'],
//         description: m1['description'],
//         category: m1['category'],
//         brand: m1['brand'],
//         sku: m1['sku'],
//         warrantyInformation: m1['warrantyInformation'],
//         shippingInformation: m1['shippingInformation'],
//         availabilityStatus: m1['availabilityStatus'],
//         returnPolicy: m1['returnPolicy'],
//         thumbnail: m1['thumbnail'],
//         tags: m1['tags'],
//         images: m1['images']);
//   }
// }


class ProductModal {
  late List<Products> products;

  ProductModal({required this.products});

  factory ProductModal.fromJson(Map m1) {
    return ProductModal(
      products: (m1['products'] as List)
          .map(
            (e) => Products.fromJson(e),
      )
          .toList(),
    );
  }
}

class Products {
  late String title, description, category, thumbnail;
  late double price, discountPercentage, rating;
  late List<ReviewModal> reviews;
  late List images;

  Products({
    required this.title,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.reviews,
    required this.images,
  });

  factory Products.fromJson(Map m1) {
    return Products(
        title: m1['title'],
        description: m1['description'],
        category: m1['category'],
        thumbnail: m1['thumbnail'],
        price: m1['price'].toDouble(),
        discountPercentage: m1['discountPercentage'].toDouble(),
        rating: m1['rating'].toDouble(),
        reviews: (m1['reviews'] as List)
            .map(
              (e) => ReviewModal.fromJson(e),
        )
            .toList(),
        images: m1['images']);
  }
}

class ReviewModal {
  late String comment, date, reviewerName, reviewerEmail;
  late int rating;

  ReviewModal({
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.rating,
  });

  factory ReviewModal.fromJson(Map m1) {
    return ReviewModal(
      comment: m1['comment'],
      date: m1['date'],
      reviewerName: m1['reviewerName'],
      reviewerEmail: m1['reviewerEmail'],
      rating: m1['rating'],
    );
  }
}
