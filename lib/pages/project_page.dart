import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_demo/providers/project.dart';
import 'package:go_router/go_router.dart';

class ProjectPage extends ConsumerWidget {
  final String projectId;

  const ProjectPage({Key? key, required this.projectId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectDetailAsyncValue = ref.watch(projectDetailProvider(projectId));
    return Scaffold(
      appBar: AppBar(
        title: Text('プロジェクト詳細'),
      ),
      body: projectDetailAsyncValue.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('エラーが発生しました: $error')),
        data: (project) {
          if (project == null) {
            return Center(child: Text('プロジェクトが見つかりません'));
          }
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('タイトル: ${project.title}', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 8),
                Text('説明: ${project.description}'),
                SizedBox(height: 8),
                Text('予算: ${project.budget.min}万円 〜 ${project.budget.max}万円'),
                SizedBox(height: 8),
                Text('期限: ${project.deadline.toLocal()}'),
                SizedBox(height: 8),
                Text('ステータス: ${project.status}'),
                SizedBox(height: 8),
                Text('作成日: ${project.createdAt.toLocal()}'),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('${Routes.projectPage}/$projectId/proposals/new');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                    child: Text('提案する', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
