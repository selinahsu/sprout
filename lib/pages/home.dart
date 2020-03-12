import 'dart:core';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
        title: Text(widget.title),
        backgroundColor: Color(0xFAFAFA),
        elevation: 0,
        leading: SvgPicture.asset(
          'assets/images/calendar.svg',
        ),
        actions: <Widget>[
          SvgPicture.asset(
            'assets/images/disc.svg',
          ), 
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
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
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Current Statement Period:"
                ),
                Text(
                  "February 10th - March 11th:"
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              height: 400.0,
              child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 317.0,
                  height: 317.0,
                  decoration: new BoxDecoration(
                    color: Colors.green[100],
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  height: 96.0,
                  bottom: 100.0,
                  left: -5,
                  //color: Colors.red,
                  child: SvgPicture.asset(
                    'assets/images/1_happy.svg',
                  )
                ),
              ],
            ),
            ),
          ),
          ListView(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    width: 300,
                    height: 167,
                    child: Row(
                      children: <Widget>[
                        // put in the circle progress indicator
                      ],
                    ),
                  ),
              ),
            ],
          )
        ],
      ),
    ); 
  }
}
