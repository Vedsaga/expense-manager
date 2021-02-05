import 'package:expense_manager/core/keys.dart';
import 'package:expense_manager/core/localization.dart';
import 'package:expense_manager/data/models/home_tab.dart';
import 'package:expense_manager/ui/dashboard/dashboard.dart';
import 'package:expense_manager/ui/history/history.dart';
import 'package:expense_manager/ui/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final homeViewModel = watch(signInModelProvider);
    return ProviderListener<HomeViewModel>(
      provider: signInModelProvider,
      onChange: (context, model) async {},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          title: Text("Dashboard"),
        ),
        body: homeViewModel.activeTab == HomeTab.dashboard
            ? Dashboard()
            : History1(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: HomeTab.values.indexOf(homeViewModel.activeTab),
          onTap: homeViewModel.changeTab,
          items: HomeTab.values.map((tab) {
            return BottomNavigationBarItem(
              icon: Icon(
                tab == HomeTab.dashboard ? Icons.home : Icons.history,
                key: tab == HomeTab.dashboard
                    ? AppKeys.todoTab
                    : AppKeys.statsTab,
              ),
              label: tab == HomeTab.dashboard
                  ? AppLocalizations.dashboard
                  : AppLocalizations.history,
            );
          }).toList(),
        ),
      ),
    );
  }
}
