import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  bool xvalue = true;
  bool ovalue = false;
  bool rvalue = false;
  late String startwith;
  TextEditingController player1 = new TextEditingController();
  TextEditingController player2 = new TextEditingController();
  late String p1name, p2name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
            child: Text(
              'Tic-Tac-Toe',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.amberAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              '(1 Vs 1)',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: Colors.amberAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: SafeArea(
                child: TextField(
              controller: player1,
              decoration: InputDecoration(
                labelText: "Player Name (X) : ",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: UnderlineInputBorder(),
                fillColor: Colors.grey,
                focusColor: Colors.amberAccent,
                filled: true,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: SafeArea(
                child: TextField(
              controller: player2,
              decoration: InputDecoration(
                labelText: "Player Name (O) : ",
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: UnderlineInputBorder(),
                fillColor: Colors.grey,
                focusColor: Colors.amberAccent,
                filled: true,
              ),
            )),
          ),
          Text('Who wants to start the game :'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  checkColor: Colors.amberAccent,
                  value: xvalue,
                  onChanged: (check) {
                    setState(() {
                      //xvalue = value;
                      xvalue = (xvalue) ? false : true;
                      if (xvalue) {
                        rvalue = false;
                        ovalue = false;
                      }
                      // else {
                      //   ovalue = true;
                      // }
                    });
                  }),
              Text('X',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              SizedBox(width: 30),
              Checkbox(
                  checkColor: Colors.amberAccent,
                  value: ovalue,
                  onChanged: (check) {
                    setState(() {
                      //xvalue = value;
                      ovalue = (ovalue) ? false : true;
                      if (ovalue) {
                        xvalue = false;
                        rvalue = false;
                      }

                      // else
                      //   xvalue = true;
                    });
                  }),
              Text('O',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              SizedBox(width: 30),
              Checkbox(
                  checkColor: Colors.amberAccent,
                  value: rvalue,
                  onChanged: (check) {
                    setState(() {
                      //xvalue = value;
                      rvalue = (rvalue) ? false : true;
                      if (rvalue) {
                        xvalue = false;
                        ovalue = false;
                      }
                      // else
                      //   xvalue = true;
                    });
                  }),
              Text('Random',
                  style: TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
                onPressed: () {
                  p1name = player1.text;
                  p2name = player2.text;
                  if (xvalue) {
                    startwith = 'X';
                  } else if (ovalue) {
                    startwith = 'O';
                  } else
                    startwith = 'R';
                  print(player1.text);
                  Navigator.pushReplacementNamed(context, '/Game', arguments: {
                    'startwith': startwith,
                    'p1name': player1.text,
                    'p2name': player2.text,
                  });
                },
                icon: Icon(Icons.play_arrow_rounded),
                label: Text('Play!')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          backgroundColor: Colors.amberAccent,
          child: Icon(Icons.home)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
