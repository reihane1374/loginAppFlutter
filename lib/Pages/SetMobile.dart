import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/Pages/CheckToken.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shape_of_view/shape_of_view.dart';

class SetMobile extends StatefulWidget {
  SetMobile();
  @override
  _SetMobileState createState() => _SetMobileState();
}

class _SetMobileState extends State<SetMobile> {
  var txtMobileController = new TextEditingController();
  _SetMobileState();

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
                  margin: EdgeInsets.only(right:20.0,top: 40.0,bottom:20.0 ),
                  child: new Align(
                    alignment: Alignment.topRight,
                    child:new Flexible(
                      child:RichText(
                        text:TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'لطفا برای',style: TextStyle(fontSize: 16,color: Colors.black,),),
                            TextSpan(text: " "+'ورود'+" ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color:Colors.blue)),
                            TextSpan(text:'یا'+" ",style: TextStyle(fontSize: 16,color: Colors.black),),
                            TextSpan(text:" " +'عضویت'+" ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color:Colors.blue)),
                            TextSpan(text:'شماره ی همراه خود را وارد کنید',style: TextStyle(fontSize: 16,color: Colors.black),),
                          ],
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      ),
                    ),

                  ),
                ),
                new Row(
                  children: [
                    new Container(
                      margin: EdgeInsets.only(left: 40.0),
                      child: new Text("98+"),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 5.0),
                      child: Image.asset('images/iran.png',width: 30.0,),
                    ),
                    new Container(
                      margin: EdgeInsets.only(top: 20.0,left: 20.0),
                      width:MediaQuery.of(context).size.width-170 ,
                      child: TextField(
                        maxLength: 10,
                        controller:txtMobileController,
                        textAlign:TextAlign.left,
                        decoration: new InputDecoration(
                          hintText: "9** *** ****",
                          contentPadding:const EdgeInsets.only(left: 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.blue,
                        style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.black
                        ),
                      ),
                    )

                  ],
                  
                ),
                Expanded(
                  child:Align(
                    alignment: Alignment.bottomCenter,
                    child:ShapeOfView(
                      shape: ArcShape(
                          direction: ArcDirection.Outside,
                          height: 80,
                          position: ArcPosition.Top
                      ),
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.blue,
                            padding: EdgeInsets.all(30.0),
                            width:MediaQuery.of(context).size.width ,
                            child:CircleAvatar(
                              radius: 30,
                              backgroundColor:Colors.white,
                              child:new SizedBox(
                                  height: 18.0,
                                  width: 18.0,
                                  child: new IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    color: Colors.blue,
                                    icon: new Icon(Icons.arrow_forward_ios_rounded, size: 18.0),
                                    onPressed:(){
                                      setState(() {
                                        if (txtMobileController.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: " 'شماره همراه خود را وارد کنید'",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.TOP,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.red,
                                              textColor:Colors.white
                                          );
                                        } else if (txtMobileController.text.length !=10) {
                                          Fluttertoast.showToast(
                                              msg: "یک شماره همراه صحیح وارد کنید",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.TOP,
                                              timeInSecForIos: 1,
                                              backgroundColor: Colors.red,
                                              textColor:Colors.white
                                          );
                                        }
                                        else {
                                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                                            return CheckToken(mobile: int.parse(txtMobileController.text));
                                          }));
                                        }
                                      });

                                    },
                                  )
                              )
                            ),

                          )

                        ],
                      ),

                    ),
                  ),
                )
              ],
            )

          ],
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}