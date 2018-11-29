import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stackapp/models/list_model.dart';

class DetailPage extends StatefulWidget {
  final HomeModel detail;
  DetailPage({this.detail});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Image.asset(
                    widget.detail.thumbnail
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xFF262432),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                    width: MediaQuery.of(context).size.width,
                    height: 500.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        color: Color(0xFF373447),
                      ),
                    ),
                  ), 
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(widget.detail.title, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                              trailing: CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                maxRadius: 24.0,
                                child: Icon(FontAwesomeIcons.shoppingCart, size: 12.0, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(widget.detail.description, style: TextStyle(fontSize: 16.0, color: Color(0xFF5c596a))),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  _iconText(FontAwesomeIcons.clock, Colors.blue, "Hey"),
                                  _iconText(FontAwesomeIcons.map, Colors.greenAccent, "Hey"),
                                  _iconText(FontAwesomeIcons.phone, Colors.deepOrangeAccent, "Hey"),
                                  _iconText(FontAwesomeIcons.shoppingBag, Colors.redAccent, "Hey"),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _iconText(IconData icon, Color color, String text) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          maxRadius: 24.0,
          backgroundColor: Color(0xFF4b485b),
          child: Icon(
            icon,
            size: 16.0,
            color: color,
          ),
        ),
        Text(text, style: TextStyle(color: Color(0xFF454456), fontSize: 16.0), )
      ],
    );
  }
}