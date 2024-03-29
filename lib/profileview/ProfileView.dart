import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  Future<bool> deleteProfile(int id) async {
    try {
      final response = await http.delete(Uri.parse("http://localhost:3000/api/users/$id"));

      if (response.statusCode == 200) {
        print('Delete successful!');
        return true;
      } else {
        print('Error in deleting. Status code: ${response.statusCode}');
        return false; // Indicate failure
      }
    } catch (error) {
      print('Error: $error');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> profile=ModalRoute.of(context)!.settings.arguments as  Map<String,dynamic>;

    Color appBarColor = const Color(0xffD9D9D9);
//  MediaQueryData mediaQueryData = MediaQuery.of(context);


    return Scaffold(
      appBar: AppBar(
        title:  Text(profile['firstName'], style: TextStyle(color: Colors.black)),
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
              children: [
                Center(
                child: Container(
                  width: double.infinity,
                  color: Colors.black87,
                  child: Column(
                    children: [
                      Transform.translate(
                          offset: const Offset(0, 30), // Specify the desired translation values
                          child:  CircleAvatar(
                            backgroundImage: NetworkImage(profile['imagePath']),
                            radius: 90,
                          )
                      ), SizedBox(height: 60,),
                       Text(
                        profile['firstName']+' '+profile['lastName'],
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                      const SizedBox(height: 12,),
                      const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 70.0),
                      child: Divider(height: 2,),
                    )
                  ,
                      const SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pushNamed(context, "/update",arguments: profile);
                            print("update button ");
                          }, icon:Image.asset("assets/images/edit-profile.png" ,width: 35,color: Colors.white,),
                          ),
                          SizedBox(width: 40,),
                          IconButton(
                              onPressed: (){
                                  deleteProfile(profile['id']);
                              },
                              icon: Icon(Icons.delete,size: 35,color: Colors.redAccent,),
                          )
                        ],
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
                              padding:  EdgeInsets.symmetric(vertical: 5),
                              child:  Column(
                                children: [
                                   const Row(children: [Text("Account information",style: TextStyle(fontWeight: FontWeight.bold,),)]),
                                   const SizedBox(height: 18),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 15,),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Text('ID'),
                                                Row(
                                                  children: [
                                                    Text(profile['id'].toString()),
                                                    const SizedBox(width: 22,)
                                                  ],
                                                )
                                              ],
                                            ) ,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(width: 2),
                                          Expanded(
                                            child: Flex(
                                              direction: Axis.horizontal,
                                              children: [
                                                SizedBox(width:10 ,),
                                                Text('Email'),
                                                SizedBox(width: 22,),
                                                Flexible(
                                                  child: Text(
                                                    profile['email'],
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(width: 15,),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Tel'),
                                                Row(
                                                  children: [
                                                    Text(profile['tel']),
                                                    SizedBox(width: 22,)
                                                  ],
                                                )
                                              ],
                                            ) ,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 22),
                            const Column(
                              children: [
                                 Row(
                                  children: [
                                    Text("Web site ",style: TextStyle(fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                                 SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     SizedBox(width: 15,),
                                   // InkWell(
                                    //  onTap: () => launchUrl(Uri.parse('https://www.google.com')),
                                     //:/ child: const Text('Click here to visit my website',style: TextStyle(decoration: TextDecoration.underline),),
                                    //),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                             Column(
                              children: [
                                 Row(
                                  children: [
                                    Text("Payment information ",style: TextStyle(fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                                 SizedBox(height: 12),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15,),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Method'),
                                          Row(
                                            children: [
                                              Text(profile['methodOfPayment']),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('COMM RATE'),
                                          Row(
                                            children: [
                                              Text('${profile['commRate']} %'),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     SizedBox(width: 15),
                                    Expanded(
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tracking Link'),
                                          Row(
                                            children: [
                                              Text('LINK',style: TextStyle(decoration: TextDecoration.underline,),),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 22),
                             Column(
                              children: [
                                 Row(
                                  children: [
                                    Text("Communication Preferences ",style: TextStyle(fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                                 SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15,),
                                    Expanded(
                                      child:   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('comm pref '),
                                          Row(
                                            children: [
                                              Text(profile['commPref']),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                              Column(
                              children: [
                                 Row(
                                  children: [
                                    Text("Demographics ",style: TextStyle(fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                                 SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15,),
                                    Expanded(
                                      child:   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Gender'),
                                          Row(
                                            children: [
                                              Text(profile['gender']),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15),
                                    Expanded(
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Location'),
                                          Row(
                                            children: [
                                              Text(profile['location']),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     SizedBox(width: 15),
                                    Expanded(
                                      child:   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Tracking Link'),
                                          Row(
                                            children: [
                                              Text('LINK',style: TextStyle(decoration: TextDecoration.underline,),),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 22),
                             Column(
                              children: [
                                 Row(
                                  children: [
                                    Text("Interests",style: TextStyle(fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                                 SizedBox(height: 12),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15,),
                                    Expanded(
                                      child:   Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Field'),
                                          Row(
                                            children: [
                                              Text(profile['field']),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 22),
                             Column(
                              children: [
                                 Row(
                                  children: [
                                    Text("Experience",style: TextStyle(fontWeight: FontWeight.bold,)),
                                  ],
                                ),
                                 SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     SizedBox(width: 15,),
                                    Expanded(
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('experiences'),
                                          Row(
                                            children: [
                                              Text('${profile["experience"]} yrs'),
                                              SizedBox(width: 22,)
                                            ],
                                          )
                                        ],
                                      ) ,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Transform.translate(
                                offset: Offset(0,12),
                                child: Image.asset("assets/images/LineBlack.jpg")
                            ),

                          ],
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
