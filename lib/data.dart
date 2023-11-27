/*
  List<Map<String, dynamic>> profiles = [
    {"id": 1, "firstName": "John", "lastName": "Doe", "field": "Engineering", "commPref": "Email"},
    {"id": 2, "firstName": "Alice", "lastName": "Smith", "field": "Marketing", "commPref": "Phone"},
    {"id": 3, "firstName": "Bob", "lastName": "Johnson", "field": "Finance", "commPref": "Text"},
    {"id": 4, "firstName": "Eva", "lastName": "Brown", "field": "Human Resources", "commPref": "Phone"},
    {"id": 5, "firstName": "David", "lastName": "Miller", "field": "IT", "commPref": "Email"},
    {"id": 6, "firstName": "Sophie", "lastName": "Davis", "field": "Sales", "commPref": "Email"},
    {"id": 7, "firstName": "Michael", "lastName": "Clark", "field": "Research", "commPref": "Phone"},
    {"id": 8, "firstName": "Emma", "lastName": "White", "field": "Customer Support", "commPref": "Email"},
    {"id": 9, "firstName": "Matthew", "lastName": "Jones", "field": "Design", "commPref": "Text"},
    {"id": 10, "firstName": "Olivia", "lastName": "Johnson", "field": "Marketing", "commPref": "Email"},
    {"id": 11, "firstName": "Daniel", "lastName": "Taylor", "field": "Engineering", "commPref": "Phone"},
    {"id": 12, "firstName": "Ava", "lastName": "Moore", "field": "Finance", "commPref": "Email"},
  ];
*/
/*
  List<Map<String, dynamic>> profiles = [
    {
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

    },
    {
      'id': 2,
      'firstName': 'Jane',
      'lastName': 'Smith',
      'gender':'male',
      'field': 'Data Science',
      'commPref': 'Phone',
      'methodOfPayment': 'Credit Card',
      'etc': 'other details',
      'commRate': 0.12,
      'location': 'City B',
      'tel': '987-654-3210',
      'email': 'jane.smith@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?friend',
      'experience':3

    },
    {
      'id': 3,
      'firstName': 'Michael',
      'lastName': 'Johnson',
      'gender':'male',
      'field': 'UX Design',
      'commPref': 'Slack',
      'methodOfPayment': 'Bitcoin',
      'etc': 'other details',
      'commRate': 0.18,
      'location': 'City C',
      'tel': '555-123-4567',
      'email': 'michael.johnson@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?single',
      'experience':3

    },
    {
      'id': 4,
      'firstName': 'Emily',
      'lastName': 'Brown',
      'gender':'male',
      'field': 'Marketing',
      'commPref': 'Email',
      'methodOfPayment': 'Venmo',
      'etc': 'other details',
      'commRate': 0.1,
      'location': 'City D',
      'tel': '789-456-1230',
      'email': 'emily.brown@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?europe',
      'experience':3

    },
    {
      'id': 5,
      'firstName': 'Alex',
      'lastName': 'Garcia',
      'gender':'male',
      'field': 'Mobile Development',
      'commPref': 'Phone',
      'methodOfPayment': 'Credit Card',
      'etc': 'other details',
      'commRate': 0.14,
      'location': 'City E',
      'tel': '321-654-0987',
      'email': 'alex.garcia@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?marketing',
      'experience':3

    },
    {
      'id': 6,
      'firstName': 'Sophia',
      'lastName': 'Lee',
      'gender':'male',
      'field': 'Graphic Design',
      'commPref': 'Email',
      'methodOfPayment': 'Paypal',
      'etc': 'other details',
      'commRate': 0.16,
      'location': 'City F',
      'tel': '111-222-3333',
      'email': 'sophia.lee@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?persona',
      'experience':3

    },
    {
      'id': 7,
      'firstName': 'Elijah',
      'lastName': 'Wang',
      'gender':'male',
      'field': 'Machine Learning',
      'commPref': 'Slack',
      'methodOfPayment': 'Bitcoin',
      'etc': 'other details',
      'commRate': 0.2,
      'location': 'City G',
      'tel': '444-555-6666',
      'email': 'elijah.wang@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?avatar',
      'experience':3

    },
    {
      'id': 8,
      'firstName': 'Olivia',
      'lastName': 'Martinez',
      'gender':'male',
      'field': 'Product Management',
      'commPref': 'Phone',
      'methodOfPayment': 'Venmo',
      'etc': 'other details',
      'commRate': 0.13,
      'location': 'City H',
      'tel': '777-888-9999',
      'email': 'olivia.martinez@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?child',
      'experience':3

    },
    {
      'id': 9,
      'firstName': 'Liam',
      'lastName': 'Taylor',
      'gender':'male',
      'field': 'Web Development',
      'commPref': 'Email',
      'methodOfPayment': 'Credit Card',
      'etc': 'other details',
      'commRate': 0.11,
      'location': 'City I',
      'tel': '222-333-4444',
      'email': 'liam.taylor@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?developer',
      'experience':3

    },
    {
      'id': 10,
      'firstName': 'Ava',
      'gender':'male',
      'lastName': 'Nguyen',
      'field': 'Content Writing',
      'commPref': 'Slack',
      'methodOfPayment': 'Paypal',
      'etc': 'other details',
      'commRate': 0.17,
      'location': 'City J',
      'tel': '666-777-8888',
      'email': 'ava.nguyen@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?men',
      'experience':3

    },
    {
      'id': 11,
      'firstName': 'Logan',
      'lastName': 'Anderson',
      'gender':'male',
      'field': 'Cybersecurity',
      'commPref': 'Email',
      'methodOfPayment': 'Bitcoin',
      'etc': 'other details',
      'commRate': 0.19,
      'location': 'City K',
      'tel': '999-000-1111',
      'email': 'logan.anderson@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?woamen',
      'experience':3
    },
    {
      'id': 12,
      'firstName': 'Mia',
      'lastName': 'Davis',
      'gender':'male',
      'field': 'Social Media Management',
      'commPref': 'Phone',
      'methodOfPayment': 'Venmo',
      'etc': 'other details',
      'commRate': 0.12,
      'location': 'City L',
      'tel': '333-444-5555',
      'email': 'mia.davis@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?male',
      'experience':3
    },
  ];

*/

