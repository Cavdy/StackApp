import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stackapp/models/list_model.dart';
import 'package:stackapp/screens/detail_page.dart';

class HomeScreen extends StatefulWidget {
  final List<HomeModel> listData;
  HomeScreen({this.listData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Image.asset("images/bg.png", fit: BoxFit.cover,),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Discover", style: TextStyle(fontSize: 24.0, color: Colors.white,)),
                      Text("Resturant", style: TextStyle(fontSize: 24.0, color: Colors.white,))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailPage(detail: widget.listData[index],)
                              )
                            );
                          },
                          child: Stack(
                            children: _showLayout(context, index),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(height: 1.0,),
                      itemCount: widget.listData.length,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _showLayout(BuildContext context, int index) {
    return [  
      Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(widget.listData[index].thumbnail, fit: BoxFit.cover, color: Colors.black54, colorBlendMode: BlendMode.darken,),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[400],
                child: Icon(FontAwesomeIcons.shoppingCart, color: Colors.grey[700], size: 16.0,),
              ),
              title: Text(
                widget.listData[index].title, style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              subtitle: Text(widget.listData[index].description.substring(0, 30), style: TextStyle(fontSize: 14.0, color: Colors.white)),
              trailing: CircleAvatar(
                maxRadius: 16.0,
                backgroundColor: Colors.blueAccent,
                child: Icon(FontAwesomeIcons.shoppingCart, size: 12.0, color: Colors.grey[700],),
              ),
            )
          ],
        ),
      )
    ];
  }
}