import "dart:io";
import "dart:convert";

class ToxicClient {
  String _domain;
  int _port;

  ToxicClient(String domain, int port) {
    _domain = domain;
    _port = port;
  }

  String echo() {
    var method = "GET";
    var path = "/api/echo";
    var contentType = ContentType.json;

    print(">>> SEND THE REQUEST");
    send(method, path, contentType)
        .then((json) => print("json : ${json}"))
        .catchError((e) {
          print(">>>> ERROR >>> ${e}");
        });
    print(">>>> GETS HERE BUT WITH NO RESPONSE");

    return '{"authenticated":false,"auth":"0:0:0:0:0:0:0:1","status":"ok"}';
  }

  Future<String> send(String method, String path, ContentType contentType) async {
    HttpClientRequest request = await HttpClient().get(_domain, _port, path)
        ..headers.contentType = contentType;

    print(">>> DONT APPEAR TO GET HERE");

    HttpClientResponse response = await request.close();
    print(">>> DONT HAVE A ${response}");
    await response.transform(utf8.decoder);
  }
}
