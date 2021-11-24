import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/Api/IBehiarRepository.dart';
import 'package:flutter_app_test/Api/BehiarService.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'MainPage.dart';

class CheckToken extends StatefulWidget {
  CheckToken({Key key, @required this.mobile}) : super(key: key);
  final int mobile;
  _CheckToken createState() => _CheckToken(mobile: mobile);
}

class _CheckToken extends State<CheckToken> {
  int counter=116;
  Timer _timer;

  _CheckToken({Key key, @required this.mobile}){
    _behiarRepository=BehiarService();
  }
  final int mobile;
  IBehiarRepository _behiarRepository;

  setTimeCounter(){
    _timer=new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if(counter<=0)
      {
        timer.cancel();
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTokenAction(mobile);
    setTimeCounter();
  }

  getTokenAction(int mobile){
    var response=_behiarRepository.getToken(mobile);
    response.then((value){
      setState(() {
        // print("response"+value.body.toString());
        Map decoded;
        if(Platform.isAndroid) {
          decoded = jsonDecode(value.body);
        }
        else{
          var data = jsonDecode(value.body);
          decoded = json.decode(data[0]);
        }
        if(decoded['statusCode']==200) {

        }
        else {

        }

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body:Stack(
          children: [
            Column(
              children: [
                ShapeOfView(
                  shape: ArcShape(
                      direction: ArcDirection.Outside,
                      height: 80,
                      position: ArcPosition.Bottom
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width:MediaQuery.of(context).size.width ,
                        child:Icon(Icons.account_balance_outlined,color: Theme.of(context).textTheme.subtitle2.color,size: 75,),
                      )

                    ],
                  ),

                ),
                new Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: new Center(
                      child:new Text("تایید شماره همراه",style: TextStyle(fontSize:22,color: Colors.blue,fontWeight:FontWeight.bold ))
                  ),

                ),
                new Container(
                  margin: EdgeInsets.only(right:20.0,top: 20.0,bottom:20.0 ),
                  child: new Align(
                    alignment: Alignment.topRight,
                    child:new Flexible(
                      child:RichText(
                        text:TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'کد چهار رقمی ارسال شده به شماره',style: TextStyle(fontSize: 16,color: Colors.black,),),
                            TextSpan(text: " "+'${mobile}'+" ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color:Colors.blue)),
                            TextSpan(text:'را وارد کنید'+" ",style: TextStyle(fontSize: 16,color: Colors.black),),
                          ],
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      ),
                    ),

                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                      // width: 50.0,
                      margin: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: new OTPTextField(
                        length: 4,
                        width: MediaQuery.of(context).size.width-200,
                        textFieldAlignment: MainAxisAlignment.spaceBetween,
                        fieldWidth: 55,
                        fieldStyle: FieldStyle.box,
                        // outlineBorderRadius: 15,
                        style: TextStyle(fontSize: 17),
                        onChanged: (pin) {
                          // print("Changed: " + pin);
                        },
                        onCompleted: (pin) {
                          Navigator.of(context, rootNavigator: true)
                              .pushAndRemoveUntil(
                              new CupertinoPageRoute<String>(
                                builder: (BuildContext context) =>
                                MainPage(),
                              ), (Route<dynamic> route) => false
                          );

                        },
                      )
                    ),
                  ],
                ),
                new Container(
                  margin:EdgeInsets.only(top: 20.0),
                  child:Align(
                    alignment: Alignment.center,
                    child: Text(' ${counter.toString()} ثانیه دیگر باقی مانده ',style:TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,),textDirection: TextDirection.rtl),
                  ),
                )
              ],
            ),
          ],
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}