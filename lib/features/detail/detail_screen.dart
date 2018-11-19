import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Charater name"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              "Character name", 
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), 
                              maxLines: 2,
                            ),
                          ),
                          Text (
                            "Character description",
                            style: TextStyle(fontSize: 15.0),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Links',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Detalles', 
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text(
                      'Wiki', 
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RaisedButton(
                    onPressed: null,
                    child: Text(
                      'Comics', 
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Recursos',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        labelColor: Colors.red[900],
                        labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(text: '2 Comics'),
                          Tab(text: '3 Eventos'),
                        ]
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            buildTabBarView(),
                            buildTabBarView(),
                          ]
                        ),
                      ),
                    ],
                  )
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

  ListView buildTabBarView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: ListTile(
                onTap: null,
                leading: Icon(Icons.ac_unit),
                title: Text(
                  "Title",
                  style: TextStyle(fontSize: 20.0,),
                  maxLines: 1,
                ),
                subtitle: Text(
                  "Comic description",
                  style: TextStyle(fontSize: 15.0),
                  maxLines: 3,
                ),
              ),
            ),
            Divider(height: 2.0,),
          ],
        );
      }
    );
  }
}