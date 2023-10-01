import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import 'modules/ruteador/ui/pages/page_route_home.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

GlobalKey<NavigatorState>  navigatorKey = new GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteador Quito',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ruteador Quito'),
    routes: <String, WidgetBuilder>{
    PageRouteHome.routePage: (BuildContext context) => PageRouteHome(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              //Navigator.of(context).pushNamed(PageRouteHome.routePage, arguments: {"cameraPosition": cameraPosition});
              Navigator.of(context).pushNamed(PageRouteHome.routePage);
            }, child: Text("Ir a Ruteador Quito"))
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

