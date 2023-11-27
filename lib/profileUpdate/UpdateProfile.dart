import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  late Map<String, dynamic> profile;

  late TextEditingController idController;
  late TextEditingController emailController;
  late TextEditingController telController;
  late TextEditingController linkController;
  late TextEditingController trackingLinkController;
  late TextEditingController ageController;
  late TextEditingController experienceController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController ;
  late TextEditingController experiencesController;
  late TextEditingController websiteController;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      initializeData();
    });
  }
  void initializeData() {
    profile = (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>);
  }

  Color appBarColor = const Color(0xffD9D9D9);
  late int selectedValueRate;
   List<int> dropdownItemsRate= [5, 10, 15];

  late String selectedValueField;
   List<String> dropdownItemsField= ['health', 'IT', 'Clothes', 'Foods'];

  late String selectedValueMethod;
   List<String> dropdownItemsMethod=['paypal', 'transfer', 'payoner'];

  late String selectedValuePref;
   List<String> dropdownItemsPref=['email', 'phone', 'meet'];

  late String selectedValueGender;
   List<String> dropdownItemsGender=['male', 'woman'];

  late String selectedValueLocation;
  List<String> dropdownItemsLocation=['Tunis','Sousse','Ariana','Sfax','Mahdia','Jandouba','Kef','Touzer','Jerjis','Ben Arous'];

  @override
  Widget build(BuildContext context) {
    profile = (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>);

    print(profile);

    idController = TextEditingController(text: profile['id'].toString());
    emailController = TextEditingController(text: profile['email']);
    telController = TextEditingController(text: profile['tel'].toString());
    linkController = TextEditingController(text: profile['trackingLink']);
    websiteController = TextEditingController(text: profile['webSite']);
    trackingLinkController = TextEditingController(text: profile['trackingLink']);
    ageController = TextEditingController(text: profile['age'].toString());
    lastNameController = TextEditingController(text: profile['lastName']);
    firstNameController = TextEditingController(text: profile['firstName']);
    experienceController = TextEditingController(text: profile['experience'].toString());

   /*
    final int rate= profile['commRate'];
    final String field=profile['field'];
    final String method=profile['methodOfPayment'];
    final String commPref= profile['commPref'];
    final String gender= profile['gender'];
    final String location= profile['location'];

    selectedValueRate = rate;
    selectedValueField = field;
    selectedValueMethod = method;
    selectedValuePref = commPref;
    selectedValueGender = gender;
    selectedValueLocation = location;
    */

    selectedValueRate = profile['commRate'];
    selectedValueField = profile['field'];
    selectedValueMethod = profile['methodOfPayment'];
    selectedValuePref = profile['commPref'];
    selectedValueGender = profile['gender'];
    selectedValueLocation = profile['location'];

    void _submitForm(int id) async{

      final Uri url=Uri.parse("http://localhost:3000/api/users/$id");
      print('update');

      try{
        print('try');
        if(_keyForm.currentState!.validate()){
          print('valid');
          // Create a map with the form data
          Map<String, dynamic> formData = {
            'id': idController.text,
            'firstName': firstNameController.text,
            'lastName': lastNameController.text,
            'email': emailController.text,
            'tel': telController.text,
            'webSite': websiteController.text,
            'trackingLink': trackingLinkController.text,
            'method': selectedValueMethod,
            'rate': selectedValueRate,
            'commPref': selectedValuePref,
            'gender': selectedValueGender,
            'location': selectedValueLocation,
            'field': selectedValueField,
            'age': ageController.text,
            'experience': experienceController.text,
          };
          print('form');
          // Print the form data to the console
          print('Form Data: $formData');

          // Make a PUT request to the API
          final response = await http.put(
            url,
            body: formData,
          );
        }

      }catch(error){
        // Error handling
        print('Error during form submission: $error');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Update", style: TextStyle(color: Colors.black)),
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
                          Text('Med Nassim'),
                        ],
                      ),
                      onTap: () {
                        print('Logout clicked');
                      },
                    ),
                    PopupMenuItem(
                      child: const Row(
                        children: <Widget>[
                          Icon(Icons.email),
                          Text('hdhiri@gmail.com'),
                        ],
                      ),
                      onTap: () {
                        // Handle name action
                      },
                    ),
                    PopupMenuItem(
                      child: const Text('Email'),
                      onTap: () {
                        // Handle email action
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
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    color: Colors.black87,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: const Offset(0, 30),
                          child:  CircleAvatar(
                            backgroundImage: NetworkImage(profile['imagePath']),
                            radius: 90,
                          ),
                        ),
                        const SizedBox(height: 60,),
                         Text(
                          profile['firstName']+" "+profile["lastName"],
                          style: const TextStyle(color: Colors.whit e, fontSize: 20),
                        ),
                        const SizedBox(height: 12,),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 70.0),
                          child: Divider(height: 2,),
                        ),
                        const SizedBox(height: 12,),
                        IconButton(
                          onPressed: () {
                            print("delete");
                          },
                          icon: const Icon(Icons.delete, size: 35, color: Colors.redAccent,),
                        ),
                        const SizedBox(height: 12,),
                        Container(
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          width: 268,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 22),
                                child:Form(
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
                                                        enabled: false,
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
                                              const SizedBox(width: 15,),
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
                                                child: DropdownButton<int>(
                                                  value: selectedValueRate,
                                                  onChanged: (int? newValue) {
                                                    setState(() {
                                                      print('yet change');
                                                      selectedValueRate = newValue!;
                                                      print('change $newValue');
                                                    });
                                                  },
                                                  items: dropdownItemsRate.map<DropdownMenuItem<int>>((int value) {

                                                    return DropdownMenuItem<int>(
                                                      value: value,
                                                      child: Text(value.toString()),
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
                                                      value: (value!=selectedValuePref)?value:selectedValuePref,
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
                                                      value: (value!=selectedValueLocation)?value:selectedValueLocation,
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
                                                      value:  (value!=selectedValueGender)?value:selectedValueGender,
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
                                                  controller: experienceController,
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
                                              onPressed: ()=>_submitForm(profile['id']),
                                              child:  Text('edit',style: TextStyle(color: Colors.white)),
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(height: 40,),
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
