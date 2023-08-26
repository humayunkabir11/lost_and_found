
class LostItemModel{

  String? lostItemName;
  String? lostItemCategory;
  String? lostIemDescription;
  String ?lostDate;
  String ? LostimageUrls;

  LostItemModel({
    this.lostItemName,
    this.lostItemCategory,
    this.lostIemDescription,
    this.lostDate,
    this.LostimageUrls,

  });

  // receive data from server
  factory LostItemModel.fromMap(map) {

    return LostItemModel(
      lostItemName: map['lostItemName'],
      lostItemCategory: map['lostItemCategory'],
      lostIemDescription: map['lostIemDescription'],
      lostDate: map['lostDate'],
      LostimageUrls: map['LostimageUrls'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'lostItemName': lostItemName,
      'lostItemCategory': lostItemCategory,
      'lostIemDescription': lostIemDescription,
      'lostDate': lostDate,
      'LostimageUrls': LostimageUrls,

    };
  }
}