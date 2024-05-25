/// title : "geek_for_geeks"
/// create_age : "3 hours ago"
/// profile : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz-vaB2Zw_wscKelgdXqdaBDHsreSeUYwnv2txUqjDsw&s"
/// post_img : "https://scontent.cdninstagram.com/v/t39.30808-6/445712558_18267484807226620_2931348728546132186_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEwODAuc2RyLmYzMDgwOCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=104&_nc_ohc=nGf0Abt4mp8Q7kNvgEAvI1P&edm=APs17CUAAAAA&ccb=7-5&ig_cache_key=MzM3MzMzNTcxMDMzNzE5NjM0Mg%3D%3D.2-ccb7-5&oh=00_AYAGQoXL1Hv36G28UvWQGc-l1XYsPdFeS686j3ZvMG0qxg&oe=66548B40&_nc_sid=10d13b"
/// likes_profile : "https://sb.kaleidousercontent.com/67418/1920x1281/0e9f02a048/christian-buehner-ditylc26zvi-unsplash.jpg"
/// description : "read the caption"
/// likeby : "arun"
/// like : false
/// comments : [{"name":"surah0023","profile":"https://sb.kaleidousercontent.com/67418/1920x1281/0e9f02a048/christian-buehner-ditylc26zvi-unsplash.jpg","comment_txt":"nice","comment_time":"7m"},{"name":"nikhil_shar","profile":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz-vaB2Zw_wscKelgdXqdaBDHsreSeUYwnv2txUqjDsw&s","comment_txt":"nice"},{"name":"isshhhhh04","profile":"https://scontent.cdninstagram.com/v/t51.2885-19/445550978_1117076182742505_1622568836499964489_n.jpg?_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=LMwx9OoA2T0Q7kNvgEJWo0W&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYDdu2eEdQGcBTsMJsMKLqdDoxMUEwHMEVsE086quvil3w&oe=6656942A&_nc_sid=10d13b","comment_txt":"trueeee 🤣🤣"},{"name":"shruti_rajpoot","profile":"https://play-lh.googleusercontent.com/jInS55DYPnTZq8GpylyLmK2L2cDmUoahVacfN_Js_TsOkBEoizKmAl5-p8iFeLiNjtE=w526-h296-rw","comment_txt":"same here"}]

class HomeScreenModel {
  HomeScreenModel({
      String? title, 
      String? createAge, 
      String? profile, 
      String? postImg, 
      String? likesProfile, 
      String? description, 
      String? likeby, 
      bool? like, 
      List<Comments>? comments,}){
    _title = title;
    _createAge = createAge;
    _profile = profile;
    _postImg = postImg;
    _likesProfile = likesProfile;
    _description = description;
    _likeby = likeby;
    _like = like;
    _comments = comments;
}

  HomeScreenModel.fromJson(dynamic json) {
    _title = json['title'];
    _createAge = json['create_age'];
    _profile = json['profile'];
    _postImg = json['post_img'];
    _likesProfile = json['likes_profile'];
    _description = json['description'];
    _likeby = json['likeby'];
    _like = json['like'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
  }
  String? _title;
  String? _createAge;
  String? _profile;
  String? _postImg;
  String? _likesProfile;
  String? _description;
  String? _likeby;
  bool? _like;
  List<Comments>? _comments;
HomeScreenModel copyWith({  String? title,
  String? createAge,
  String? profile,
  String? postImg,
  String? likesProfile,
  String? description,
  String? likeby,
  bool? like,
  List<Comments>? comments,
}) => HomeScreenModel(  title: title ?? _title,
  createAge: createAge ?? _createAge,
  profile: profile ?? _profile,
  postImg: postImg ?? _postImg,
  likesProfile: likesProfile ?? _likesProfile,
  description: description ?? _description,
  likeby: likeby ?? _likeby,
  like: like ?? _like,
  comments: comments ?? _comments,
);
  String? get title => _title;
  String? get createAge => _createAge;
  String? get profile => _profile;
  String? get postImg => _postImg;
  String? get likesProfile => _likesProfile;
  String? get description => _description;
  String? get likeby => _likeby;
  bool? get like => _like;

  set likes(bool value) {
    _like = value;
  }

  List<Comments>? get comments => _comments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['create_age'] = _createAge;
    map['profile'] = _profile;
    map['post_img'] = _postImg;
    map['likes_profile'] = _likesProfile;
    map['description'] = _description;
    map['likeby'] = _likeby;
    map['like'] = _like;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "surah0023"
/// profile : "https://sb.kaleidousercontent.com/67418/1920x1281/0e9f02a048/christian-buehner-ditylc26zvi-unsplash.jpg"
/// comment_txt : "nice"
/// comment_time : "7m"

class Comments {
  Comments({
      String? name, 
      String? profile, 
      String? commentTxt, 
      String? commentTime,}){
    _name = name;
    _profile = profile;
    _commentTxt = commentTxt;
    _commentTime = commentTime;
}

  Comments.fromJson(dynamic json) {
    _name = json['name'];
    _profile = json['profile'];
    _commentTxt = json['comment_txt'];
    _commentTime = json['comment_time'];
  }
  String? _name;
  String? _profile;
  String? _commentTxt;
  String? _commentTime;
Comments copyWith({  String? name,
  String? profile,
  String? commentTxt,
  String? commentTime,
}) => Comments(  name: name ?? _name,
  profile: profile ?? _profile,
  commentTxt: commentTxt ?? _commentTxt,
  commentTime: commentTime ?? _commentTime,
);
  String? get name => _name;
  String? get profile => _profile;
  String? get commentTxt => _commentTxt;
  String? get commentTime => _commentTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['profile'] = _profile;
    map['comment_txt'] = _commentTxt;
    map['comment_time'] = _commentTime;
    return map;
  }

}