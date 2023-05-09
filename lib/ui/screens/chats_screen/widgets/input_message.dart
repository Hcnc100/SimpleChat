import 'package:chat_app/ui/screens/chats_screen/view_model/chats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputMessage extends ConsumerWidget {
  const InputMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0,8),
            child: TextField(
              maxLines: 1,
              controller: textController,
              onChanged: (value) => ref.read(chatsViewModel.notifier).onMessageChanged(value),
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(50),
               ),
               hintText: 'Type a message',
               contentPadding: const EdgeInsets.symmetric(horizontal: 20),
             ),
            ),
          ),
        ),
         IconButton(
           onPressed: () {
            if(textController.text.isNotEmpty){
              ref.read(chatsViewModel.notifier).sendMessage();
              textController.clear();
            }
           },
           icon: const Icon(Icons.send),
         ),
      ],
    );
  }
}