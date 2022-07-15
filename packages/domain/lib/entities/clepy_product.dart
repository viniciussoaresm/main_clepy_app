class ClepyProduct {
  String? uid;
  String? uidCategory;
  String name;
  String? urlPicture;
  String? description;
  String? address;
  double? rating;
  double price;
  int? rents;

  ClepyProduct({
    this.uid,
    required this.name,
    this.urlPicture,
    this.description,
    this.address,
    required this.price,
    this.rating,
    this.uidCategory,
    this.rents,
  });

  factory ClepyProduct.fromMap(Map<String, dynamic> data) {
    return ClepyProduct(
      uid: data['uid'],
      name: data['name'],
      urlPicture: data['urlPicture'],
      description: data['description'],
      address: data['address'],
      price: double.parse(data['price'].toString()),
      rating: double.parse(data['rating'].toString()),
      rents: data['rents'],
      uidCategory: data['uidCategory'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'urlPicture': urlPicture,
      'description': description,
      'address': address,
      'price': price,
      'rating': rating,
      'rents': rents,
      'uidCategory': uidCategory,
    };
  }
}
