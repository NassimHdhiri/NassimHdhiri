import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileAdd extends StatefulWidget {
  const ProfileAdd({super.key});

  @override
  State<ProfileAdd> createState() => _ProfileAddState();
}

class _ProfileAddState extends State<ProfileAdd> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  Color appBarColor = const Color(0xffD9D9D9);
    String selectedValueRate = '5 %';
    List<String> dropdownItemsRate = ['5 %', '10%', '15%'];

    String selectedValueField = 'health';
    List<String> dropdownItemsField = ['health','IT', 'Clothes', 'Foods'];

    String selectedValueMethod = 'paypal';
    List<String> dropdownItemsMethod = ['paypal', 'bank transfer', 'payoner'];

    String selectedValuePref = 'mail';
    List<String> dropdownItemsPref = ['mail', 'phone', 'meet'];

    String selectedValueGender = 'male';
    List<String> dropdownItemsGender = ['male', 'woman'];

    String selectedValueLocation = 'Tunis';
    List<String> dropdownItemsLocation = ['Tunis', 'Sousse','Ariana','Sfax','Mahdia','Jandouba','Kef','Touzer','Jerjis','Ben Arous'];


   TextEditingController idController = TextEditingController();
   TextEditingController firstNameController = TextEditingController();
   TextEditingController lastNameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController telController = TextEditingController();
   TextEditingController websiteController = TextEditingController();
   TextEditingController trackingLinkController = TextEditingController();
   TextEditingController ageController = TextEditingController();
   TextEditingController experiencesController = TextEditingController();



   bool OnSending=false;

  void _submitForm() async {
    try {
      setState(() {
        OnSending = true;
      });
      if (_keyForm.currentState!.validate()) {
        // Create a map with the form data
        Map<String, dynamic> formData = {
          'id': idController.text,
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'tel': telController.text,
          'website': websiteController.text,
          'trackingLink': trackingLinkController.text,
          'method': selectedValueMethod,
          'rate': selectedValueRate,
          'commPref': selectedValuePref,
          'gender': selectedValueGender,
          'location': selectedValueLocation,
          'field': selectedValueField,
          'age': ageController.text,
          'experiences': experiencesController.text,
        };

        // Print the form data to the console
        print('Form Data: $formData');

        // Make a POST request to the API
        final response = await http.post(
          Uri.parse('http://localhost:3000/api/users'),
          body: formData,
        );

        // Handle the response (you can modify this based on your API)
        if (response.statusCode == 200) {
          // Successful response
          print('API POST request successful');

          // Clear form fields on success
          idController.clear();
          firstNameController.clear();
          lastNameController.clear();
          emailController.clear();
          telController.clear();
          websiteController.clear();
          trackingLinkController.clear();
          ageController.clear();
          experiencesController.clear();

          // reset the dropdowns to their initial values
          setState(() {
            selectedValueMethod = dropdownItemsMethod.first;
            selectedValueRate = dropdownItemsRate.first;
            selectedValuePref = dropdownItemsPref.first;
            selectedValueLocation = dropdownItemsLocation.first;
            selectedValueGender = dropdownItemsGender.first;
            selectedValueField = dropdownItemsField.first;
          });
        } else {
          // Error handling
          print('API POST request failed with status: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
      }
    } catch (error) {
      // Handle any exceptions that might occur during form submission
      setState(() {
        showDialog = true;
      });
      print('Error during form submission: $error');
      // You might want to display an error message to the user or perform other error handling here
    } finally {
      setState(() {
        OnSending = false;
      });
    }
  }

  bool showDialog=false;
   @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text("Hdhiri", style: TextStyle(color: Colors.black)),
          backgroundColor: appBarColor,

          actions: [
            IconButton(
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
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/nassim.jpeg',
                  width: 32,
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Stack(
                children:[
                  Center(
                    child: Container(
                      width: double.infinity,
                      color: Colors.black87,
                      child: Column(
                        children: [
                          Transform.translate(
                              offset: Offset(0, 30), // Specify the desired translation values
                              child:  GestureDetector(
                                  onTap: (){
                                    print("add photo");
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/default.png"),
                                    radius: 90,
                                  )
                              )
                          ),
                          Transform.translate(
                              offset: Offset(60,4),
                              child: GestureDetector(
                                onTap: (){
                                  print("add photo");
                                },
                                  child: Image.asset("assets/images/plus.png")
                              ),
                          )

                          ,const SizedBox(height: 60,),
                          const Text(
                            'Profile Name',
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                          const SizedBox(height: 12,),
                          const Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 70.0),
                            child: Divider(height: 2,),
                          )
                          ,const SizedBox(height: 12,),

                          const SizedBox(height: 12,),

                          Container(
                            padding: const EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            width: 268,
                            child: Stack(
                              children:[
                                (showDialog)?
                                AlertDialog(
                                  title: const  Text("Missing Information"),
                                  iconPadding:EdgeInsets.all(2),
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Text("Oops ! something is wrong !"),
                                      SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              showDialog = false;
                                            });
                                          },
                                          child: Text("OK"),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                :
                                Form(
                                key: _keyForm,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 22),
                                      child: Column(
                                        children: [
                                          const Row(children: [Text("Account information",style: TextStyle(fontWeight: FontWeight.bold,),)]),
                                          const SizedBox(height: 18),
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: idController,
                                                      keyboardType: TextInputType.number,
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter valid id';
                                                        }

                                                        return null; // Return null if the value is valid
                                                      },
                                                      decoration: const InputDecoration(
                                                        labelText: 'id',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: firstNameController,
                                                      keyboardType: TextInputType.text,
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter some text';
                                                        }
                                                        // Check if the value contains any numbers or special characters
                                                        if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                                          return 'First name cannot contain numbers or special characters';
                                                        }
                                                        return null; // Return null if the value is valid
                                                      },
                                                      decoration: const InputDecoration(
                                                        labelText: 'first name',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: lastNameController,
                                                      keyboardType: TextInputType.text,
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter some text';
                                                        }
                                                        // Check if the value contains any numbers or special characters
                                                        if (RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
                                                          return 'last name cannot contain numbers or special characters';
                                                        }
                                                        return null; // Return null if the value is valid
                                                      },
                                                      decoration: const InputDecoration(
                                                        labelText: 'last name',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: emailController,
                                                      keyboardType: TextInputType.emailAddress,
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter an email address';
                                                        }

                                                        // Regular expression for a simple email validation
                                                        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                                                          return 'Please enter a valid email address';
                                                        }

                                                        return null; // Return null if the value is valid
                                                      },

                                                      decoration: const InputDecoration(
                                                        labelText: 'email',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  const SizedBox(width: 15,),
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: telController,
                                                      keyboardType: TextInputType.phone,
                                                      validator: (value) {
                                                        if (value == null || value.isEmpty) {
                                                          return 'Please enter a phone number';
                                                        }
                                                        // Check if the value is a valid number
                                                        if (int.tryParse(value) == null) {
                                                          return 'Please enter a valid number';
                                                        }
                                                        return null; // Return null if the value is valid
                                                      },

                                                      decoration: const InputDecoration(
                                                        labelText: 'tel',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 22),
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Text("Web site ",style: TextStyle(fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 15,),
                                            Expanded(
                                              child: TextFormField(
                                                controller: websiteController,
                                                keyboardType: TextInputType.url,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Please enter some text';
                                                  }
                                                  // Check if the value is a valid number

                                                  return null; // Return null if the value is valid
                                                },
                                                decoration: const InputDecoration(
                                                  labelText: "link",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Text("Payment information ",style: TextStyle(fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 15,),
                                            Expanded(
                                              child: DropdownButton<String>(
                                                value: selectedValueMethod,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValueMethod = newValue!;
                                                  });
                                                },
                                                items: dropdownItemsMethod.map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: DropdownButton<String>(
                                                value: selectedValueRate,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValueRate = newValue!;
                                                  });
                                                },
                                                items: dropdownItemsRate.map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: TextFormField(
                                                controller: trackingLinkController,
                                                keyboardType: TextInputType.url,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Please enter an url';
                                                  }
                                                  return null; // Return null if the value is valid
                                                }
                                                ,
                                                decoration: const InputDecoration(
                                                  labelText: "Tracking link",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 22),
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Text("Communication Preferences ",style: TextStyle(fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 15,),
                                            Expanded(
                                              child: DropdownButton<String>(
                                                value: selectedValuePref,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValuePref = newValue!;
                                                  });
                                                },
                                                items: dropdownItemsPref.map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Text("Demographics ",style: TextStyle(fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 15,),
                                            Expanded(
                                              child: DropdownButton<String>(
                                                value: selectedValueLocation,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValueLocation = newValue!;
                                                  });
                                                },
                                                items: dropdownItemsLocation.map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: DropdownButton<String>(
                                                value: selectedValueGender,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValueGender = newValue!;
                                                  });
                                                },
                                                items: dropdownItemsGender.map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 15),
                                            Expanded(
                                              child: TextFormField(
                                                controller: ageController,
                                                keyboardType: TextInputType.number,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Please enter the age';
                                                  }
                                                  // Check if the value is a valid number
                                                  if (int.tryParse(value) == null) {
                                                    return 'Please enter a valid number';
                                                  }
                                                  return null; // Return null if the value is valid
                                                },
                                                decoration: const InputDecoration(
                                                  labelText: "age",
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 22),
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Text("Interests",style: TextStyle(fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 15,),
                                            Expanded(
                                              child: DropdownButton<String>(
                                                value: selectedValueField,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValueField = newValue!;
                                                  });
                                                },
                                                items: dropdownItemsField.map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 22),
                                    Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Text("Experience",style: TextStyle(fontWeight: FontWeight.bold,)),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 15,),
                                            Expanded(
                                              child: TextFormField(
                                                controller: experiencesController,
                                                validator: (value) {
                                                  if (value == null || value.isEmpty) {
                                                    return 'Please enter some text';
                                                  }
                                                  // Check if the value is a valid number
                                                  if (int.tryParse(value) == null) {
                                                    return 'Please enter a valid number';
                                                  }
                                                  return null; // Return null if the value is valid
                                                },
                                                keyboardType: TextInputType.number,
                                                decoration: const InputDecoration(
                                                    hintText: "experiences"
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 30,)
                                    ,
                                    SizedBox(
                                        width: 150,
                                        child: DecoratedBox(
                                          decoration: const BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius:  BorderRadius.only(topLeft: Radius.circular(22),bottomRight: Radius.circular(22),bottomLeft: Radius.circular(22)),
                                          ),
                                          child: TextButton(
                                            onPressed:_submitForm,
                                            child:  Text(!OnSending?'add':'sending ...',style: TextStyle(color: Colors.white)),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),]
                            ),
                          ),
                          const SizedBox(height: 40,)
                        ],
                      ),
                    ),
                  )],
              ),
            );
          },
        ),
      );
  }
}
