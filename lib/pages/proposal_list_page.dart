import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/app_constants.dart';
import 'package:flutter_chat_demo/constants/color_constants.dart';
import 'package:flutter_chat_demo/constants/router.dart';
import 'package:flutter_chat_demo/models/proposal.dart';
import 'package:flutter_chat_demo/providers/proposals.dart';
import 'package:flutter_chat_demo/providers/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProposalListPage extends ConsumerWidget {
  const ProposalListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.proposalListTitle,
          style: TextStyle(color: ColorConstants.primaryColor),
        ),
        centerTitle: true,
      ),
      body: _ProposalList(),
    );
  }
}

class _ProposalList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proposalsAsyncValue = ref.watch(proposalsProvider);

    return proposalsAsyncValue.when(
      data: (proposals) => ListView(
        children: proposals
            .map((proposal) => _buildProposalTile(context, ref, proposal))
            .toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('エラーが発生しました: $error $stack')),
    );
  }
}

Widget _buildProposalTile(BuildContext context, WidgetRef ref, Proposal proposal) {
  final userAsyncValue = ref.watch(userProvider(proposal.userId));

  return ListTile(
    title: Text('提案金額: ${proposal.amount}${proposal.currency}'),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('説明: ${proposal.description}'),
        Text('予想期間: ${proposal.estimatedDuration}日'),
        Text('ステータス: ${proposal.status}'),
        userAsyncValue.when(
          data: (user) => Text('提案者: ${user?.nickname ?? "不明"}'),
          loading: () => Text('提案者: 読み込み中...'),
          error: (_, __) => Text('提案者: エラー'),
        ),
      ],
    ),
    onTap: () {
      context.push('${Routes.proposalPage}/${proposal.id}');
    },
  );
}
