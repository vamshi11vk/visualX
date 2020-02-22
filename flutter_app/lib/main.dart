import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main(){
  runApp(MaterialApp(
    home:FirstRoute() ,
  ),
    );
}

/*class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {*/
class FirstRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(theme: ThemeData(
       // primarySwatch: Colors.white,
       // backgroundColor: Colors.black,
      ),
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/one.gif"), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.44), BlendMode.dstATop))),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text('visualX',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 36.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                floatingActionButton: Column
                  (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: FloatingActionButton(
                          heroTag: "btn1",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> Saved()),
                            );
                          },
                          tooltip: 'Saved',
                          backgroundColor: Colors.black45,
                          child: Icon(Icons.save),
                          // child:Icon(Icons.add)
                        )
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 20.0,
                      child: (
                          Text('Find saved charts',
                            style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 16.0,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 90.0,
                    ),
                    Center(
                        child: FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: () {
                            Navigator.push(
                             context,
                              MaterialPageRoute(builder: (context)=> Add()),
                               );
                          },
                          tooltip: 'Add new database',
                          backgroundColor: Colors.black45,
                          child: Icon(Icons.add),
                          // child:Icon(Icons.add)
                        )
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 40.0,
                      child: (
                          Text('    Add new data to visualize',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),

                          )
                      ),
                    ),
                  ],
                )
            )
        ),
    );
  }
}

class Saved extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.black,
      ),
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/two.jpg"), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.14), BlendMode.dstATop))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('Saved',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left:5.0,top:600.0,right: 90.0,bottom: 0.0 ),
                //child: Center(
                  child: FloatingActionButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                      backgroundColor: Colors.black45,
                    child:
                    Icon(Icons.arrow_back_ios)
                  ),
                //),
            ),

              )
        ),
      );
    }
  }
class Add extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.black,
      ),
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/two.jpg"), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.14), BlendMode.dstATop))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('Add data',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left:5.0,top:600.0,right: 90.0,bottom: 0.0 ),
                //child: Center(
                child: FloatingActionButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.black45,
                    child:
                    Icon(Icons.arrow_back_ios)
                ),
                //),
              ),
            )
        ),
      );
  }
}





/*class Text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('hello'),
    )
    );
  }
}*/


/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        backgroundColor: Colors.black,
      ),
      home: MyHomePage(title: 'Mamul nai rehta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  /*void _reset() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter=0;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
                style: TextStyle(color: Colors.grey)
            ),
            Text(
              '$_counter',
              style: TextStyle(color:Colors.grey, fontSize: 65)

            ),
          ],

        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
       // child:Icon(Icons.add)
      ),
     /* floatingActionButton2: FloatingActionButton(
        onPressed: _reset,
        tooltip: 'RESET',
        child: Icon(Icons.add),
      ),*/// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
