import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stackapp/models/list_model.dart';
import 'package:stackapp/screens/detail_page.dart';

class SearchScreen extends StatefulWidget {
  final List<HomeModel> searchDetail;
  SearchScreen({this.searchDetail});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SearchDelegate<String> {
  final _inpuController = new TextEditingController();
  FocusNode _focus = new FocusNode();
  String inputValue;
  bool hasFocus;

  @override
    void initState() {
      super.initState();
      _focus.addListener(_onChange);
      _inpuController.addListener(_onChange);
    }

  void _onChange() {
    setState(() {
          inputValue = _inpuController.text.toLowerCase();
    hasFocus = _focus.hasFocus;
        });

    // print(inputValue);
    // print(hasFocus);
  }

  @override
    void dispose() {
      _inpuController.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          color: Color(0xFF262432),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.search, color: Colors.grey[600],),
                  title: TextFormField(
                    controller: _inpuController,
                    focusNode: _focus,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey[600], fontSize: 20.0),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: buildSuggestions(context),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    print(inputValue);
    query = inputValue;
    final suggestion = query.isEmpty ? widget.searchDetail : widget.searchDetail.where((c) => c.title.toLowerCase().startsWith(query)).toList();

    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DetailPage(detail: suggestion[index],))
            );
          },
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(suggestion[index].thumbnail, fit: BoxFit.fill, color: Colors.black87, colorBlendMode: BlendMode.darken,),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.only(top: 16.0),
                        width: 150.0,
                        height: 150.0,
                        child: Image.asset(suggestion[index].thumbnail, fit: BoxFit.fill,),
                      ),
                      title: Text(suggestion[index].title, style: TextStyle(color: Colors.white, fontSize: 20.0)),
                      subtitle: Text(suggestion[index].description, style: TextStyle(color: Colors.white, fontSize: 14.0)),
                    ),
                  ]
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(height: 1.0,),
      itemCount: suggestion.length,
    );
  }
}