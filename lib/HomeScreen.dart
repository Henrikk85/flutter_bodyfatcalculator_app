import 'package:bmi_app/InputScreen.dart';
import 'package:bmi_app/InputScreenFemale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                child: SvgPicture.asset("assets/images/happy.svg", fit: BoxFit.contain,),
              ),
              SizedBox(
                height: 8,
              ),
              Text("Body Fat Calculator", textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 36, fontWeight: FontWeight.w700),),
              Text("We care about your health!", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),),
              SizedBox(
                height: 32,
              ),

              Container(
                child: FlatButton.icon(
                    onPressed: (){
                      setState(() {
                       
                      });

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => InputScreen()
                      ));
                    },
                    icon: Icon(Icons.face, color: Colors.white, size: 60),
                    label: Text("MALE", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),),
                  textColor: Colors.white,
                  color: Colors.pink,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              ),

              Container(
                child: FlatButton.icon(
                    onPressed: (){
                      setState(() {
                       
                      });

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => InputScreenFemale()
                      ));
                    },
                    icon: Icon(Icons.favorite, color: Colors.white, size: 60),
                    label: Text("FEMALE", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),),                    
                  textColor: Colors.white,
                  color: Colors.pink,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              )


            ],
          ),
        ),
      ),
    );
  }
}