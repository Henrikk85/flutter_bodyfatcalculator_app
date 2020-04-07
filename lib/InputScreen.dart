import 'dart:math';
import 'package:bmi_app/FATModel.dart';
import 'package:bmi_app/BMIModel.dart';
import 'package:bmi_app/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  double _heightOfUser = 165.0;
  double _weightOfUser = 65.0;
  double _waistOfUser = 74.0;
  double _neckOfUser = 30.0;
  //double _hipsOfUser = 97.0;

  double _waistminusneck = 50;
  //double _waistplushipsminusneck= 140;

  double logBase(num x, num base) => log(x) / log(base);
  double log10(num x) => log(x) / ln10;

  double _log10waistminusneck = 0;
  double _log10height = 0;

  double _bmi = 0;
  double _fat = 0;

  BMIModel _bmiModel;
  FATModel _fatModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 8, right: 8, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: 100,
                child: SvgPicture.asset("assets/images/heart.svg", fit: BoxFit.contain,),
              ),
              SizedBox(
                height: 8,
              ),
              Text("Body Fat Calculator", style: TextStyle(color: Colors.red[700], fontSize: 26, fontWeight: FontWeight.w700),),
              Text("We care about your health!", style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),),
              SizedBox(
                height: 32,
              ),

              Text("Height (cm)", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Slider(
                  min: 60.0,
                  max: 230.0,
                  onChanged: (height){
                    setState(() {
                      _heightOfUser = height;
                    });
                  },
                  value: _heightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_heightOfUser",
                ),
              ),

              Text("$_heightOfUser cm", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 20,),

              Text("Weight (kg)", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Slider(
                  min: 30.0,
                  max: 200.0,
                  onChanged: (height){
                    setState(() {
                      _weightOfUser = height;
                    });
                  },
                  value: _weightOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_weightOfUser",
                ),
              ),

              Text("$_weightOfUser kg", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 16,),

              //Start Of Attribute

              Text("Waist (cm)", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Slider(
                  min: 30.0,
                  max: 160.0,
                  onChanged: (waist){
                    setState(() {
                      _waistOfUser = waist;
                    });
                  },
                  value: _waistOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_waistOfUser",
                ),
              ),

              Text("$_waistOfUser cm", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 16,),

              //End OF Attribute

              //Start Of Attribute

              Text("Neck (cm)", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Slider(
                  min: 20.0,
                  max: 60.0,
                  onChanged: (neck){
                    setState(() {
                      _neckOfUser = neck;
                    });
                  },
                  value: _neckOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_neckOfUser",
                ),
              ),

              Text("$_neckOfUser cm", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 16,),

              //End OF Attribute

              //Start Of Attribute

             /* Text("Hips (cm)", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 30.0,
                  max: 149.0,
                  onChanged: (hips){
                    setState(() {
                      _hipsOfUser = hips;
                    });
                  },
                  value: _hipsOfUser,
                  divisions: 100,
                  activeColor: Colors.pink,
                  label: "$_hipsOfUser",
                ),
              ),

              Text("$_hipsOfUser cm", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 16,), */

              //End OF Attribute

              Container(
                child: FlatButton.icon(
                    onPressed: (){
                      setState(() {
                        
                        _waistminusneck = _waistOfUser - _neckOfUser;
                       
                        _log10height = log(_heightOfUser) / log(10);
                        
                        _log10waistminusneck = log(_waistminusneck) / log(10);

                        _bmi = (_weightOfUser / (_heightOfUser/100)) / (_heightOfUser/100);

                        _fat = 495 / (1.0324 - 0.19077 * _log10waistminusneck + 0.15456 * _log10height) -450;

                        /* For males: a body fat percentage of:
                        2-4% is considered essential fat
                        6-13% is considered athletic
                        14-17% is considered fit
                        18-25% is considered acceptable
                        25% or higher is considered obese */

                        
                        if(_fat >= 18.0 && _fat <= 24){
                          _fatModel = FATModel(fat: _fat, isNormal: true, comments: "18-24% is considered acceptable");
                        }else if(_fat >= 2 && _fat <= 5){
                          _fatModel = FATModel(fat: _fat, isNormal: true, comments: "2-5% is considered essential fat");
                        }else if(_fat >= 6 && _fat <= 13){
                          _fatModel = FATModel(fat: _fat, isNormal: true, comments: "6-13% is considered athletic");
                        }else if(_fat >= 14 && _fat <= 17){
                          _fatModel = FATModel(fat: _fat, isNormal: true, comments: "14-17% is considered fit");
                        }else if (_fat >= 25) { 
                          _fatModel = FATModel(fat: _fat, isNormal: false, comments: "25% or more is considered unhealhty");
                        }
                        else if (_fat <= 6) { 
                          _fatModel = FATModel(fat: _fat, isNormal: false, comments: "Less than 6% is considered unhealhty");
                        }
                        if(_bmi >= 18.5 && _bmi <= 25){
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: true, comments: "You're totaly in the range of normal");
                        }else if(_bmi < 18.5){
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You're possibly a bit uderweight");
                        }else if(_bmi > 25 && _bmi <= 35){
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You're possibly a bit overweight");
                        }else{
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You're possibly obesed");
                        }

                      });


                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ResultScreen(fatModel: _fatModel, bmiModel: _bmiModel)
                      ));
                    },
                    icon: Icon(Icons.favorite, color: Colors.white,),
                    label: Text("CALCULATE", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400)),
                  textColor: Colors.white,
                  color: Colors.pink,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 8, right: 8),

              ),

              Container(
              child: FlatButton.icon(
                onPressed: (){

                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                label: Text("CHOOSE GENDER"),
                textColor: Colors.white,
                color: Colors.pink,

              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            ),


            ],
          ),
        ),
      ),
    );
  }
}