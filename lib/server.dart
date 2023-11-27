import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main() async {
  var handler = const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);

  var server = await io.serve(handler, 'localhost', 8080);

  print('Server is running on port ${server.port}');
}

Response _echoRequest(Request request) {
  // Read the content of your JSON file
  var file = File('path/to/your/data.json');
  var contents = file.readAsStringSync();

  // Return the JSON response
  return Response.ok(
    contents,
    headers: {'Content-Type': 'application/json'},
  );
}