import 'package:Toxic/data/toxic_server/job.dart';
import 'package:Toxic/ui/ui_theme.dart';
import 'package:flutter/material.dart';

class JobTile extends StatefulWidget {
  final Job _job;

  JobTile(this._job);

  @override
  State<StatefulWidget> createState() {
    return JobTileState(_job);
  }
}

class JobTileState extends State<JobTile> {
  Job _job;
  Color _color = UITheme.TOXIC_GREEN;
  Color _textColor = Colors.white;

  Color get color => _color;
  Color get textColor => _textColor;

  JobTileState(this._job) {
    switch (_job.currentStatus) {
      case JobStatus.PENDING:
        _color = UITheme.TOXIC_AQUA;
        break;
      case JobStatus.INITIALIZING:
        _color = UITheme.TOXIC_LIGHT_BLUE;
        break;
      case JobStatus.COMPLETED:
      case JobStatus.RUNNING:
      case JobStatus.ENDING:
        if (_job.failed != 0) {
          _color = UITheme.TOXIC_RED;
        } else if (_job.prevFailed != 0) {
          _color = UITheme.TOXIC_YELLOW;
        } else {
          _color = UITheme.TOXIC_GREEN;
        }
        break;
      case JobStatus.ABANDONED:
        _color = UITheme.TOXIC_GRAY;
        _textColor = Colors.black;
        break;
      default:
        _color = UITheme.TOXIC_GREEN;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: _color,
        margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
        child: Column(children: [
          Padding(
              child: Text(
                _job.buildWallboardTitle(),
                textScaleFactor: 1.25,
                style: TextStyle(color: _textColor),
              ),
              padding: EdgeInsets.only(bottom: 32.0))
        ]));
  }
}
