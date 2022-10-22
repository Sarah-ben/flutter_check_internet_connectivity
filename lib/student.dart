class Student {
  int? _id;
  String? _name;
  double? _score;
 // String? _photo;

  Student(this._id,this._name,this._score);

  set id(int id)=>_id=id;
  set name(String name)=>_name=name;
  set score(double score)=>_score=score;
 // set photo(String photo)=>_photo=photo;

  int get id=>_id!;
  String get name=>_name!;
  double get score=>_score!;
 // String get photo=>_photo!;
}