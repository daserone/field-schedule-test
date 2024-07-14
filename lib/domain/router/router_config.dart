import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/domain/provider/field_provider.dart';
import 'package:test_agenda/presentation/views/dashboard/dashboard_view.dart';
import 'package:test_agenda/presentation/views/login/login_view.dart';
import 'package:test_agenda/presentation/views/new_schedule/new_schedule_view.dart';
import 'package:test_agenda/presentation/views/onboarding/onboarding_view.dart';
import 'package:test_agenda/presentation/views/register/register_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return DashboardView();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginView();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterView();
          },
        ),
        GoRoute(
            path: 'new-schedule/:fieldId',
            builder: (BuildContext context, GoRouterState state) {
              final fieldId = int.parse(state.pathParameters['fieldId']!);
              final fields = context.read<FieldProvider>();
              final field = fields.fieldList
                  .firstWhere((element) => element.id == fieldId);

              return NewScheduleView(
                field: field,
              );
            }),
      ],
    ),
  ],
);

extension GoRouterExtension on GoRouter {
  void clearStackAndNavigate(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}
