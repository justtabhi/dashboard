import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Pie extends StatefulWidget {
  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie> {
  
      
   
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


    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [charts.ArcLabelDecorator()],
        arcWidth: 100,
      ),
      animate: true,
    );
    
    return Container(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(12.0),),
          Text("Contract Sales Analysis",style: TextStyle(fontSize: 30.0),),
          
          SizedBox(height: 330,child: chart)
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