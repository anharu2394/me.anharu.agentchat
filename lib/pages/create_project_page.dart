import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/constants/app_constants.dart';
import 'package:flutter_chat_demo/constants/color_constants.dart';
import 'package:flutter_chat_demo/forms/create_project_form.dart';
import 'package:flutter_chat_demo/models/project.dart';
import 'package:flutter_chat_demo/providers/my_projects.dart';
import 'package:flutter_chat_demo/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateProjectPage extends ConsumerStatefulWidget {
  CreateProjectPage({super.key});

  @override
  ConsumerState createState() => CreateProjectPageState();
}

class CreateProjectPageState extends ConsumerState<CreateProjectPage> {
  @override
  Widget build(BuildContext context) {
    final createProjectForm = ref.watch(createProjectFormControllerProvider);
    final projectsNotifier = ref.watch(myProjectsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.createProjectTitle,
          style: TextStyle(color: ColorConstants.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'プロジェクト名'),
                keyboardType: TextInputType.text,
                onChanged: ref
                    .read(createProjectFormControllerProvider.notifier)
                    .onChangeTitle,
              ),
              if (createProjectForm.title.displayError != null)
                Text(createProjectForm.title.displayError!.errorText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    )),
              TextField(
                decoration: const InputDecoration(labelText: 'プロジェクト概要'),
                keyboardType: TextInputType.text,
                onChanged: ref
                    .read(createProjectFormControllerProvider.notifier)
                    .onChangeDescription,
              ),
              if (createProjectForm.description.displayError != null)
                Text(createProjectForm.description.displayError!.errorText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    )),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(labelText: '最低予算'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => ref
                          .read(createProjectFormControllerProvider.notifier)
                          .onChangeMinBudget(int.tryParse(value) ?? 0),
                    ),
                  ),
                  const Text('〜'),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(labelText: '最大予算'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => ref
                          .read(createProjectFormControllerProvider.notifier)
                          .onChangeMaxBudget(int.tryParse(value) ?? 0),
                    ),
                  ),
                ],
              ),
              if (createProjectForm.minBudget.displayError != null)
                Text(createProjectForm.minBudget.displayError!.errorText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    )),
              if (createProjectForm.maxBudget.displayError != null)
                Text(createProjectForm.maxBudget.displayError!.errorText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    ref
                        .read(createProjectFormControllerProvider.notifier)
                        .onChangeDeadline(picked);
                  }
                },
                child: Text(createProjectForm.deadline.value != null
                    ? '締切日: ${createProjectForm.deadline.value!.toString().split(' ')[0]}'
                    : '締切日を選択'),
              ),
              if (createProjectForm.deadline.displayError != null)
                Text(createProjectForm.deadline.displayError!.errorText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: createProjectForm.isValid
                    ? () async {
                        await projectsNotifier.addProject(
                          Project(
                            id: null,
                            createdBy: ref.read(authProvider).value!.id,
                            title: createProjectForm.title.value,
                            description: createProjectForm.description.value,
                            deadline: createProjectForm.deadline.value!,
                            createdAt: DateTime.now(),
                            status: "open",
                            budget: Budget(
                              min: createProjectForm.minBudget.value,
                              max: createProjectForm.maxBudget.value,
                              currency: "JPY",
                            ),
                            skills: [],
                            attachments: [],
                          ),
                        );
                        context.pop();
                      }
                    : null,
                child: const Text('送信'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
