import 'package:flutter/material.dart';

class ProfileLister extends StatefulWidget {
  const ProfileLister({Key? key}) : super(key: key);

  @override
  State<ProfileLister> createState() => _ProfileListerState();
}

class _ProfileListerState extends State<ProfileLister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.black87,
        leading: Transform.translate(
            offset: Offset(30,8),
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
                SizedBox(height: 16.0),
                Divider(height: 30,),
                Row(children: [SizedBox(width: 22,),Text("Sort by : ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)]),
                SizedBox(height: 16.0),
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
                SizedBox(height: 16.0),
                Divider(height: 22,),

                SizedBox(height: 16.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/profile_details");
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
                                  offset: Offset(0,12),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage("assets/images/nassim.jpeg"),
                                    radius: 22,
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(0,22),
                                  child: Column(
                                    children: [
                                      Text('Health',style: TextStyle( fontSize: 12,color: Colors.black54,fontStyle: FontStyle.italic),),
                                      SizedBox(height: 4,),
                                      Text('Hdhiri Mohamed Nassim',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                      SizedBox(height: 4,),
                                      Text('54 011 448',style: TextStyle( fontSize: 12,color: Colors.black54),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Transform.translate(
                                  offset: Offset(0, 25),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width* 0.35,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(width: 2,),
                                        Text("paypal",style: TextStyle( fontSize: 11,color: Colors.black38,fontStyle: FontStyle.italic),),
                                        Text('5 %',style: TextStyle( fontSize: 11,color: Colors.black38,fontStyle: FontStyle.italic),),
                                        Text('Soliman',style: TextStyle( fontSize: 11,color: Colors.black38,fontStyle: FontStyle.italic),),
                                        SizedBox(width: 2,),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
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
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
