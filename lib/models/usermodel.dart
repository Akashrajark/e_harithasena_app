class UserModel {
  String? userid;
  String? name;
  String? district;
  String? morp;//muncipality/panchayth
  String? wardno;
  int? houseno;
  bool? iscomp=false;
 

  UserModel(
      {required this.userid,
      required this.name,
      required this.district,
      required this.morp,
      required this.wardno,
      required this.houseno,
      required this.iscomp
  }
    );

 factory UserModel.fromMap(Map<String, dynamic> map) {
   return UserModel(
      userid: map['userid'],
      name: map['name'],
      district: map['district'],
      morp: map['morp'],
      wardno: map['wardno'],
      houseno: map['houseno'],
      iscomp:map['iscomp'],
   );
  }

  Map<String, dynamic> toMap() {
    return {
      'userid': userid,
      'name': name,
      'district': district,
      'morp': morp,
      'wardno': wardno,
      'houseno': houseno,
      'iscomp':iscomp
    };
  }
}
