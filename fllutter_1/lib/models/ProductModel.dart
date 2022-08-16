// ignore_for_file: file_names
////////// product model for category api ////////////
class ProductModel {
  int id;
  String productname;
  String category;
  int price;
  String pimage;
  String pdesc;
  ProductModel(
      {this.id,
      this.productname,
      this.category,
      this.price,
      this.pimage,
      this.pdesc});
}
