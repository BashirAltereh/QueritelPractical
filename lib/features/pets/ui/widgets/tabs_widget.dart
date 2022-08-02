import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class TabsWidget extends StatelessWidget implements PreferredSizeWidget{
  const TabsWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      toolbarHeight: 0,
      bottom: TabBar(
        tabs: const [
          Tab(text: 'Cats'),
          Tab(text: 'Dogs'),
        ],
        indicatorColor: AppColors.blue.withOpacity(0.9),
        labelStyle: Theme.of(context).textTheme.subtitle1,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppColors.blue,
        indicatorWeight: 3,
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(50);
}
