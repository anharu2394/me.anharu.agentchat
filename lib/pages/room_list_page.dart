import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/router.dart';
import 'package:flutter_chat_demo/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/rooms.dart';
import '../models/room.dart';
import '../constants/color_constants.dart';

class RoomListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomsAsyncValue = ref.watch(roomsProvider);
    final authProviderNotifier = ref.watch(authProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ルーム一覧',
          style: TextStyle(color: ColorConstants.primaryColor),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                authProviderNotifier.handleSignOut();
                context.pushReplacement(Routes.loginPage);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('ログアウト'),
              ),
            ],
          ),
        ],
      ),
      body: roomsAsyncValue.when(
        data: (roomStates) {
          if (roomStates.isEmpty) {
            return Center(child: Text('参加しているルームはありません'));
          }
          return ListView.builder(
            itemCount: roomStates.length,
            itemBuilder: (context, index) {
              RoomState roomState = roomStates[index];
              Room room = roomState.room;
              return ListTile(
                title: Text(roomState.project.title),
                subtitle: Text('参加者: ${room.participants.length}人'),
                onTap: () {
                  // ルームの詳細ページへ遷移する処理をここに追加
                  context.push('/rooms/${room.id}');
                },
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('エラーが発生しました: $error')),
      ),
    );
  }
}
