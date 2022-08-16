// ignore_for_file: file_names use, file_names

/////////// model for cart api  //////////
class Cart {
  int id;
  String name;
  int price;
  int quantity;
  String category;
  int user;
  String image;
  String state;
  Cart(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.quantity,
      this.user,
      this.image,
      this.state});
  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        name = res['name'],
        category = res['category'],
        price = res['price'],
        quantity = res['quantity'],
        user = res['user'],
        image = res['image'],
        state = res['state'];
  Map<String, Object> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'quantity': quantity,
      'user': user,
      'image': image
    };
  }
}

class CartModel {
  int id;
  String name;
  int price;
  int quantity;
  String category;
  int user;
  // String image;
  // String desc;
  CartModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.quantity,
    this.user,

    // this.image,
    // this.desc
  });
}
