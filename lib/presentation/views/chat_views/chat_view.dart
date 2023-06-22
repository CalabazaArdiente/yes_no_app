import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/provider.dart';
import 'package:yes_no_app/presentation/widgets/widgets.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Señor misterio'),
        centerTitle: false,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://www.elinformador.com.co/images/stories/general/2020/02-febrero/24nota_1_copia.jpg'),
        ),
        leadingWidth: 100,
      ),
      body: _Chat(),
    );
  }
}

class _Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.mine
                    ? MineMessageBubbleWidget(
                        message: message,
                      )
                    : TheirMessageBubbleWidget(
                        message: message,
                      ));
              },
            )),
            SendBoxWidget(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
