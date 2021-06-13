import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 100, 0, 0),
          child: Row(
            children: [
              //RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.person), label: Text('1 Vs 1') )
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/select');
                },
                icon: Icon(Icons.person),
                label: Text('1 Vs 1'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    )),
              ),

              SizedBox(width: 20.0),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/select2');
                },
                icon: Icon(Icons.computer_rounded),
                label: Text('1 Vs AI'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue,
                    )),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/image6.jpg'),
        fit: BoxFit.cover,
      )),
    ));
  }
}
