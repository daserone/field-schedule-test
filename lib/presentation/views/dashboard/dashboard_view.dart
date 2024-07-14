import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_agenda/domain/provider/bottom_navigation_provider.dart';
import 'package:test_agenda/core/theme/color_constants.dart';
import 'package:test_agenda/presentation/views/favorite/favorite_view.dart';
import 'package:test_agenda/presentation/views/home/home_view.dart';
import 'package:test_agenda/presentation/views/schedule/schedule_view.dart';
import 'package:test_agenda/presentation/widgets/bottom_bar_button.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final List<Widget> currentTab = [
    const HomeView(),
    const ScheduleView(),
    const FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, provider, child) {
          return currentTab[provider.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<BottomNavigationBarProvider>(
        builder: (context, provider, child) {
          return Container(
              constraints: const BoxConstraints(
                maxHeight: 80,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  BottomBarButton(
                    icon: Icon(
                      Icons.home,
                      color: provider.currentIndex == 0
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    title: 'Inicio',
                    isActive: provider.currentIndex == 0,
                    onPressed: () => provider.currentIndex = 0,
                  ),
                  const Spacer(),
                  BottomBarButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: provider.currentIndex == 1
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    title: 'Reservas',
                    isActive: provider.currentIndex == 1,
                    onPressed: () => provider.currentIndex = 1,
                  ),
                  const Spacer(),
                  BottomBarButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: provider.currentIndex == 2
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    title: 'Favoritos',
                    isActive: provider.currentIndex == 2,
                    onPressed: () => provider.currentIndex = 2,
                  ),
                ],
              ));
        },
      ),
    );
  }
}
