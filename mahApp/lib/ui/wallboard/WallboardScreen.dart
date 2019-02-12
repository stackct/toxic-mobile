import 'package:Toxic/data/toxic_server/Job.dart';
import 'package:Toxic/ui/wallboard/widgets/JobTile.dart';
import 'package:flutter/material.dart';

class WallboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WallboardState([
      Job("001", "Solitare",        "lol some details", JobStatus.INITIALIZING,   0, 0),
      Job("001", "Bridge",          "lol some details", JobStatus.PENDING,        0, 0),
      Job("001", "Euchre",          "XOXOXOXO",         JobStatus.ABANDONED,      0, 0),
      Job("001", "Go Fish",         "fish",             JobStatus.RUNNING,        0, 0),
      Job("001", "Texas Holdem",    "Spades",           JobStatus.RUNNING,        0, 1),
      Job("001", "Black Jack",      "Spades",           JobStatus.RUNNING,        0, 0, prevBuildFailed: 1),
      Job("001", "Hearts <3",       "<3",               JobStatus.COMPLETED,      0, 0),
      Job("001", "Generic Poker",   "Hearts",           JobStatus.COMPLETED,      0, 1),
      Job("001", "War",             "Hearts",           JobStatus.COMPLETED,      0, 0),

    ]);
  }
}

class WallboardState extends State<WallboardScreen> {

  static String APP_BAR_TITLE = "Wallboard";
  List<Job> _jobs;

  WallboardState(List<Job> jobs){
    _jobs = jobs;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return JobTile(_jobs[index]);
        },
        itemCount: _jobs.length,
      );
  }
}