import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class MainPage extends StatefulWidget {
  MainPage();
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[600],
        body:MaterialApp(
        initialRoute: "/",
        routes: {
        "/": (_) => DefaultPage(),
        // "/bar": (BuildContext context) =>SetMobile(),
        // "/custom": (BuildContext context) => SetMobile(),
        // "/fab": (BuildContext context) => SetMobile(),
        },
    )
    );
  }
}

class DefaultPage extends StatelessWidget {

  Widget gridLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 4,
              md: 2,
              child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 130,
                  decoration:BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(20.0)
                  ) ,

                  child:Column(
                    children: [
                      new Container(
                        child: Icon(Icons.date_range_outlined,color: Colors.blue,size: 35.0,),
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                      ),
                      new Text("سرمایه گذاری تا الان",style: TextStyle(color: Colors.grey),),
                      new Container(
                        child:new Text("15,000 تومان",style: TextStyle(fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                        margin: EdgeInsets.only(top: 15.0),
                      ),

                    ],
                  )
              ),
            ),
            ResponsiveGridCol(
              xs: 4,
              md: 2,
              child: Container(
                  margin: EdgeInsets.all(10.0),                  height: 130,
                  decoration:BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(20.0)
                  ) ,

                  child:Column(
                    children: [
                      new Container(
                        child: Icon(Icons.supervisor_account_outlined,color: Colors.blue,size: 35.0,),
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                      ),
                      new Text("تعداد سرمایه گذار",style: TextStyle(color: Colors.grey),),
                      new Container(
                        child:new Text("1",style: TextStyle(fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                        margin: EdgeInsets.only(top: 15.0),
                      ),

                    ],
                  )
              ),
            ),
            ResponsiveGridCol(
              xs: 4,
              md: 2,
              child:
              Container(
                  margin: EdgeInsets.all(10.0),
                  height: 130,
                  decoration:BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(15.0)
                  ) ,

                  child:Column(
                    children: [
                      new Container(
                        child: Icon(Icons.timer_rounded,color: Colors.blue,size: 35.0,),
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                      ),
                      new Text("زمان باقی مانده",style: TextStyle(color: Colors.grey),),
                      new Container(
                        child:new Text("20 روز",style: TextStyle(fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,),
                        margin: EdgeInsets.only(top: 15.0),
                      ),

                    ],
                  )
              ),
            ),

          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> projects = [
      {'title': 'متقاضی','info':'شرکت بهیار صنعت'},
      {'title': 'مدت زمان ساخت و فروش','info':'شش ماه'},
      {'title': 'سرمایه مورد نیاز','info':'سی و هفت میلیارد ریال'},
      {'title': 'سود مشارکت در طرح','info':' دو درصد'},

    ];
    return Scaffold(
      body:new Container(
        height:MediaQuery.of(context).size.height-240.0 ,
        margin: const EdgeInsets.only(top: 50.0,bottom: 20.0,right:15.0,left:15.0 ),
        child: new Card(
          elevation: 1.0,
          child:new Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Container(
                margin: const EdgeInsets.only(top: 20.0,right: 20.0 ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child:new Text("ساخت و فروش دستگاه شتاب دهنده خطی و پزشکی بهیار",style: TextStyle(fontSize: 17.0,fontWeight:FontWeight.bold),),
                ),
              ),
              Container(
                height: 370.0,
                margin: const EdgeInsets.only(top: 20.0,bottom: 10.0,right:15.0,left:15.0 ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(15.0),
                  border: new Border.all(
                    width: 2.0,
                    color: Colors.grey[400],
                  ),
                ),
                child:new Column(
                  children: [
                    new Row(
                      children: [
                        new Column(
                          children: [
                            new Row(
                              children: [
                                new Container(
                                  margin: EdgeInsets.only(left: 20.0,),
                                  child:new Text("سپنتا",style:TextStyle(fontSize: 20.0),),
                                ),
                                Image.asset('images/logo2.jpg',width: 70.0,),
                              ],
                            ),
                            new Container(
                              margin: EdgeInsets.only(left: 30.0,top: 20.0),
                              child: Image.asset('images/stamp.png',width: 100.0),
                            ),
                          ],
                        ),
                        new Expanded(
                            child: SizedBox(
                              // width: 100.0,
                                height: 200.0,
                                child: new ListView.builder(
                                  // scrollDirection: Axis.vertical,
                                  // shrinkWrap: true,
                                  itemBuilder: (context, position) {
                                    return new Container(
                                      margin: EdgeInsets.only(bottom: 7.0,right: 20.0,left: 20.0),
                                      padding: EdgeInsets.only(right: 10.0,left: 10.0),
                                      decoration: new BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: new BorderRadius.circular(15.0),
                                        border: new Border.all(
                                            color: Colors.blue
                                        ),
                                      ),
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          new Text(projects[position]['info'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.justify,),
                                          new Text(projects[position]['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.justify,),

                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: projects.length != null ? projects.length : 1,
                                ),
                              )
                            )
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('images/device.jpg',width: 250.0,),
                          ),
                        ),
                        new Column(
                          children: [
                            new Container(
                              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                              margin: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                              decoration: new BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: new BorderRadius.circular(5.0),
                                border: new Border.all(
                                  width: 2.0,
                                  color: Colors.indigo,
                                ),
                              ),
                              child: new Text("آدرس ما",style: TextStyle(color: Colors.white),) ,
                            ),
                            new Container(
                              margin: EdgeInsets.only(right: 10.0),
                              child:new Text(" اصفهان بلوار دانشگاه شهرک علمی و تحقیقاتی",style: TextStyle(color: Colors.indigo),) ,

                            ),
                            new Container(
                              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                              margin: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                              decoration: new BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: new BorderRadius.circular(5.0),
                                border: new Border.all(
                                  width: 2.0,
                                  color: Colors.indigo,
                                ),
                              ),
                              child: new Text("تماس با ما",style: TextStyle(color: Colors.white),) ,
                            ),
                            new Text("031-3393148-03",style: TextStyle(color: Colors.indigo),) ,
                          ],
                        ),
                      ],
                    ),
                  ],
                )
                  
              ),
              new Container(
                margin: EdgeInsets.only(top: 10.0,bottom: 15.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Container(
                      margin: EdgeInsets.only(left: 20.0,top: 20.0),
                      child: RichText(
                        text:TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: '3,700,000,000 ',style: TextStyle(fontSize: 15,color: Colors.blue,),),
                            TextSpan(text: " "+'تومان'+" ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color:Colors.black,)),
                          ],
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    new Row(children: [
                      new Text("بهیار صنعت سپاهان",style: TextStyle(fontSize: 18.0),),
                      new Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child:new Icon(Icons.announcement, size: 18.0),
                      ),

                    ],),
                  ],
                ),
              ),
              gridLayout(),
            ],
          ),


        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        color:  Colors.black,
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        items: [
          TabItem(icon: Icons.supervisor_account_outlined),
          TabItem(icon: Icons.search,),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.wb_iridescent),
          TabItem(icon: Icons.home_sharp),
        ],
        initialActiveIndex: 2,
        onTap: (int i) => print('click index=$i'),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}