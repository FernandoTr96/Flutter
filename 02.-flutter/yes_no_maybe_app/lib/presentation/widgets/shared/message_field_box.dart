import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  
  final ValueChanged<String> onSend;

  const MessageFieldBox({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    
    // control del formulario para gestionar su estado y valor
    final messageController = TextEditingController();
    final focusNode = FocusNode();
    final theme = Theme.of(context).colorScheme;

    Column inputActions = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            final String message = messageController.value.text;
            onSend(message);
          },
          icon: const Icon(Icons.send_outlined),
          color: theme.onSecondary,
        )
      ]
    );

    InputDecoration inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.only(right: 50, left: 10),
      filled: true,
      fillColor: theme.secondary,
      hintText: 'Message',
      hintStyle: TextStyle(color: theme.onSecondary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: theme.secondary),
        borderRadius: BorderRadius.circular(40)
      )
    );
    
    return Stack(
      children: [
        TextFormField(
          controller: messageController,
          focusNode: focusNode,
          //si mi input no tuviera multilinea y puduiera enviar con el teclado se manejaria en el submit
          /* onFieldSubmitted: (value) {
            print(value);
            messageController.clear();
            focusNode.requestFocus();
          }, */
         /*  onTapOutside: (event) => focusNode.unfocus(), */
          maxLines: null,
          style: TextStyle(color: theme.onSecondary),
          decoration: inputDecoration
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: inputActions
        )
      ]
    );
  }
}
