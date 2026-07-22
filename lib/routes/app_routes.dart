import 'package:go_router/go_router.dart';
import 'package:triviatec_app/screens/Results.dart';
import 'package:triviatec_app/screens/home.dart';
import 'package:triviatec_app/screens/questions.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(name: 'home',path: '/', builder: (context, state) => const Home()),
    GoRoute(name: 'result',path: '/result', builder: (context, state) => const Results()),
    GoRoute(name: 'qustions',path: '/questions', builder: (context, state) => const Questions()),
  ],
);
