/*
 *     Copyright (C) 2024 Valeri Gokadze
 *
 *     shrayesh_patro is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 *
 *     shrayesh_patro is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 *
 *     For more information about shrayesh_patro, including how to contribute,
 *     please visit: https://github.com/bhupendra/shrayesh_patro
 */

import 'package:shrayesh_patro/API/version.dart';
import 'package:shrayesh_patro/Update/about_screen.dart';
import 'package:shrayesh_patro/News/bookmark/bookmark_cubit.dart';
import 'package:shrayesh_patro/News/bookmark/bookmark_screen.dart';
import 'package:shrayesh_patro/News/home_screen.dart';
import 'package:shrayesh_patro/News/models_news/news_model.dart';
import 'package:shrayesh_patro/News/news_details_screen.dart';
import 'package:shrayesh_patro/patro/home/calendar.dart';
import 'package:shrayesh_patro/screens/bottom_navigation_page.dart';
import 'package:shrayesh_patro/screens/playlists_page.dart';
import 'package:shrayesh_patro/screens/settings_page.dart';
import 'package:shrayesh_patro/screens/user_liked_playlists_page.dart';
import 'package:shrayesh_patro/screens/user_songs_page.dart';
import 'package:shrayesh_patro/services/settings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../Extra/homesearch.dart';
import '../screens/home_page.dart';


class NavigationManager {
  factory NavigationManager() {
    return _instance;
  }

  NavigationManager._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: !offlineMode.value ? _onlineRoutes() : _offlineRoutes(),
        pageBuilder: (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
            ) {
          return getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: homePath,
      routes: routes,
    );
  }
  static final NavigationManager _instance = NavigationManager._internal();
  static const newsDetailsScreenRoute = '/newsDetailsScreen';
  static NavigationManager get instance => _instance;
  static const initialRoute = '/';
  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> searchTabNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> userPlaylistsTabNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> settingsTabNavigatorKey =
  GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static const String homePath = '/home';
  static const String settingsPath = '/settings';
  static const String searchPath = '/search';
  static const String userPlaylistsPath = '/userPlaylists';

  List<StatefulShellBranch> _onlineRoutes() {
    return [
      StatefulShellBranch(
        navigatorKey: homeTabNavigatorKey,
        routes: [
          GoRoute(
            path: homePath,
            pageBuilder: (context, GoRouterState state) {
              return getPage(
                child: const Patro(),
                state: state,
              );
            },
            routes: [
              GoRoute(
                path: 'userSongs/:page',
                builder: (context, state) => UserSongsPage(
                  page: state.pathParameters['page'] ?? 'liked',
                ),
              ),
              GoRoute(
                path: 'playlists',
                builder: (context, state) => const PlaylistsPage(),
              ),
              GoRoute(
                path: 'userLikedPlaylists',
                builder: (context, state) => const UserLikedPlaylistsPage(),
              ),
            ],
          ),
        ],
      ),

      StatefulShellBranch(
        navigatorKey: searchTabNavigatorKey,
        routes: [
          GoRoute(
            path: searchPath,
            pageBuilder: (context, GoRouterState state) {
              return getPage(
                child: const HomeScreen(),
                state: state,
              );
            },
          ),
        ],
      ),

      StatefulShellBranch(
        navigatorKey: userPlaylistsTabNavigatorKey,
        routes: [
          GoRoute(
            path: userPlaylistsPath,
            pageBuilder: (context, GoRouterState state) {
              return getPage(
                child: const Downloadhome(),
                state: state,
              );
            },
          ),
        ],
      ),

      StatefulShellBranch(
        navigatorKey: settingsTabNavigatorKey,
        routes: [
          GoRoute(
            path: settingsPath,
            pageBuilder: (context, state) {
              return getPage(
                child: const SettingsPage(),
                state: state,
              );
            },
            routes: [
              GoRoute(
                path: 'license',
                builder: (context, state) => const LicensePage(
                  applicationName: 'Musify',
                  applicationVersion: appVersion,
                ),
              ),
              GoRoute(
                path: 'about',
                builder: (context, state) => const AboutScreen(),
              ),
            ],

          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: newsDetailsScreenRoute,
            builder: (context, state) => BlocProvider(
              create: (context) => BookmarkCubit(),
              child: NewsDetailsScreen(
                newsModel: state.extra as NewsModel,

              ),
            ),
          ),
        ],
      ),
    ];
  }
  List<StatefulShellBranch> _offlineRoutes() {
    return [

      StatefulShellBranch(
        navigatorKey: settingsTabNavigatorKey,
        routes: [
          GoRoute(
            path: settingsPath,
            pageBuilder: (context, state) {
              return getPage(
                child: const SettingsPage(),
                state: state,
              );
            },
            routes: [
              GoRoute(
                path: 'license',
                builder: (context, state) => const LicensePage(
                  applicationName: 'Musify',
                  applicationVersion: appVersion,
                ),
              ),
              GoRoute(
                path: 'about',
                builder: (context, state) => const AboutScreen(),
              ),
            ],
          ),
        ],
      ),
    ];
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
