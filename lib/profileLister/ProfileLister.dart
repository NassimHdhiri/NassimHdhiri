import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileLister extends StatefulWidget {
  const ProfileLister({Key? key}) : super(key: key);

  @override
  State<ProfileLister> createState() => _ProfileListerState();
}

class _ProfileListerState extends State<ProfileLister> {
  List<Map<String, dynamic>> profiles = [
    {
      'id': 1,
      'firstName': 'John',
      'lastName': 'Doe',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'field': 'health',
      'commPref': 'email',
      'methodOfPayment': 'paypal',
      'etc': 'other details',
      'gender':'male',
      'commRate': 15,
      'location': 'Tunis',
      'tel': '50962823',
      'email': 'john.doe@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?person',
      'experience':3

    },
    {
      'id': 2,
      'firstName': 'Jane',
      'lastName': 'Smith',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'field': 'IT',
      'commPref': 'Phone',
      'methodOfPayment': 'Credit_Card',
      'etc': 'other details',
      'commRate': 12,
      'location': 'Sfax',
      'tel': '50962823',
      'email': 'jane.smith@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?friend',
      'experience':3

    },
    {
      'id': 3,
      'firstName': 'Michael',
      'lastName': 'Johnson',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'field': 'Marketing',
      'commPref': 'Slack',
      'methodOfPayment': 'Bitcoin',
      'etc': 'other details',
      'commRate': 18,
      'location': 'Ariana',
      'tel': '50962823',
      'email': 'michael.johnson@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?single',
      'experience':3

    },
    {
      'id': 4,
      'firstName': 'Emily',
      'lastName': 'Brown',
      'gender':'male',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'field': 'Marketing',
      'commPref': 'email',
      'methodOfPayment': 'Venmo',
      'etc': 'other details',
      'commRate': 10,
      'location': 'Sfax',
      'tel': '50962823',
      'email': 'emily.brown@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?europe',
      'experience':3

    },
    {
      'id': 5,
      'firstName': 'Alex',
      'lastName': 'Garcia',
      'gender':'male',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'field': 'Clothes',
      'commPref': 'Phone',
      'methodOfPayment': 'credit-card',
      'etc': 'other details',
      'commRate': 14,
      'location': 'Sousse',
      'tel': '50962823',
      'email': 'alex.garcia@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?marketing',
      'experience':3

    },
    {
      'id': 6,
      'firstName': 'Sophia',
      'lastName': 'Lee',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'field': 'Foods',
      'commPref': 'email',
      'methodOfPayment': 'paypal',
      'etc': 'other details',
      'commRate': 16,
      'location': 'Jerjis',
      'tel': '50962823',
      'email': 'sophia.lee@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?persona',
      'experience':3

    },
    {
      'id': 7,
      'firstName': 'Elijah',
      'lastName': 'Wang',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'field': 'Clothes',
      'commPref': 'Slack',
      'methodOfPayment': 'Bitcoin',
      'etc': 'other details',
      'commRate': 20,
      'location': 'Kef',
      'tel': '50962823',
      'email': 'elijah.wang@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?avatar',
      'experience':3

    },
    {
      'id': 8,
      'firstName': 'Olivia',
      'lastName': 'Martinez',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'field': 'Foods',
      'commPref': 'Phone',
      'methodOfPayment': 'Venmo',
      'etc': 'other details',
      'commRate': 13,
      'location': 'Jandouba',
      'tel': '50962823',
      'email': 'olivia.martinez@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?child',
      'experience':3

    },
    {
      'id': 9,
      'firstName': 'Liam',
      'lastName': 'Taylor',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'field': 'Marketing',
      'commPref': 'email',
      'methodOfPayment': 'Credit_Card',
      'etc': 'other details',
      'commRate': 11,
      'location': 'Sfax',
      'tel': '50962823',
      'email': 'liam.taylor@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?developer',
      'experience':3

    },
    {
      'id': 10,
      'firstName': 'Ava',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'lastName': 'Nguyen',
      'field': 'IT',
      'commPref': 'Slack',
      'methodOfPayment': 'paypal',
      'etc': 'other details',
      'commRate': 17,
      'location': 'Ariana',
      'tel': '50962823',
      'email': 'ava.nguyen@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?men',
      'experience':3

    },
    {
      'id': 11,
      'firstName': 'Logan',
      'lastName': 'Anderson',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'field': 'health',
      'commPref': 'email',
      'methodOfPayment': 'Bitcoin',
      'etc': 'other details',
      'commRate': 19,
      'location': 'Sousse',
      'tel': '54011448',
      'email': 'logan.anderson@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?woamen',
      'experience':3
    },
    {
      'id': 12,
      'firstName': 'Mia',
      'lastName': 'Davis',
      'age':25,
      'trackingLink':"www.google.com/users",
      'webSite':"www.nassim.com",
      'gender':'male',
      'field': 'Clothes',
      'commPref': 'Phone',
      'methodOfPayment': 'Venmo',
      'etc': 'other details',
      'commRate': 12,
      'location': 'Tunis',
      'tel': '12345678',
      'email': 'mia.davis@example.com',
      'imagePath': 'https://source.unsplash.com/featured/?male',
      'experience':3
    },
  ];







// Example API endpoint, replace with your actual endpoint
  final String apiUrl = 'http://localhost:3000/api/users';

