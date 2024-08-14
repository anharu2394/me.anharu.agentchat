import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/app_constants.dart';
import 'package:flutter_chat_demo/constants/color_constants.dart';
import 'package:flutter_chat_demo/constants/router.dart';
import 'package:flutter_chat_demo/models/project.dart';
import 'package:flutter_chat_demo/providers/my_projects.dart';
import 'package:flutter_chat_demo/providers/projects.dart';
import 'package:flutter_chat_demo/providers/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProjectListPage extends ConsumerWidget {
  const ProjectListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppConstants.projectPageTitle,
            style: TextStyle(color: ColorConstants.primaryColor),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: '全体のプロジェクト'),
              Tab(text: '自分のプロジェクト'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _AllProjectsTab(),
            _MyProjectsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push(Routes.createProjectPage);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class _AllProjectsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProjects = ref.watch(projectsProvider);

    return allProjects.when(
      data: (projects) => ListView(
        children: projects.map((project) => _buildProjectTile(context, ref, project)).toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('エラーが発生しました: $error $stack')),
    );
  }
}

class _MyProjectsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProjects = ref.watch(myProjectsProvider);

    return userProjects.when(
      data: (userProjects) => ListView(
        children: [
          ...userProjects.created.map((project) => _buildProjectTile(context, ref, project)),
          ...userProjects.proposed.map((project) => _buildProjectTile(context, ref, project)),
          ...userProjects.accepted.map((project) => _buildProjectTile(context, ref, project)),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('エラーが発生しました: $error $stack')),
    );
  }
}

Widget _buildProjectTile(BuildContext context, WidgetRef ref, Project project) {
  final userAsyncValue = ref.watch(userProvider(project.createdBy));
  
  return ListTile(
    title: Text(project.title),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('予算: ${project.budget.min}万円 〜 ${project.budget.max}万円'),
        userAsyncValue.when(
          data: (user) => Text('作成者: ${user?.nickname ?? "不明"}'),
          loading: () => Text('作成者: 読み込み中...'),
          error: (_, __) => Text('作成者: エラー'),
        ),
      ],
    ),
    onTap: () {
      print('プロジェクトをクリックしました: ${project}');
      context.push('${Routes.projectPage}/${project.id}');
    },
  );
}
