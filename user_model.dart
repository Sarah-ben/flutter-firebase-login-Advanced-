class UserModel{
  late String name;
  late String phone;
  late String email;
  late String uid;
  late String profilePic;
  late String profileCover;
  late String bio;
  late bool isEmailVerified;
  UserModel({required this.name, required this.phone, required this.email, required this.uid,required this.isEmailVerified,required this.profilePic,required this.bio,required this.profileCover});

  UserModel.fromJson(Map<String,dynamic>?json){
    name=json!['name'];
    phone=json['phone'];
    email=json['email'];
    uid=json['uid'];
    isEmailVerified=json['isEmailVerified'];
    bio=json['bio'];
    profilePic=json['profilePic'];
    profileCover=json['profileCover'];
  }

  Map<String,dynamic>toMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'uid':uid,
      'isEmailVerified':isEmailVerified,
      'bio':bio,
      'profilePic':profilePic,
      'profileCover':profileCover,
    };
  }
}