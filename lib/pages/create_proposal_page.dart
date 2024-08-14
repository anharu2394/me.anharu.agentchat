import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_chat_demo/models/proposal.dart';
import 'package:flutter_chat_demo/providers/project.dart';
import 'package:flutter_chat_demo/providers/auth.dart';
import 'package:flutter_chat_demo/providers/proposals.dart';

class CreateProposalPage extends ConsumerStatefulWidget {
  final String projectId;

  const CreateProposalPage({Key? key, required this.projectId}) : super(key: key);

  @override
  _CreateProposalPageState createState() => _CreateProposalPageState();
}

class _CreateProposalPageState extends ConsumerState<CreateProposalPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _descriptionController;
  late TextEditingController _amountController;
  late TextEditingController _estimatedDurationController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _amountController = TextEditingController();
    _estimatedDurationController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _estimatedDurationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final projectAsyncValue = ref.watch(projectDetailProvider(widget.projectId));

    return Scaffold(
      appBar: AppBar(
        title: Text('提案を作成'),
      ),
      body: projectAsyncValue.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('エラーが発生しました: $error')),
        data: (project) {
          if (project == null) {
            return Center(child: Text('プロジェクトが見つかりません'));
          }
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('プロジェクト: ${project.title}', style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: '提案内容'),
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '提案内容を入力してください';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(labelText: '提案金額（円）'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '金額を入力してください';
                      }
                      if (int.tryParse(value) == null) {
                        return '有効な数字を入力してください';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _estimatedDurationController,
                    decoration: InputDecoration(labelText: '予想期間（日）'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '予想期間を入力してください';
                      }
                      if (int.tryParse(value) == null) {
                        return '有効な数字を入力してください';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitProposal,
                      child: Text('提案を送信'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _submitProposal() async {
    if (_formKey.currentState!.validate()) {
      final user = ref.read(authProvider).value;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ログインしてください')),
        );
        return;
      }

      final proposal = Proposal(
        id: "",
        userId: user.id,
        amount: int.parse(_amountController.text),
        currency: 'JPY',
        description: _descriptionController.text,
        estimatedDuration: int.parse(_estimatedDurationController.text),
        createdAt: DateTime.now(),
        status: 'pending',
      );

      try {
        await ref.read(proposalsProvider.notifier).addProposal(proposal, widget.projectId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('提案が送信されました')),
        );
        context.pop();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('提案の送信に失敗しました: $e')),
        );
      }
    }
  }
}
