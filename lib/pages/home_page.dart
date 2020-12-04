import 'package:devsteam/models/NewsInfo.dart';
import 'package:devsteam/services/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> _welcome;

  @override
  void initState() {
    _welcome = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: FutureBuilder<Welcome>(
          future: _welcome,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  color: Colors.red,
                );
              });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
