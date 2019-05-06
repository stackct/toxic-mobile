import 'package:Toxic/data/toxic_server/job.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Build job wallboard title', () {
    var job = Job("000", "asdf", "lol idk", JobStatus.COMPLETED, 0, 0);
    expect(job.buildWallboardTitle(), "asdf.job-000");

    var job2 = Job("123", "STACK", "lol idk", JobStatus.COMPLETED, 0, 0);
    expect(job2.buildWallboardTitle(), "STACK.job-123");
  });
}
