import 'package:flutter/material.dart';
import 'package:pets_exercise/core/constants/enums.dart';
import 'package:pets_exercise/features/pets/logic/pets_bloc.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:pets_exercise/features/pets/ui/widgets/tab_data_widget.dart';

import '../../../core/constants/app_images.dart';

class PetsListWebPage extends StatefulWidget {
  const PetsListWebPage({Key? key}) : super(key: key);

  @override
  State<PetsListWebPage> createState() => _PetsListWebPageState();
}

class _PetsListWebPageState extends State<PetsListWebPage> {
  PageController page = PageController();

  @override
  void initState() {
    petsBloc.getCats(context);
    petsBloc.getDogs(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const TabsWidget(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            // onDisplayModeChanged: (mode) {
            //   print(mode);
            // },
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    AppImages.logo,
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Copyright to Figozo ',
                style: TextStyle(fontSize: 9),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Cats',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.category_rounded),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Dogs',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.category_outlined),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: const [
                TabDataWidget(petType: PetType.cats),
                TabDataWidget(petType: PetType.dogs),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
