import 'taskhomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Add extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(debugShowCheckedModeBanner: false,theme: ThemeData(
        //debugShowCheckedModeBanner: false,
        //primarySwatch: Colors.black,
        //backgroundColor: Colors.black,
      ),
        home: Container(
            //decoration: BoxDecoration(
              //  image: DecorationImage(
                //    image: AssetImage("images/two.jpg"), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.14), BlendMode.dstATop))),
            child: Scaffold(
              backgroundColor: Colors.black12,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text('Add data',
                  style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
        ),
      );
  }
}
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(debugShowCheckedModeBanner: false,theme: ThemeData(
        //debugShowCheckedModeBanner: false,
        //primarySwatch: Colors.black,
        //backgroundColor: Colors.black,
      ),
        home: Container(
          //decoration: BoxDecoration(
          //  image: DecorationImage(
          //    image: AssetImage("images/two.jpg"), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.14), BlendMode.dstATop))),
            child: Scaffold(
              backgroundColor: Colors.black12,
            )
        ),
      );
  }
}
class IconsToClick extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(debugShowCheckedModeBanner: false,theme: ThemeData(
        // primarySwatch: Colors.red,
        //backgroundColor: Colors.black,
      ),
        home: Container(
          //decoration: BoxDecoration(
          //  image: DecorationImage(
          //    image: AssetImage("images/one.gif"), fit: BoxFit.cover, colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.44), BlendMode.dstATop))),
          child: Scaffold(
            backgroundColor: Colors.black12,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Saved Charts',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
             /* automaticallyImplyLeading: true,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Colors.white,
              ),*/
            ),
            body: Padding(
              padding: const EdgeInsets.only(left:5.0,top:20.0,right:2.0 ,bottom: 350.0),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage('images/cmr.jpg'),
                  minRadius: 60,
                  maxRadius: 70,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> HomePage()),
                      );
                    },
                    focusColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }
}