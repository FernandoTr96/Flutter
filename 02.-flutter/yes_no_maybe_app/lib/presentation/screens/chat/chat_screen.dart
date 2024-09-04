import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return index % 2 == 0 ? const MyMessageBubble() : const HerMessageBubble();
                }
              )
            ),
            const SizedBox(height: 15),
            const MessageFieldBox(),
            const SizedBox(height: 6),
          ],
        )
      )
    );
  }
}
