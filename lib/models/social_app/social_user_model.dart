class SocialUserModel
{
  String name;
  String email;
  String uId;
  String phone;
  String image;
  String cover;
  String bio;
  bool isEmailVerified;

  SocialUserModel({
    this.name,
    this.email,
    this.uId,
    this.phone,
    this.image,
    this.cover,
    this.bio,
    this.isEmailVerified
  });

  SocialUserModel.fromJson(Map<String , dynamic>json)
  {
    name = json['name'] ;
    email = json['email'] ;
    uId = json['uId'] ;
    phone = json['phone'] ;
    image = json['image'] ;
    bio = json['bio'] ;
    cover = json['cover'] ;
    isEmailVerified = json['isEmailVerified'] ;
  }

  Map<String , dynamic> tomap()
  {
    return 
    {
      'name':name,
      'email':email,
      'uId':uId,
      'phone':phone,
      'image':image,
      'bio':bio,
      'cover':cover,
      'isEmailVerified':isEmailVerified,
    };
  }
}