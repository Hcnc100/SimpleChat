

import 'package:chat_app/domain/messages/message_repository.dart';
import 'package:chat_app/models/message_data.dart';
import 'package:chat_app/ui/screens/chats_screen/view_model/chats_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injector/injector.dart';

part 'chats_state.freezed.dart';

@freezed
class ChatsState with _$ChatsState{
        factory ChatsState({
        @Default("") String message,
        Stream<List<MessageData>>? streamMessages,
        }) = _ChatsState;
}

final chatsViewModel = StateNotifierProvider<ChatsViewModel, ChatsState>(
  (ref) => ChatsViewModel(
    messageRepository:  Injector.appInstance.get<MessageRepository>(),
    ChatsState(),
  ),
);