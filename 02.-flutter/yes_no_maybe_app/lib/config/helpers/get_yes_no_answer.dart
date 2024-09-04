import 'package:dio/dio.dart';
import 'package:yes_no_maybe_app/domain/entitites/message.dart';
import 'package:yes_no_maybe_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getMessage() async{
    final response = await _dio.get('https://yesno.wtf/api');
    return YesNoModel.fromJsonMap(response.data).toMessageEntity();
/*  final yesNoModel = YesNoModel.fromJsonMap(response.data);
    return Message(
      text: yesNoModel.answer, 
      fromWho: FromWho.her,
      imageUrl: yesNoModel.image
    ); */
  }

}