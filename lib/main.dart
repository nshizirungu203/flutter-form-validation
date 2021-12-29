import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return  Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:height*0.04),
                Text("Here to Get", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                Text("Welcomed !", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                SizedBox(height: height*0.05,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter your name"
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                      return "Enter correct name";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.05,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Enter your number"
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value!)){
                      return "Enter correct number";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.05,),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Enter your Email"
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)){
                      return "Enter correct Email";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sign up", style: TextStyle(
                      fontSize: 22, color: Colors.blueAccent,
                    ),),
                    NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          //check if form data are valid,
                          //Your process task ahead if all data are valid
                          final snackBar = SnackBar(content: Text('Submit form'));
                          _scaffoldKey.currentState!.showSnackBar(snackBar);
                        
                        }
                      },
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape:
                          NeumorphicBoxShape.circle(),

                      ),
                    )

                  ],
                )
              ],
            ),
          ),
        )
    );
  }


}