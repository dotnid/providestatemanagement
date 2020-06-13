import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providestatemanagement/app_color.dart';
import 'package:providestatemanagement/multi_provider.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AppColor>(
        builder: (context) => AppColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<AppColor>(
              builder: (context, appColor, _) => Text(
                "Provider State Management (Single)",
                style: TextStyle(color: appColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<AppColor>(
                  builder:(context, appColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: appColor.color,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(margin: EdgeInsets.all(5), child: Text("AB"),),
                    Consumer<AppColor>(builder:(context,appColor,_) => Switch(value: appColor.isLightBlue, onChanged: (newValue){appColor.isLightBlue = newValue;},)),
                    Container(margin: EdgeInsets.all(5), child: Text("LB"),),
                  ],
                ),
                RaisedButton(
                  child: Text('Multi Provider'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => multiApp()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
