class PostModel
{
  String name;
  String image;
  String uId;
  String text;
  String postImage;
  String dateTime;

  PostModel({
    this.name,
    this.text,
    this.uId,
    this.postImage,
    this.image,
    this.dateTime,
  });

  PostModel.fromJson(Map<String , dynamic>json)
  {
    name = json['name'] ;
    text = json['text'] ;
    uId = json['uId'] ;
    postImage = json['postImage'] ;
    image = json['image'] ;
    dateTime = json['dateTime'] ;
  }

  Map<String , dynamic> tomap()
  {
    return 
    {
      'name':name,
      'postImage':postImage,
      'uId':uId,
      'dateTime':dateTime,
      'image':image,
      'text':text,
    };
  }
}