import 'package:andaz/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget with PreferredSizeWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}

class _HomePageState extends State<HomePage> {
  List dayName = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];
  List temp = [23, 34, 34, 54, 34, 32, 42];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(),
      appBar: MyAppBar(),
      body: Stack(
        children: [
          //container for background image
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/bg.jpg',
                    ))),
          ),
          Positioned(
            top: 150,
            left: 50,
            child: Image.asset(
              'assets/wicon/09d.png',
            ),
          ),
          Positioned(
            top: 60,
            right: 10,
            child: Image.asset(
              'assets/wicon/09d.png',
            ),
          ),

          //Container for Linear Gradient
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff161A42).withOpacity(.9),
              Color(0xff161A42).withOpacity(.5),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Container(
            constraints: BoxConstraints.expand(),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HeaderText(
                            text: 'Dhaka',
                          ),
                          HeaderText(
                            text: ',',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          HeaderText(text: 'BD')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DateText(
                            text: 'Sunday',
                          ),
                          DateText(
                            text: ',',
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          DateText(
                            text: 'January 24, 2021',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //Temp and Icon
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: TempText(
                                temp: '19',
                              ),
                            ),
                            Image.asset('assets/wicon/09d.png', scale: 1,),

                          ],
                        ),
                      ),
                      Text(
                        'Sunny',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TempRange(
                            temp: 'Min: 19C',
                          ),
                          SizedBox(
                            width: 16,
                            child: TempRange(temp: '|'),
                          ),
                          TempRange(
                            temp: 'Max: 19C',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BottomContainer(
                            title: 'Wind Now',
                            value: '8',
                            unit: 'km',
                          ),
                          BottomContainer(
                            title: 'Humidity',
                            value: '80',
                            unit: '%',
                          ),
                          BottomContainer(
                            title: 'Precipitation',
                            value: '78',
                            unit: '%',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        height: MediaQuery.of(context).size.height * .12,
                        color: Colors.indigo.withOpacity(0.1),
                        child: ListView.builder(
                            itemCount: dayName.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TempRange(temp: dayName[index]),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          temp[index].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'C',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer(
      {Key? key, required this.title, required this.value, required this.unit})
      : super(key: key);

  final String title, value, unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.indigo.withOpacity(.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TempRange(temp: title),
          SizedBox(
            height: 14,
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Text(
                value,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text(
                unit,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TempRange extends StatelessWidget {
  const TempRange({Key? key, required this.temp}) : super(key: key);

  final String temp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          temp,
          style: TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class TempText extends StatelessWidget {
  const TempText({Key? key, required this.temp}) : super(key: key);

  final String temp;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$temp°C',
      style: TextStyle(
          color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold),
    );
  }
}

class DateText extends StatelessWidget {
  const DateText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(color: Colors.white70, fontSize: 20),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
          fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white),
    );
  }
}
/*
Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeaderText(text: 'Dhaka',),
                      HeaderText(text: ',',),
                      SizedBox(width: 10,),
                      HeaderText(text: 'BD')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DateText(text: 'Sunday',),
                      DateText(text: ',',),
                      SizedBox(width: 8,),
                      DateText(text: 'January 24, 2021',),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TempText(temp: '19',),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  Text('Sunny', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TempRange(temp: 'Min: 19C',),
                      SizedBox(
                        width: 16,
                        child: TempRange(temp: '|'),
                      ),
                      TempRange(temp: 'Max: 19C',),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomContainer(title: 'Wind Now', value: '8', unit: 'km',),
                      BottomContainer(title: 'Humidity', value: '80', unit: '%',),
                      BottomContainer(title: 'Precipitation', value: '78', unit: '%',),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    child: ListView.builder(
                        itemCount: dayName.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return Container(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  TempRange(temp: dayName[index]),
                                  Row(
                                    children: [
                                      Text(temp[index].toString(), style: TextStyle(color: Colors.white, fontSize: 20),),
                                      Text('C', style: TextStyle(color: Colors.white, fontSize: 20),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )

                ],
              )
* */
