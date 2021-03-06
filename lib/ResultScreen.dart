import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ResultScreen extends StatelessWidget {
  final fatModel, bmiModel;

ResultScreen({this.fatModel, this.bmiModel});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 8, right: 8, top: 32,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

            Container(
              height: 200,
              width: 200,
              child: fatModel.isNormal ? SvgPicture.asset("assets/images/happy.svg", fit: BoxFit.contain,) : SvgPicture.asset("assets/images/sad.svg", fit: BoxFit.contain,) ,
            ),

            SizedBox(
              height: 8,
            ),
            Text("Your Body Fat Is ${fatModel.fat.round()}%", textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),),
            Text("${fatModel.comments}", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),),

            SizedBox(height: 16,),

            fatModel.isNormal ?
            Text("Hurray! Your body fat (%) is normal.", textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),)
                :
            Text("Sadly Your body fat (%) is not normal.", textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),),
            SizedBox(height: 16,),

            SizedBox(
              height: 8,
            ),
            Text("Your BMI Is ${bmiModel.bmi.round()}", style: TextStyle(color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),),
            Text("${bmiModel.comments}", textAlign: TextAlign.center,  style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),),

            SizedBox(height: 16,),

            bmiModel.isNormal ?
            Text("Hurray! Your body mass index is normal. Keep up the healthy lifestyle!", textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),)
                :
            Text("Your body mass index is not in the range experts consider the healthiest. Please make changes in your diet and excersise regime if possible!",  textAlign: TextAlign.center, style: TextStyle(color: Colors.red[700], fontSize: 18, fontWeight: FontWeight.w700),),
            SizedBox(height: 16,),


            Container(
              child: FlatButton.icon(
                onPressed: (){

                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                label: Text("LETS CALCULATE AGAIN"),
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
