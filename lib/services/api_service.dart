import 'package:http/http.dart' as http;

Future<String> fetchData() async {
  final response = await http.get(Uri.parse('https://mocki.io/v1/3e67b151-ff77-4d4c-ac5c-e5e8048f94e4'));
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data');
  }
}