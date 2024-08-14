import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/proposal.dart';
import '../constants/router.dart';
import 'package:go_router/go_router.dart';

class ProposalPage extends ConsumerWidget {
  final String proposalId;

  const ProposalPage({Key? key, required this.proposalId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proposalAsyncValue = ref.watch(proposalDetailProvider(proposalId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('提案詳細'),
      ),
      body: proposalAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('提案の読み込みに失敗しました'),
              const SizedBox(height: 16),
              Text('エラー: $error'),
              const SizedBox(height: 8),
              Text('スタックトレース: $stackTrace'),
            ],
          ),
        ),
        data: (proposalState) {
          if (proposalState.proposal == null) {
            return const Center(child: Text('提案が見つかりません'));
          }

          final proposal = proposalState.proposal!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '金額: ${proposal.amount} ${proposal.currency}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(proposal.description),
                const SizedBox(height: 24),
                Text('予想期間: ${proposal.estimatedDuration} 日'),
                const SizedBox(height: 8),
                Text('作成日: ${proposal.createdAt.toString()}'),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (proposal.status != 'approved')
                      ElevatedButton(
                        onPressed: () => _approveProposal(context, ref),
                        child: const Text('承認する'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      ),
                    if (proposal.status == 'approved' && proposalState.roomId != null)
                      ElevatedButton(
                        onPressed: () => context.push('/rooms/${proposalState.roomId}'),
                        child: const Text('チャットルームへ'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _approveProposal(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(proposalDetailProvider(proposalId).notifier).approveProposal(proposalId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('提案が承認されました')),
      );
    } catch (e, stack) {
      print(e);
      print(stack);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('提案の承認に失敗しました: $e')),
      );
    }
  }
}
