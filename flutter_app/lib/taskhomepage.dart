import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/task.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';


class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  List<charts.Series<Task, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<Task> myData;
  _generateData(myData){
    _seriesData= List<charts.Series<Task,String>>();
    _seriesData.add(
        charts.Series(
          domainFn: (Task task,_) => task.task.toString(),
          measureFn: (Task task,_) => task.taskvalue,
          colorFn:(Task task,_)=>
              charts.ColorUtil.fromDartColor(Color(int.parse(task.colorval))) ,
          id: 'placements',
          data: myData,
          labelAccessorFn: (Task row,_)=>'${row.taskvalue}',
        )
    );
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesPieData.add(
      charts.Series(
          domainFn: (Task task, _) => task.task,
          measureFn: (Task task, _) => task.taskvalue,
          colorFn: (Task task, _) =>
              charts.ColorUtil.fromDartColor(Color(int.parse(task.colorval))),
          id: 'placements pie',
          data: myData,
          labelAccessorFn: (Task row, _) => '${row.taskvalue}${'\n'}${row.task}'
      ),
    );
    /*  List<charts.Series<Task, String>> _seriesPieData;
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesPieData.add(
      charts.Series(
          domainFn: (Task task, _) => task.task,
          measureFn: (Task task, _) => task.taskvalue,
          colorFn: (Task task, _) =>
              charts.ColorUtil.fromDartColor(Color(int.parse(task.colorval))),
          id: 'placements pie',
          data: myData,
          labelAccessorFn: (Task row,_) => '${row.taskvalue}${'\n'}${row.task}'
      ),
    );*/

  }


  //List<charts.Series<Sales, int>> _seriesLineData;

  /*_generateData() {
   /* var data1 = [
      new Pollution(1980, 'USA', 30),
      new Pollution(1980, 'Asia', 40),
      new Pollution(1980, 'Europe', 10),
    ];
    var data2 = [
      new Pollution(1985, 'USA', 100),
      new Pollution(1980, 'Asia', 150),
      new Pollution(1985, 'Europe', 80),
    ];
    var data3 = [
      new Pollution(1985, 'USA', 200),
      new Pollution(1980, 'Asia', 300),
      new Pollution(1985, 'Europe', 180),
    ];
    */
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

   */

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(debugShowCheckedModeBanner: false,theme: ThemeData(
        primarySwatch: Colors.teal,
        backgroundColor: Colors.black,
      ),
        home:DefaultTabController(
          length: 2,
          child:
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              //),
              //body: _buildBody(context),
              // );
              //  );
              // }
              //backgroundColor: Color(0xff308e1c),
              bottom: TabBar(
                indicatorColor: Color(0xff9962D0),
                tabs: [
                  Tab(
                    icon: Icon(FontAwesomeIcons.solidChartBar),
                  ),
                    Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                  //  Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                ],
              ),
              title: Text('Saved Charts',
                style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              automaticallyImplyLeading: true,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                  Navigator.pop(context);
                },
                color: Colors.white,
              ),
            ),

            body: TabBarView(
              children: [
                _buildBody(context),
                _piebuildBody(context),

/*
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Placements Summary',style: TextStyle(fontFamily: 'Comfortaa',color:Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10.0,),
                          Expanded(
                            child: charts.PieChart(
                                _seriesPieData,
                                animate: true,
                                animationDuration: Duration(seconds: 5),
                                behaviors: [
                                  new charts.DatumLegend(
                                    outsideJustification: charts.OutsideJustification.endDrawArea,
                                    horizontalFirst: false,
                                    desiredMaxRows: 2,
                                    cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                    entryTextStyle: charts.TextStyleSpec(
                                        color: charts.MaterialPalette.purple.shadeDefault,
                                        fontFamily: 'Comfortaa',
                                        fontSize: 11),
                                  )
                                ],
                                defaultRenderer: new charts.ArcRendererConfig(
                                    arcWidth: 100,
                                    arcRendererDecorators: [
                                      new charts.ArcLabelDecorator(
                                          labelPosition: charts.ArcLabelPosition.inside)
                                    ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Sales for the first 5 years',style: TextStyle(fontFamily: 'Comfortaa',color:Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),
                          Expanded(
                            child: charts.LineChart(
                                _seriesLineData,
                                defaultRenderer: new charts.LineRendererConfig(
                                    includeArea: true, stacked: true),
                                animate: true,
                                animationDuration:                                   new charts.ChartTitle('Years',
Duration(seconds: 5),
                                behaviors: [
                                      behaviorPosition: charts.BehaviorPosition.bottom,
                                      titleOutsideJustification:charts.OutsideJustification.middleDrawArea),
                                  new charts.ChartTitle('Sales',
                                      behaviorPosition: charts.BehaviorPosition.start,
                                      titleOutsideJustification: charts.OutsideJustification.middleDrawArea),
                                  new charts.ChartTitle('Departments',
                                    behaviorPosition: charts.BehaviorPosition.end,
                                    titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                                  )
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                */
              ],
            ),
          ),
        ),
      );
    // );
  }


  Widget _buildBody(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('task').snapshots(),
      builder: (context, snapshot){

        if(!snapshot.hasData){
          return LinearProgressIndicator();
        }
        else{
          List<Task> task=snapshot.data.documents
              .map((documentSnapshot) => Task.fromMap(documentSnapshot.data))
              .toList();
          print("reyyyyy");
          debugPrint(snapshot.data.documents.toString());
          debugPrint("areyyyy");
          //Firestore.instance.collection("task").document('CMRTC').updateData({'taskvalue':250});
          /* CollectionReference reference = Firestore.instance.collection('task');
          reference.snapshots().listen((querySnapshot) {
            querySnapshot.documentChanges.forEach((change) {
              print("22");
            });
          });*/
          return _buildChart(context, task);
        }

      },
    );

  }
  Widget _buildChart(BuildContext context, List<Task> task)
  {
    myData=task;
    _generateData(myData);
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Placements Summary',style: TextStyle(fontFamily: 'Comfortaa',color:Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),
              SizedBox(height:10.0,),
              Expanded(
                child: charts.BarChart(
                  _seriesData,
                  animate: true,
                  animationDuration: Duration(seconds: 3),
                  defaultInteractions: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  Widget _piebuildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('task').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Task> task = snapshot.data.documents
              .map((documentSnapshot) => Task.fromMap(documentSnapshot.data))
              .toList();
          return _piebuildChart(context, task);
        }
      },
    );
  }
  Widget _piebuildChart(BuildContext context, List<Task> taskdata) {
    myData=taskdata;
    _generateData(myData);
    return Padding(
      padding: EdgeInsets.all(0.0),
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Placements Summary',style: TextStyle(fontFamily: 'Comfortaa',color:Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 3),
                    behaviors: [
                      new charts.DatumLegend(
                        outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding:
                        new EdgeInsets.only(right: 4.0, bottom: 4.0, top: 4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 18),
                      )
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}