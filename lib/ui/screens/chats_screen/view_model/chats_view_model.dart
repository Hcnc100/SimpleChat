import 'package:chat_app/models/message_data.dart';
import 'package:chat_app/ui/screens/chats_screen/view_model/chats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsViewModel extends StateNotifier<ChatsState> {
  ChatsViewModel(super.state);

  final ScrollController scrollController = ScrollController();

  ScrollController get getScrollController => scrollController;

  void onMessageScroll() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void onMessageChanged(String message) {
    state = state.copyWith(message: message);
  }

  Future<void> sendMessage() async {
    state = state.copyWith(messages: [
      ...state.messages,
      MessageData.fromOnlyMessage(state.message)
    ]);
    state = state.copyWith(message: "");

    await Future.delayed(const Duration(milliseconds: 500), () {});
    onMessageScroll();
  }
}
