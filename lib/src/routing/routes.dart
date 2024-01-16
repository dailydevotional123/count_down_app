import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/ bibleSection /screens/bible_screen.dart';
import '../features/authenticationSection/screens/sign_in_screen.dart';
import '../features/authenticationSection/screens/splash_screen.dart';
import '../features/bottomNavBarSection/screens/bottomNavScreen.dart';
import '../features/devotionSection/screens/devotion_screen.dart';
import '../features/homeSection/screens/home_screen.dart';
import '../features/homeSection/screens/scripture_detail_screen.dart';
import '../features/moreSection/screens/about_the_app_screen.dart';
import '../features/moreSection/screens/contact_us_screen.dart';
import '../features/moreSection/screens/more_screen.dart';
import '../features/moreSection/screens/resources_screen.dart';
import '../features/notesSection /screens/add_note_screen.dart';
import '../features/notesSection /screens/note_details.dart';
import '../features/notesSection /screens/notes_screen.dart';
import '../utils/route_utils.dart';

GlobalKey<NavigatorState> navstate = GlobalKey<NavigatorState>();

pe({msg, arg}) => debugPrint(
      "\n\x1B[32m $msg =$arg \n ",
    );

class RoutesUtils {
  static var cNavigatorState = GlobalKey<NavigatorState>();
  static BuildContext context = cNavigatorState.currentState!.context;
}

Future<T?> toNext<T>({required Widget widget}) => Navigator.push<T?>(
      RoutesUtils.context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => widget,
        // transitionDuration: Duration.zero,
        transitionDuration: Duration(seconds: 2),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
        reverseTransitionDuration: Duration.zero,
      ),
    );

toRemoveAll({required Widget widget}) => Navigator.pushAndRemoveUntil(
    RoutesUtils.context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      // transitionDuration: Duration.zero,
      transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      reverseTransitionDuration: Duration.zero,
    ),
    (c) => false);

var routerConfigs = GoRouter(
  initialLocation: SplashScreen.route,
  navigatorKey: RoutesUtils.cNavigatorState,
  debugLogDiagnostics: true,
  routes: <GoRoute>[
    GoRoute(
      path: SplashScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SplashScreen());
      },
    ),
    GoRoute(
      path: SignInScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: SignInScreen());
      },
    ),
    GoRoute(
      path: BottomNavScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: BottomNavScreen());
      },
    ),
    GoRoute(
      path: BibleScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: BibleScreen());
      },
    ),
    GoRoute(
      path: DevotionScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: DevotionScreen());
      },
    ),
    GoRoute(
      path: HomeScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: HomeScreen());
      },
    ),
    GoRoute(
      path: MoreScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: MoreScreen());
      },
    ),
    GoRoute(
      path: NotesScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: NotesScreen());
      },
    ),
    GoRoute(
      path: ContactUsScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ContactUsScreen());
      },
    ),
    GoRoute(
      path: ResourcesScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: ResourcesScreen());
      },
    ),
    GoRoute(
      path: AddNoteScreen.route,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: AddNoteScreen(
          scriptureText: extra![RouteConstants.scriptureText],
        ));
      },
    ),
    GoRoute(
      path: AboutTheAppScreen.route,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: AboutTheAppScreen());
      },
    ),
    GoRoute(
      path: ScriptureDetailScreen.route,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: ScriptureDetailScreen(
          devotionalModel: extra![RouteConstants.devotionModel],
          // doctorID: extra![TextUtils.doctorID],
          // appointmentId: extra![TextUtils.appointmentID],
        ));
      },
    ),
    GoRoute(
      path: NoteDetailsScreen.route,
      pageBuilder: (context, state) {
        var extra = state.extra as Map<String, dynamic>?;
        return NoTransitionPage(
            child: NoteDetailsScreen(
          noteData: extra![RouteConstants.noteModel],
        ));
      },
    ),
  ],
);
