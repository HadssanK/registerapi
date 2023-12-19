import 'package:http/http.dart' as http;
class apiproduct{
  Future apifetch()async{
    var request = http.Request('GET', Uri.parse('https://fakestoreapi.com/products'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      return result;
    }
    else {
      print(response.reasonPhrase);
      return null;
    }

  }
}