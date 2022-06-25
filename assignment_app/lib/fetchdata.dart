import 'package:http/http.dart' as http;

getdata() async {
  try {
    var data = await http.get(
        Uri.parse('https://mocki.io/v1/26ca1ca6-332a-46fe-9df8-392d87a0ecf2'));
    return data.body;
  } catch (e) {
    print('haa yar error aa gya hai yha pe hai $e');
  }
}
