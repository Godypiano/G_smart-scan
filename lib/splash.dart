import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:ussd/ussd.dart';
//  import 'package:ussd_service/ussd_service.dart';



class MyApp1 extends StatelessWidget {

  

  @override

  Widget build(BuildContext context) {

    return new MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'G_smart scanner',

      theme: new ThemeData(
        primarySwatch: Colors.grey,

      ),

      home: new MyHomePage(title: 'G_smart Scanner'),

    );

  }

}
class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

final String title;


 @override

  _MyHomePageState createState() => new _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {
  String text1 ="Vocher";
  
//     makeMyRequest() async {
//   int subscriptionId = 1; // sim card subscription Id
//   String code = "*104*$_value #"; // ussd code payload
//   try {
//     String ussdSuccessMessage = await UssdService.makeRequest(subscriptionId, code);
//     print("succes! message: $ussdSuccessMessage");
//     setState(() {
//      text1 =  ussdSuccessMessage;
//     });

//   } on PlatformException catch (e) {
//     print("error! code: ${e.code} - message: ${e.message}");
//         setState(() {
//      text1 =  e.message;
//     });
//   }
 
// }

  String _counter,_value = "";

  Future<void> launchUssd(String ussdCode) async {
    Ussd.runUssd(ussdCode);
  }

  Future _incrementCounter() async {

    _counter= await FlutterBarcodeScanner.scanBarcode("#004297", "Cancel", true, ScanMode.BARCODE);

  setState(() {
   _value = _counter;
  });
launchUssd("*104*$_value #");
  // makeMyRequest();
 
  }
 

  @override

  Widget build(BuildContext context) {
     return new Scaffold(

      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        
                        
                        
                        image: AssetImage("assets/halo.png"),
                        fit: BoxFit.cover)),
                child: new Center(
        child: new Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Value scanned:',
            ),
            new Text(
               text1,
                //  _value,
              style: Theme.of(context).textTheme.display1,

            ),

          ],

        ),

      ), 
    ),

      floatingActionButton: new FloatingActionButton(

        onPressed: _incrementCounter,

        tooltip: 'Increment',

        child: new Icon(Icons.settings_overscan),

      ),

    );
                
    }

}