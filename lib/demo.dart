import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart' as http;
import 'package:dio/dio.dart';

class Demo extends StatefulWidget {
  Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String _response = 'no data yet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAS_NS21 HTTP DEMO'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                httpRequest();
              },
              child: Text('Get HTTP request'),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(_response),
            ),
          ),
        ],
      ),
    );
  }

  void httpRequest() async {
    try {
      //use http.get
      var response = await Dio().get('http://192.168.4.1/Cps');

      //print(response);
      _response = response.data.toString();
      print(response.statusCode);
    } catch (e) {
      _response = 'Error Occured';
    } finally {
      setState(() {
        //Rebuild the widget
      });
    }
  }
}
