import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiThreePage extends StatefulWidget {
    @override 
    ApiThreeState createState() => ApiThreeState();
}

class ApiThreeState extends State<ApiThreePage> {
  final String url = "https://videogamesapi.herokuapp.com/api/platforms/";
  List data;


  Future<String> getWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

        setState(() {
          var resBody = json.decode(res.body);
          data = resBody["results"];
        });


        return "Success";
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VideoJuegos"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Text("Name: "),
                          Text(
                            data[index]["name"],
                            style: TextStyle(
                              fontSize: 13.8, color: Colors.deepOrangeAccent
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Text("Developer: "),
                          Text(
                            data[index]["developer"],
                            style: TextStyle(
                              fontSize: 13.8, color: Colors.deepPurpleAccent
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Text("Generation: "),
                          Text(
                            data[index]["generation"],
                            style: TextStyle(
                              fontSize: 13.8, color: Colors.blueAccent
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Text("Media: "),
                          Text(
                            data[index]["media"],
                            style: TextStyle(
                              fontSize: 13.8, color: Colors.green
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Text("Cpu: "),
                          Text(
                            data[index]["cpu"],
                            style: TextStyle(
                              fontSize: 12.0, color: Colors.teal
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: <Widget>[
                          Text("Date: "),
                          Text(
                            data[index]["release_date"],
                            style: TextStyle(
                              fontSize: 13.8, color: Colors.redAccent
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.lightBlueAccent,
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );    
  }
  @override
  void initState() { 
    super.initState();
    this.getWData();
  }
}