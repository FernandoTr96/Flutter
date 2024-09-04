import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_maybe_app/domain/entitites/message.dart';

class ChatProvider extends ChangeNotifier {

  final GetYesNoAnswer yesNoAnswer = GetYesNoAnswer(); 
  final ScrollController chatScrollController = ScrollController();

  List<Message> messages = [
    Message(text: 'Holaaaaa !', fromWho: FromWho.me)
  ];

  Future<void> herReply() async {
    final herMessage = await yesNoAnswer.getMessage();
    messages.add(herMessage);
    notifyListeners();
    scrollToBottom();
  }

  Future<void> sendMessage(String text) async {
    if(text.isEmpty) return;
    final Message message =  Message(text: text, fromWho: FromWho.me);
    messages.add(message);
    if(text.endsWith('?')){ herReply(); }
    notifyListeners();
    scrollToBottom();
  } 

  void scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }

}