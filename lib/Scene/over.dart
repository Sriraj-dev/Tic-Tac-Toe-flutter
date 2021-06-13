import 'package:flutter/material.dart';

class Over extends StatefulWidget {
  const Over({Key? key}) : super(key: key);

  @override
  _OverState createState() => _OverState();
}

class _OverState extends State<Over> {
  dynamic data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;
    //print(data['Moves']);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Over.jpg'), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            Text('${data['won']}',
                //'P2 won the game',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )),
            Text('No.of Moves - ${data['Moves']}',
                //'No.of Moves - 6',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
