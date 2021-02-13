import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Routing Navigation',
    initialRoute: '/',
    routes: {
      '/' : (context) => HalamanPertama(),
      HalamanKedua.routeName : (context) => HalamanKedua(),      
    },
  ));
}
class HalamanPertama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Weather (List View)')
        ),
      body:
       Center(        
        child: ListView(
          children: <Widget>[
        ListTile(
          leading:Icon(Icons.landscape),
          title: Text("Weather Forecast"),
          subtitle: Text("Latest Weather!"),
          trailing: Icon(Icons.wb_sunny),
          onTap: (){
             Navigator.pushNamed(context, HalamanKedua.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.traffic),
          title: Text("Traffic"),
          subtitle: Text("The Latest Traffic!"),
          trailing: Icon(Icons.my_location_sharp),
          onTap: (){
             debugPrint("On Process");
          },
          ) 
          ]
         ),
        ),
    );
  }
}
class HalamanKedua extends StatelessWidget{
  static const String routeName = "/halamanKedua";
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather (Long Scroll View)')
      ),
      body: getListView(),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Working");
        },
        child: Icon(Icons.add),
        tooltip: "Add One More Item",
      ),
    );
  }
}
void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint("Undo Operation");
      },
    ),
    );
 
  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(101, (counter) => "Weather City $counter");
  return items;
}
 
Widget getListView() {
  var listItems = getListElements();
 
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
         showSnackBar(context, listItems[index]);
      },
    );
  });
 
  return listView;
}

