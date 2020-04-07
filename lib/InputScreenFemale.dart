import 'dart:math';
import 'package:bmi_app/FATModel.dart';
import 'package:bmi_app/BMIModel.dart';
import 'package:bmi_app/ResultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputScreenFemale extends StatefulWidget {
  @override
  _InputScreenFemaleState createState() => _InputScreenFemaleState();
}

class _InputScreenFemaleState extends State<InputScreenFemale> {
  double _heightOfUser = 165.0;
  double _weightOfUser = 65.0;
  double _waistOfUser = 74.0;
  double _neckOfUser = 30.0;
  double _hipsOfUser = 97.0;

  /* double _waistminusneck = 50; */
  double _waistplushipsminusneck= 140;

  double logBase(num x, num base) => log(x) / log(base);
  double log10(num x) => log(x) / ln10;



  /* double _log10waistminusneck = 0; */
  double _log10height = 0;
  double _log10waistplushipsminusneck = 0;
  /* double _heightOfUsersquared = 0; */


  double _bmi = 10;
  double _fat = 10;

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
                  divisions: 340,
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
                  divisions: 340,
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
                  max: 180.0,
                  onChanged: (waist){
                    setState(() {
                      _waistOfUser = waist;
                    });
                  },
                  value: _waistOfUser,
                  divisions: 300,
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
                  min: 15.0,
                  max: 60.0,
                  onChanged: (neck){
                    setState(() {
                      _neckOfUser = neck;
                    });
                  },
                  value: _neckOfUser,
                  divisions: 90,
                  activeColor: Colors.pink,
                  label: "$_neckOfUser",
                ),
              ),

              Text("$_neckOfUser cm", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 16,),

              //End OF Attribute

              //Start Of Attribute

              Text("Hips (cm)", style: TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),),

              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Slider(
                  min: 40.0,
                  max: 180.0,
                  onChanged: (hips){
                    setState(() {
                      _hipsOfUser = hips;
                    });
                  },
                  value: _hipsOfUser,
                  divisions: 280,
                  activeColor: Colors.pink,
                  label: "$_hipsOfUser",
                ),
              ),

              Text("$_hipsOfUser cm", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),

              SizedBox(height: 16,),

              //End OF Attribute

              Container(
                child: FlatButton.icon(
                    onPressed: (){
                      setState(() {
                        
                        _waistplushipsminusneck = _waistOfUser + _hipsOfUser - _neckOfUser;
                        _log10waistplushipsminusneck = log(_waistplushipsminusneck) / log(10);
                        _log10height = log(_heightOfUser) / log(10);

                        _bmi = (_weightOfUser / (_heightOfUser/100)) / (_heightOfUser/100);
                        _fat = 495 / (1.29579 - 0.35004 * _log10waistplushipsminusneck + 0.22100 * _log10height) -450;

                        /*
                        For females: a body fat percentage of:
                        10-12% is considered essential fat
                        14-20% is considered athletic
                        21-24% is considered fit
                        25-31% is considered acceptable
                        32% or more is considered obese
                        */                        
                        
                        if(_fat >= 25.0 && _fat <= 31){
                          _fatModel = FATModel(fat: _fat, isNormal: true, comments: "25-31% is considered acceptable");
                        }else if(_fat >= 10 && _fat <= 13){
                          _fatModel = FATModel(fat: _fat, isNormal: true, comments: "10-13% is considered essential fat");
                        }else if(_fat >= 14 && _fat <= 20){
                          _fatModel = FATModel(fat: _fat, isNormal: true, comments: "14-20% is considered athletic");
                        }else if(_fat >= 21 && _fat <= 24){
                          _fatModel = FATModel(fat: _fat, isNormal: true, comments: "21-24% is considered fit");
                        }else if (_fat >= 32) { 
                          _fatModel = FATModel(fat: _fat, isNormal: false, comments: "32% or more is considered unhealhty");
                        }
                        else if (_fat <= 6) { 
                          _fatModel = FATModel(fat: _fat, isNormal: false, comments: "Less than 6% is considered Unhealhty");
                        }
                        if(_bmi >= 18.5 && _bmi <= 25){
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: true, comments: "You're totally in the range of normal");
                        }else if(_bmi < 18.5){
                          _bmiModel = BMIModel(bmi: _bmi, isNormal: false, comments: "You're possibly a bit underweight");
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