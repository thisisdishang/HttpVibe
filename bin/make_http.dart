import 'package:http/http.dart' as http;

void main() async {
  // Get Example
  // Get data from the server
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/7');

  // make http get request
  var response = await http.get(url);

  // check the status code
  if (response.statusCode == 200) {
    print("Response from get request:-");
    print(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
  }

  // Post Example
  // Send data to the server
  var url2 = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  // make http post requsest
  var postResponse = await http
      .post(url2, body: {'title': 'foo', 'body': 'bar', 'userId': '1'});

  if (postResponse.statusCode == 201) {
    print("Response from post request:-");
    print(postResponse.body);
  } else {
    print('Request failed with status: ${postResponse.statusCode}');
  }

  // Put Example
  // Update data on the server
  // make http put request
  var putResponse = await http
      .put(url, body: {'title': 'foo', 'body': 'bar', 'userId': '103'});

  if (putResponse.statusCode == 200) {
    print("Response from put request:-");
    print(putResponse.body);
  } else {
    print('Request failed with status: ${putResponse.statusCode}');
  }

  // Patch Example
  // Update a part of data on the server
  // make http patch request
  var patchResponse = await http.patch(url, body: {'title': 'skia'});

  if (patchResponse.statusCode == 200) {
    print("Response from patch request:-");
    print(patchResponse.body);
  } else {
    print('Request failed with status: ${patchResponse.statusCode}');
  }

  // Delete Example
  // Delete data from the server
  // make http delete request
  var deleteResponse = await http.delete(url);
  if (deleteResponse.statusCode == 200) {
    print("Response from delete request:-");
    print(deleteResponse.body);
  } else {
    print('Request failed with status: ${deleteResponse.statusCode}');
  }
}
