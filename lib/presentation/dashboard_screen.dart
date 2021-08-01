import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_music_player_app/network/model/place_pages.dart';
import 'package:flutter_music_player_app/presentation/widgets/dialogs/add_journey_dialog.dart';
import 'package:flutter_music_player_app/presentation/widgets/icon_fab.dart';
import 'package:flutter_music_player_app/storage/local_storage.dart';
import 'package:flutter_music_player_app/storage/storage_keys.dart';

import '../SizeConfig.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, this.title}) : super(key: key);


  final String? title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: DIFFERENT_JOUNEY_TYPES.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              children: <Widget>[
                Spacer(),
                Icon(Icons.more_vert, color: Colors.black,),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40.0),
            child: Text((LocalStorage.getItem(NAME) != null ? ("Hallo " + LocalStorage.getItem(NAME)! + "!") : ""), style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito-Regular',
                fontSize: 4.5 * SizeConfig.textMultiplier
            ),),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40.0),
            child: TabBar(
                controller: tabController,
                indicatorColor: Colors.blue[900],
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold
                ),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: <Widget>[
                  ...DIFFERENT_JOUNEY_TYPES.map((type) =>
                      Tab(
                        child: Text(type.title.toUpperCase(), style: TextStyle(
                            fontSize: 2 * SizeConfig.textMultiplier,
                            fontFamily: 'Nunito'
                        ),),
                      ),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    ...DIFFERENT_JOUNEY_TYPES.map((type) => type.screen),
                  ]),
            ),
          )
        ],
      ),
      floatingActionButton: IconFloatingActionButton(
        iconData: Icons.add,
        callback: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AddJourneyDialog(callback: () {

            },);
          });
        },
      ),
    );
  }
}