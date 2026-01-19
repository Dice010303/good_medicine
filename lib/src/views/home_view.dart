import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/pill_viewmodel.dart';
import '../widgets/pill_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PillViewModel>().fetchMyPills("user_test_123"));
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PillViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("나의 약 상자")),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: vm.myPills.length,
        itemBuilder: (c, i) => PillCard(pill: vm.myPills[i], onTap: () {}),
      ),
    );
  }
}