import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/views/tasks/fragments/approved_fragment.dart';
import 'package:tada/views/tasks/fragments/pending_fragment.dart';
import 'package:tada/views/tasks/fragments/rejected_fragment.dart';

import 'fragments/favoris_fragment.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  List<String> tabTabList = [
    "Favoris",
    "En attentes",
    "Approuvées",
    "Rejetées"
  ];

  @override
  void initState() {
    tabController = TabController(length: tabTabList.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTabList.length,
      child: ScaffoldPage(
        bottom: TabBar(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          isScrollable: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          tabs: tabTabList
              .map(
                (title) => Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: Text(
                    title,
                    style: context.labelMedium,
                  ),
                ),
              )
              .toList(),
        ),
        titlePage: 'Mes tâches',
        body: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: [
              const FavorisFragment(),
              const PendingFragment(),
              const ApprovedFragment(),
              const RejectedFragment(),
            ]),
      ),
    );
  }
/*Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: 'Mes tâches',
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 10),
              child: TabBar(
                physics: const BouncingScrollPhysics(),
                controller: tabController,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.zero,
                dividerColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: blackColor,
                isScrollable: true,
                tabs: tabTabList
                    .map(
                      (title) => Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: Text(
                          title,
                          style: context.labelMedium,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  physics: const BouncingScrollPhysics(),
                  children: [...tabTabList.map((e) => Text("$e"))]),
            )
          ],
        ),
      ),
    );
  }*/
}
