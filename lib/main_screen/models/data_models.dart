import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class university {
  String country;
  String name;

  university(this.name, this.country);
  // Initialization code goes here.
}

getdata() async {
  var url1 =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
  var response = await http.get(url1);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
