class UserModel{

  String? uid;
  String? name;
  String? phoneNumber;
  String? email;
  String? address;
  String? imageSrc;

  UserModel({this.uid, this.name, this.phoneNumber, this.email, this.address, this.imageSrc});

  // receive data from server
  factory UserModel.fromMap(map)
  {
    return UserModel(

        uid: map['uid'],
        name: map['name'],
        phoneNumber: map['phoneNumber'],
        email: map['email'],
      address: map['address'],
        imageSrc: map['imageSrc'],

    );
  }

  // sending data to server
  Map<String, dynamic> toMap()
  {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'address' : address,
      'imageSrc': imageSrc,
    };
  }
}