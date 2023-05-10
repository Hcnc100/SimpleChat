import 'package:chat_app/domain/messages/message_repository.dart';
import 'package:chat_app/ui/screens/chats_screen/view_model/chats_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsViewModel extends StateNotifier<ChatsState> {
  final MessageRepository _messageRepository;

  ChatsViewModel(state, {required MessageRepository messageRepository})
      : _messageRepository = messageRepository,
        super(state) {
    _getStreamMessages();
  }

  _getStreamMessages() async {
    final stream = await _messageRepository.getMessages();
    state = state.copyWith(streamMessages: stream);
  }

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
    await _messageRepository.addNewMessage(state.message);
    state = state.copyWith(message: "");
  }
}
