import 'package:Toxic/client/toxic_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('connect', () {
    var client = ToxicClient("localhost", 8001);
    var status = client.echo();

    expect(status, isNotNull);
  });
}
