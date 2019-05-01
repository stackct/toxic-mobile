class Job {
  String _id;
  String _name;
  String _details;
  JobStatus _currentStatus;
  DateTime submittedDate;
  DateTime startedDate;
  DateTime completedDate;
  int _suites;
  int _failed;
  int _prevFailed;

  String get id => _id;
  String get name => _name;
  String get details => _details;
  JobStatus get currentStatus => _currentStatus;
  int get suites => _suites;
  int get failed => _failed;
  int get prevFailed => _prevFailed;

  Job(this._id, this._name, this._details, this._currentStatus, this._suites,
      this._failed,
      {int prevBuildFailed = 0}) {
    this._prevFailed = prevBuildFailed;
  }

  String buildWallboardTitle() => this._name + ".job-" + this._id;
}

enum JobStatus { PENDING, INITIALIZING, RUNNING, ENDING, COMPLETED, ABANDONED }
