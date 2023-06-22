import 'package:flutter/material.dart';
import 'package:yes_no_app/config/tools/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer yesNoMessage = GetYesNoAnswer();
  List<Message> messageList = [Message(text: 'Hola!', fromWho: FromWho.their)];

  Future<void> sendMessage(String text) async {
    final message = Message(text: text, fromWho: FromWho.mine);
    if (message.text.isNotEmpty) messageList.add(message);
    if (text.endsWith('?')) theirReply();
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> theirReply() async {
    final theirMessage = await yesNoMessage.getAnswer();
    messageList.add(theirMessage);
    notifyListeners();
    moveScrollBottom();
  }

  Future<void> moveScrollBottom() async {
    await Future.delayed(const Duration(milliseconds: 200));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}
