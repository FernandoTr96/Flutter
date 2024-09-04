import 'package:yes_no_maybe_app/domain/entitites/message.dart';

class YesNoModel {

  String answer;
  bool force;
  String image;

  YesNoModel({
    required this.answer,
    required this.force,
    required this.image
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json['answer'], 
    force: json['forced'], 
    image: json['image']
  ); 

  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'si' : 'No', 
    fromWho: FromWho.her,
    imageUrl: image
  );
}