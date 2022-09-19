class CategeoryModel {
  final String pathImage;
  final String nameType;
  final Function() onTap;

  CategeoryModel(this.pathImage, this.nameType, this.onTap);
}

class CategeoryItemsModel {
  final String pathImage;
  final String nameProduct;
  final String price;
  final Function() onTap;

  CategeoryItemsModel(this.pathImage, this.onTap, this.nameProduct, this.price);
}
