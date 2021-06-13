import 'package:flutter/material.dart';

class Select2 extends StatefulWidget {
  const Select2({Key? key}) : super(key: key);

  @override
  _Select2State createState() => _Select2State();
}

class _Select2State extends State<Select2> {
  late String name;
  late String startwith;
  bool xvalue = true;
  bool ovalue = false;
  bool isplayer = true;
  bool isAI = false;
  bool israndom = false;
  TextEditingController player = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              '(1 Vs AI)',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: Colors.amberAccent,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SafeArea(
                child: TextField(
              controller: player,
              decoration: InputDecoration(
                labelText: "Player Name: ",
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
          Row(
            children: [
              Text('Choose : '),
              Checkbox(
                  value: xvalue,
                  onChanged: (value) {
                    setState(() {
                      xvalue = xvalue ? false : true;
                      if (xvalue)
                        ovalue = false;
                      else
                        ovalue = true;
                    });
                  }),
              Text('X'),
              SizedBox(width: 10),
              Checkbox(
                  value: ovalue,
                  onChanged: (value) {
                    setState(() {
                      ovalue = ovalue ? false : true;
                      if (ovalue)
                        xvalue = false;
                      else
                        xvalue = true;
                    });
                  }),
              Text('O'),
            ],
          ),
          SizedBox(height: 20),
          Text('Who will make the first move :'),
          Row(
            children: [
              Checkbox(
                  value: isplayer,
                  onChanged: (value) {
                    setState(() {
                      isplayer = isplayer ? false : true;
                      if (isplayer) {
                        israndom = false;
                        isAI = false;
                      }
                    });
                  }),
              Text('Player'),
              SizedBox(width: 10),
              Checkbox(
                  value: isAI,
                  onChanged: (value) {
                    setState(() {
                      isAI = isAI ? false : true;
                      if (isAI) {
                        israndom = false;
                        isplayer = false;
                      }
                    });
                  }),
              Text('Computer'),
              SizedBox(width: 10),
              Checkbox(
                  value: israndom,
                  onChanged: (value) {
                    setState(() {
                      israndom = israndom ? false : true;
                      if (israndom) {
                        isAI = false;
                        isplayer = false;
                      }
                    });
                  }),
              Text('Random'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
                onPressed: () {
                  name = player.text;
                  if (isplayer) {
                    startwith = 'player';
                  } else if (isAI) {
                    startwith = 'AI';
                  } else
                    startwith = 'R';

                  Navigator.pushReplacementNamed(context, '/Game2', arguments: {
                    'startwith': startwith,
                    'player': player.text,
                    'playerkey': xvalue ? 'X' : 'O',
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
