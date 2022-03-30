import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class university {
  String country;
  String name;

  university(this.name, this.country);
  // Initialization code goes here.
}

getdata() async {
  var test = Uri.parse('https://www.breakingbadapi.com/api/characters');
  var response = await http.get(test);
  if (response.statusCode == 200) {
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
