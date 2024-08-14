import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/components/app_navigation_bar.dart';
import 'package:flutter_chat_demo/models/project.dart';
import 'package:flutter_chat_demo/pages/create_project_page.dart';
import 'package:flutter_chat_demo/pages/create_proposal_page.dart';
import 'package:flutter_chat_demo/pages/pages.dart';
import 'package:flutter_chat_demo/pages/project_list_page.dart';
import 'package:flutter_chat_demo/pages/project_page.dart';
import 'package:flutter_chat_demo/pages/proposal_list_page.dart';
import 'package:flutter_chat_demo/pages/proposal_page.dart';
import 'package:flutter_chat_demo/pages/room_list_page.dart';
import 'package:flutter_chat_demo/pages/room_page.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const splashPage = '/splash';
  static const home = '/';
  static const chatPage = '/chat';
  static const fullPhotoPage = '/full-photo';
  static const loginPage = '/login';
  static const settingsPage = '/settings';
  static const projectPage = '/projects';
  static const createProjectPage = '/projects/new';
  static const proposalPage = '/proposals';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final proposalNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'proposal');
final projectNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'project');

// GoRouter configuration
final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: Routes.splashPage,
      builder: (context, state) => SplashPage(),
    ),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppNavigationBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => RoomListPage(),
                routes: [
                    GoRoute(
                        path: "chat",
                        builder: (context, state) {
                          final arguments = state.extra as ChatPageArguments;
                          return ChatPage(arguments: arguments);
                        }),
                    GoRoute(
                      path: "rooms/:roomId",
                      builder: (context, state) {
                        final roomId = state.pathParameters['roomId'];
                        return RoomDetailPage(roomId: roomId!);
                      },
                    ),
                ]
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: proposalNavigatorKey,
            routes: [
              GoRoute(
                  path: Routes.proposalPage,
                  builder: (context, state) => ProposalListPage(),
                  routes: [
                    GoRoute(
                      path: ":proposalId",
                      builder: (context, state) {
                        final proposalId = state.pathParameters['proposalId'];
                        return ProposalPage(proposalId: proposalId!);
                      },
                    ),
                  ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: projectNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.projectPage,
                builder: (context, state) => ProjectListPage(),
                routes: [
                     GoRoute(
                      path: "new",
                      builder: (context, state) => CreateProjectPage(),
                    ),
                  GoRoute(
                    path: ":projectId",
                    builder: (context, state) {
                      final projectId = state.pathParameters['projectId'];
                      return ProjectPage(projectId: projectId!);
                    },
                    routes: [
                      GoRoute(
                        path: "proposals/new",
                        builder: (context, state) {
                          final projectId = state.pathParameters['projectId'];
                          return CreateProposalPage(projectId: projectId!);
                        },
                      ),
                    ],
                  ),
                ]
              ),
            ],
          ),
        ]),
    GoRoute(
      path: Routes.fullPhotoPage,
      builder: (context, state) {
        final url = state.extra as String;
        return FullPhotoPage(url:url);
      },
    ),
    GoRoute(
      path: Routes.loginPage,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routes.settingsPage,
      builder: (context, state) => SettingsPage(),
    ),
  ],
);
