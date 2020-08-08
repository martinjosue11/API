import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiSixPage extends StatefulWidget {
  @override
  ApiSixState createState() => ApiSixState();
}

class ApiSixState extends State<ApiSixPage> {
  final String url = "https://api.rawg.io/api/platforms";
  List data;

  Future<String> getWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "Application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["results"];
    });

    return "Success!";
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
        itemBuilder: (BuildContext context, int index) {
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
                              fontSize: 13.8, color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: <Widget>[
                        Text("Slug: "),
                        Text(
                          data[index]["slug"],
                          style: TextStyle(
                              fontSize: 13.8, color: Colors.deepOrangeAccent),
                        ),
                      ],
                    ),
                  ),
                ),
                 Card(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        FadeInImage(
                          image: NetworkImage(data[index]['image_background']),
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          fadeInDuration: Duration(milliseconds: 200),
                          height: 250.0,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Imagen del video juego'),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular((25.0)),
                              color: Colors.cyan[50],
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(2.0, 10.0)
                                ),   
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          );
        },
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
