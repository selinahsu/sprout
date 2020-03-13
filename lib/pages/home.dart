import 'dart:core';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Avenir',
      ),
      home: MyHomePage(title: 'Sprout'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.fullBalance}) : super(key: key);
  final String title;
  final fullBalance;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imgPath; 
  var crUsage = 1680.39;
  var fullBalance = 500.0; 
  var minPayment = 10; 
  DateTime dueDate = DateTime.now();
  DateTime paidDate = DateTime.now().add(Duration(days: 5));
  bool paidThisMonth; 

  String _setImage() {
    setState(() => {
      //if (paidDate.isBefore(dueDate))
        imgPath = 'assets/images/1_happy.svg'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEEF0F8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/calendar.svg',
            ),
            SvgPicture.asset(
              'assets/images/dash.svg',
            ), 
          ],
        ),
        elevation: 0,
      ),
      body: Container(
              decoration: BoxDecoration(
                color: Color(0xffEEF0F8),
              ),
          child: ListView(
          children:<Widget>[
            Container(
                height: 100,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("TD Rewards VISA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    ),
                    Text("**** 2910"),
                  ],
                ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: LinearPercentIndicator(
                  alignment: MainAxisAlignment.center,
                  width: 382.0,
                  lineHeight: 14.0,
                  percent: 0.75,
                  backgroundColor: Colors.black12,
                  progressColor: Colors.green,
                ),
            ),
            GestureDetector(
                child: Container(
                  height: 350.0,
                  child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/circle.svg',
                    ),
                    Positioned(
                      height: 96.0,
                      bottom: 100.0,
                      left: 40,
                      child: SvgPicture.asset(
                        'assets/images/1_happy.svg',
                      )
                    ),
                  ],
                ),
                ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Current Billing Cycle:",
                      //style: TextTheme.,
                    ),
                    Text(
                      "February 10th - March 11th:"
                    ),
                  ],
                ),
            ),
            Container(
                padding: EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 300,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                              children: <Widget>[
                                Container(
                                  child: CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: 1.0,
                                    center: Text("100%",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    progressColor: Colors.green,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Column(
                                    children: <Widget>[
                                      Text(
                                        "\$${crUsage.toString()} of \$2000",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                      ),
                                      Text(
                                        "\$32.61 pending",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                      ),     
                                    ],
                                  ),
                                ),
                              ],
                          ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: 350,
                                padding: EdgeInsets.all(16.0),
                                decoration: new BoxDecoration(
                                    color: Color(0xFFF1E5BF),
                                    shape: BoxShape.rectangle,
                                  ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget> [
                                    Text(
                                      "Your credit usage is over 30%!",
                                      style: TextStyle(
                                        color: Color(0xFFB87437),
                                        fontWeight: FontWeight.w500, 
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                        "Pay off \$1085 to keep your plant happy and usage under 30%.",
                                        style: TextStyle(
                                          color: Color(0xFFB87437),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            child: 
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      /*...*/
                                    },
                                    color: Color(0xFF63585E),
                                     
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(18.0),
                                    ),
                                    child: Text(
                                      "      Pay Now      ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                          )
                          ],
                        ),
                    ),
                  ),
                  
                ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text("This month's progress",
                  style: TextStyle(
                    fontSize: 24),
                ),
            ),
            GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.lightGreen[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                              child: SvgPicture.asset('assets/images/1_happy.svg',
                              height: 22,
                            ),
                          ),
                          Text('Payment made in full!',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text('You paid off your entire balance of \$392.39 in your Jan 9 - Feb 10 statement',
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.25,
                            ),
                          ),
                          // Text(
                          //   "Updated today",
                          //   style: TextStyle(
                          //     fontSize: 8),
                          //),
                        ], 
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Text('He\'d have you all unravel at the'),
                      color: Colors.lightGreen[100], 
                    ),
                  ),
                ],
            ),
          ],
        ),
      ),
    );
  }
}
