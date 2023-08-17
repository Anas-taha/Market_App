class Items {
  String pName;
  int pPrice;
  String pImage;
  String pDescription;
  String? pCategory;
  String? pID;
  int? pQuantity = 1;

  Items(
      {this.pID,
      this.pQuantity = 1,
      required this.pName,
      this.pCategory,
      required this.pDescription,
      required this.pImage,
      required this.pPrice});
}
