
class LostItemModel{

  String? itemName;
  String? itemCategory;
  String? itemDescription;
  String ?lostDate;
  String ? LostimageUrls;






  LostItemModel({
    this.itemName,
    this.itemCategory,
    this.itemDescription,
    this.lostDate,
    this.LostimageUrls,

  });

  // receive data from server
  factory LostItemModel.fromMap(map) {

    return LostItemModel(
      itemName: map['itemName'],
      itemCategory: map['itemCategory'],
      itemDescription: map['itemDescription'],
      lostDate: map['lostDate'],
      LostimageUrls: map['LostimageUrls'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'itemCategory': itemCategory,
      'itemDescription': itemDescription,
      'lostDate': lostDate,
      'imageUrls': LostimageUrls,

    };
  }
}