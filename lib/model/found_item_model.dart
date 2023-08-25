
class FoundItemModel{
  String? itemName;
  String? itemCategory;
  String? itemDescription;
  List<String>? imageUrls;
  String ?lostDate;

  FoundItemModel
({
    this.itemName,
    this.itemCategory,
    this.itemDescription,
    this.imageUrls,
    this.lostDate
  });

  // receive data from server
  factory FoundItemModel.fromMap(map) {
    return FoundItemModel
(
      itemName: map['itemName'],
      itemCategory: map['itemCategory'],
      itemDescription: map['itemDescription'],
      imageUrls: map['imageUrls'],
      lostDate: map['lostDate'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'itemCategory': itemCategory,
      'itemDescription': itemDescription,
      'imageUrls': imageUrls,
      'lostDate': imageUrls,
    };
  }
}