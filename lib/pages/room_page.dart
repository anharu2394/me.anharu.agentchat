import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/models/message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/room.dart';
import '../providers/auth.dart';

class RoomDetailPage extends ConsumerStatefulWidget {
  final String roomId;

  const RoomDetailPage({Key? key, required this.roomId}) : super(key: key);

  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends ConsumerState<RoomDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final roomStateAsyncValue = ref.watch(roomDetailProvider(widget.roomId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('チャットルーム'),
      ),
      body: roomStateAsyncValue.when(
        data: (roomState) => _buildChatUI(context, roomState),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('エラー: $error')),
      ),
    );
  }

  Widget _buildChatUI(BuildContext context, RoomState roomState) {
    if (roomState.room == null) {
      return const Center(child: Text('ルームが見つかりません'));
    }

    return Column(
      children: [
        _buildProjectAndProposalDetails(roomState),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            reverse: true,
            itemCount: roomState.messages.length,
            itemBuilder: (context, index) {
              final message = roomState.messages[index];
              final isCurrentUser =
                  message.senderId == ref.read(authProvider).value?.id;
              return _buildMessageBubble(message, isCurrentUser);
            },
          ),
        ),
        _buildMessageInput(),
      ],
    );
  }

  Widget _buildProjectAndProposalDetails(RoomState roomState) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (roomState.project != null) ...[
            Text(
              roomState.project!.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            _buildInfoRow('説明', roomState.project!.description),
            _buildInfoRow('納期', roomState.project!.deadline.toString()),
            _buildInfoRow('予算',
                '¥${roomState.project!.budget.min.toStringAsFixed(0)}万円 ~ ¥${roomState.project!.budget.max.toStringAsFixed(0)}万円'),
          ],
          if (roomState.proposal != null) ...[
            const SizedBox(height: 16),
            Text(
              '提案情報',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            _buildInfoRow('説明', roomState.proposal!.description),
            _buildInfoRow(
                '提案金額', '¥${roomState.proposal!.amount.toStringAsFixed(0)}'),
            _buildInfoRow(
                '予定納期', roomState.proposal!.estimatedDuration.toString()),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message, bool isCurrentUser) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isCurrentUser ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              message.senderId,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'メッセージを入力...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      final authState = ref.read(authProvider);
      authState.whenData((user) {
        if (user != null) {
          ref.read(roomDetailProvider(widget.roomId).notifier).sendMessage(
                widget.roomId,
                user.id,
                message,
                'text',
              );
          _messageController.clear();
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
