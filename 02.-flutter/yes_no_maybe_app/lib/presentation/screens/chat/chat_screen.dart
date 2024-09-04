import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_app/domain/entitites/message.dart';
import 'package:yes_no_maybe_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/shared/message_field_box.dart';

// pantalla del chat

class ChatScreen extends StatelessWidget {
  
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _ChatAppBar(),
      body: _ChatView(),
    );
  }
}

class _ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  const _ChatAppBar();

  @override
  Widget build(BuildContext context) {

    // traer mi tema del contexto
    final theme = Theme.of(context).colorScheme;

    return AppBar(
      title: const Text('mon cœur <3'),
      backgroundColor: theme.primary,
      leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
          backgroundImage: NetworkImage('https://i.pinimg.com/originals/a2/fa/bc/a2fabcd805d1b16e7d7d96c87a29fae3.jpg')
        )
      )
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// vista del chat

class _ChatView extends StatelessWidget {
  
  const _ChatView();

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return message.fromWho == FromWho.me ? MyMessageBubble(message: message) : HerMessageBubble(message: message);
                }
              )
            ),
            const SizedBox(height: 15),
            MessageFieldBox(onSend: chatProvider.sendMessage),
            const SizedBox(height: 6),
          ],
        )
      )
    );
  }
}
