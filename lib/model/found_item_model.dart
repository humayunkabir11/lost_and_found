class FoundItemModel {
  String? founditemName;
  String? foundItemCategory;
  String? foundItemDescription;
  String? foundImageUrls;
  String? foundDate;

  FoundItemModel(
      {this.founditemName,
      this.foundItemCategory,
      this.foundItemDescription,
      this.foundImageUrls,
      this.foundDate});

  // receive data from server
  factory FoundItemModel.fromMap(map) {
    return FoundItemModel(
      founditemName: map['founditemName'],
      foundItemCategory: map['foundItemCategory'],
      foundItemDescription: map['foundItemDescription'],
      foundImageUrls: map['foundImageUrls'],
      foundDate: map['foundDate'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'founditemName': founditemName,
      'foundItemCategory': foundItemCategory,
      'foundItemDescription': foundItemDescription,
      'foundImageUrls': foundImageUrls,
      'foundDate': foundDate,
    };
  }
}