  // List to store profiles retrieved from the API
   // List<Map<String, dynamic>> profiles = [];


  void initState() {
    super.initState();
    //getProfiles();
  }

  // Function to get profiles from the API
  Future<void> getProfiles() async {

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Parse the response body
      List<dynamic> data = jsonDecode(response.body);

      // Clear existing profiles
      profiles.clear();
      // Update the UI
      setState(() {
        // Add retrieved profiles to the list
        data.forEach((profile) {
          profiles.add(Map<String, dynamic>.from(profile));
        });
      });
    } else {
      // Handle errors
      print('Failed to get profiles. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black87,
        leading: Transform.translate(
            offset: const Offset(30,8),
            child: Image.asset("assets/images/logo.png",)
        ),
        leadingWidth: 170,
        actions: [
          Transform.translate(
            offset: Offset(-22,10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(500, 50, 0, 0),
                    items: [
                      PopupMenuItem(
                        child: const Row(
                          children: <Widget>[
                            Icon(Icons.person),
                            Text('Med Nassim')
                          ],
                        ),
                        onTap: () {
                          // Handle log out action
                          print('Logout clicked');
                        },
                      ),
                      PopupMenuItem(
                        child: const Row(
                          children: <Widget>[
                            Icon(Icons.email),
                            Text('hdhiri@gmail.com')
                          ],
                        ),
                        onTap: () {
                          // Handle name action
                          //print('Name clicked');
                        },
                      ),
                      PopupMenuItem(
                        child: const Text('Email'),
                        onTap: () {
                          // Handle email action
                          //print('Email clicked');
                        },
                      ),
                    ],
                  );
                });
              },
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/nassim.jpeg',
                  width: 35,
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.black87,
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                const TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Colors.white24,
                    ),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),

                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue), // Red color when focused
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Divider(height: 30,),
                const Row(children: [SizedBox(width: 22,),Text("Sort by : ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)]),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: TextButton(
                        onPressed: (){
                          print('Sort by name');
                        },
                        child: SizedBox(
                          width:  MediaQuery.of(context).size.width*0.24,
                          height: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22)
                            ),
                            child: const Center(
                              child: Text('Name'),
                            ),
                          ),
                        ),
                      ),

                    ),Flexible(
                      child: TextButton(
                        onPressed: (){
                          print('Sort by Field');
                        },
                        child: SizedBox(
                          width:  MediaQuery.of(context).size.width*0.24,
                          height: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22)
                            ),
                            child: const Center(
                              child: Text('Field'),
                            ),
                          ),
                        ),
                      ),

                    ),Flexible(
                      child: TextButton(
                        onPressed: (){
                          print('Sort by Location');
                        },
                        child: SizedBox(
                          width:  MediaQuery.of(context).size.width*0.24,
                          height: 30,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22)
                            ),
                            child: const Center(
                              child: Text('Location'),
                            ),
                          ),
                        ),
                      ),

                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Divider(height: 22,),

                const SizedBox(height: 16.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    // access the profile data using the index
                    Map <String,dynamic> profile=profiles[index];

                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/profile_details",arguments:profile);
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child:  Center(
                            child: Column(
                              children: [
                                Transform.translate(
                                  offset: const Offset(0,12),
                                  child:  CircleAvatar(
                                    backgroundImage: NetworkImage(profile['imagePath']),
                                    radius: 22,

                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0,22),
                                  child: Column(
                                    children: [
                                      Text(profile['field'],style: const TextStyle( fontSize: 12,color: Colors.black54,fontStyle: FontStyle.italic),),
                                      const SizedBox(height: 4,),
                                      Text(profile['firstName']+' '+profile['lastName'],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                      const SizedBox(height: 4,),
                                      Text(profile['tel'],style: const TextStyle( fontSize: 12,color: Colors.black54),),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8,),
                                Transform.translate(
                                  offset: Offset(0, 25),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width* 0.35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(width: 2,),
                                        Text(profile['methodOfPayment'],style: const TextStyle( fontSize: 11,color: Colors.black38,fontStyle: FontStyle.italic),),
                                        Text('${profile['commRate'].toString()} %',style: const TextStyle( fontSize: 11,color: Colors.black38,fontStyle: FontStyle.italic),),
                                        Text(profile['location'],style: const TextStyle( fontSize: 11,color: Colors.black38,fontStyle: FontStyle.italic),),
                                        const SizedBox(width: 2,),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  BottomNavigationBar(
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          // Handle taps on the items here
          if (index == 0) {
            print("hello");
          }
        },
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Navigator.pushNamed(context, '/add');
          print("FAB tapped");
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
