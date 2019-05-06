// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:Toxic/data/toxic_server/job.dart';
import 'package:Toxic/ui/ui_theme.dart';
import 'package:Toxic/ui/wallboard/widgets/job_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // -------------- WIDGET TESTS --------------

  testWidgets('Should display successful build', (WidgetTester tester) async {
    var job =
        Job("001", "STACK", "lol some details", JobStatus.COMPLETED, 0, 0);
    await tester.pumpWidget(MaterialApp(home: JobTile(job)));

    var jobTile = find.widgetWithText(JobTile, 'STACK.job-001');
    JobTileState state = tester.state(jobTile);

    expect(jobTile, findsOneWidget);
    expect(state.color, UITheme.TOXIC_GREEN);
  });

  // -------------- STATE TESTS --------------

  test('Should have aqua background for PENDING build', () {
    var job = Job("001", "STACK", "", JobStatus.PENDING, 0, 0);
    var jobTileState = JobTileState(job);

    expect(jobTileState.color, UITheme.TOXIC_AQUA);
    expect(jobTileState.textColor, Colors.white);
  });

  test('Should have light blue background for INITIALIZING build', () {
    var job = Job("001", "STACK", "", JobStatus.INITIALIZING, 0, 0);
    var jobTileState = JobTileState(job);

    expect(jobTileState.color, UITheme.TOXIC_LIGHT_BLUE);
    expect(jobTileState.textColor, Colors.white);
  });

  test('Should have gray background for ABANDONED build', () {
    var job = Job("001", "STACK", "", JobStatus.ABANDONED, 0, 0);
    var jobTileState = JobTileState(job);

    expect(jobTileState.color, UITheme.TOXIC_GRAY);
    expect(jobTileState.textColor, Colors.black);
  });

  test('Should have green background for passed build', () {
    var job = Job("001", "STACK", "", JobStatus.COMPLETED, 0, 0);
    var jobTileState = JobTileState(job);
    expect(jobTileState.color, UITheme.TOXIC_GREEN);
    expect(jobTileState.textColor, Colors.white);

    job = Job("001", "STACK", "", JobStatus.RUNNING, 0, 0);
    jobTileState = JobTileState(job);
    expect(jobTileState.color, UITheme.TOXIC_GREEN);
    expect(jobTileState.textColor, Colors.white);

    job = Job("001", "STACK", "", JobStatus.ENDING, 0, 0);
    jobTileState = JobTileState(job);
    expect(jobTileState.color, UITheme.TOXIC_GREEN);
    expect(jobTileState.textColor, Colors.white);
  });

  test('Should have red background for failed build', () {
    var job = Job("001", "STACK", "", JobStatus.COMPLETED, 0, 1);
    var jobTileState = JobTileState(job);
    expect(jobTileState.color, UITheme.TOXIC_RED);
    expect(jobTileState.textColor, Colors.white);

    job = Job("001", "STACK", "", JobStatus.RUNNING, 0, 1);
    jobTileState = JobTileState(job);
    expect(jobTileState.color, UITheme.TOXIC_RED);
    expect(jobTileState.textColor, Colors.white);

    job = Job("001", "STACK", "", JobStatus.ENDING, 0, 1);
    jobTileState = JobTileState(job);
    expect(jobTileState.color, UITheme.TOXIC_RED);
    expect(jobTileState.textColor, Colors.white);
  });

  test('Should have yellow background for job after failed build', () {
    var job =
        Job("001", "STACK", "", JobStatus.RUNNING, 0, 0, prevBuildFailed: 1);
    var jobTileState = JobTileState(job);
    expect(jobTileState.color, UITheme.TOXIC_YELLOW);
    expect(jobTileState.textColor, Colors.white);

    job = Job("001", "STACK", "", JobStatus.ENDING, 0, 0, prevBuildFailed: 1);
    jobTileState = JobTileState(job);
    expect(jobTileState.color, UITheme.TOXIC_YELLOW);
    expect(jobTileState.textColor, Colors.white);
  });
}
