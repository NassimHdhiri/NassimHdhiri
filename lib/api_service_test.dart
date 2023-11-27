import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Test API POST request', () async {
    // Arrange
    final formData =  {
      'id': 1,
      'firstName': 'John',
      'lastName': 'Doe',
      'field': 'Software Engineering',
      'commPref': 'Email',
      'methodOfPayment': 'Paypal',
      'etc': 'other details',
      'gender':'male',
      'commRate': 0.15,
      'location': 'City A',
      'tel': '123-456-7890',
      'email': 'john.doe@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?person',
      'experience':3

    }; // Replace with your actual form data
    final uri = Uri.parse('http://localhost:3000/api/users');

    // Act
    final response = await http.post(uri, body: formData);

    // Assert
    if (response.statusCode == 200) {
      // Successful response
      print('API POST request successful');
    } else {
      // Error handling
      print('API POST request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

    // Add assertions based on your expected behavior
    expect(response.statusCode, equals(200));
    // Add more assertions based on your API response and logic
  });
}
