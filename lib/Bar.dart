import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Bar extends StatefulWidget {
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var data=[
      Sales("Sun",50,Colors.red),
      Sales("Mon",70,Colors.green),
      Sales("Tue",100,Colors.yellow),
      Sales("Wed",50,Colors.pink),
      Sales("Thu",50,Colors.purple),
      Sales("Fri",140,Colors.brown),
      Sales("Sat",300,Colors.orange),
    ];


    var series=[
      charts.Series(
        domainFn:(Sales sales,_)=>sales.day,
        measureFn: (Sales sales,_)=>sales.sold,
        colorFn: (Sales sales,_)=>sales.color,
        id:'Sales',
        data: data,
        labelAccessorFn: (Sales sales,_)=>'${sales.day}:${sales.sold.toString()}',

      )
    ];


    var chart = charts.BarChart(
      series,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );
    
    return Container(
      child: Column(
        children: <Widget>[
          Text("Contract Sales Analysis",style: TextStyle(fontSize: 30.0),),
          SizedBox(height: 400,child: chart)
        ],
      ),
    );
  }
}

class Sales{
  final String day;
  final int sold;
  final charts.Color color;

  Sales(this.day,this.sold,Color color)
  :this.color=charts.Color(r: color.red,g: color.green,b: color.blue,a: color.alpha);

}