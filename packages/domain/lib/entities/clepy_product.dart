class ClepyProduct {
  String? uid;
  String? uidCategory;
  String? uidUser;
  String name;
  String? urlPicture;
  String? description;
  String? modelo;
  String? address;
  double? rating;
  double price;
  int? rents;


  ClepyProduct({
    this.uid,
    required this.name,
    this.urlPicture,
    this.description,
    this.modelo,
    this.address,
    required this.price,
    this.rating,
    this.uidCategory,
    this.uidUser,
    this.rents,
  });

  factory ClepyProduct.fromMap(Map<String, dynamic> data) {
    return ClepyProduct(
      uid: data['uid'],
      name: data['name'],
      urlPicture: data['urlPicture'],
      description: data['description'],
      modelo: data['modelo'],
      address: data['address'],
      price: double.parse(data['price'].toString()),
      rating:
          data['rating'] != null ? double.parse(data['rating'].toString()) : 0,
      rents: data['rents'],
      uidCategory: data['uidCategory'],
      uidUser: data['uidUser']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'urlPicture': urlPicture,
      'description': description,
      'modelo': modelo,
      'address': address,
      'price': price,
      'rating': rating,
      'rents': rents,
      'uidCategory': uidCategory,
      'uidUser': uidUser
    };
  }
}
