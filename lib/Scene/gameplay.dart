import 'package:flutter/material.dart';
import 'gamebutton.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Button> buttons = [
    Button(1, '', false, 'images/White.jpg', 'A'),
    Button(2, '', false, 'images/White.jpg', 'A'),
    Button(3, '', false, 'images/White.jpg', 'A'),
    Button(4, '', false, 'images/White.jpg', 'A'),
    Button(5, '', false, 'images/White.jpg', 'A'),
    Button(6, '', false, 'images/White.jpg', 'A'),
    Button(7, '', false, 'images/White.jpg', 'A'),
    Button(8, '', false, 'images/White.jpg', 'A'),
    Button(9, '', false, 'images/White.jpg', 'A'),
  ];

  int p1 = 0;
  int count = 0;
  int p2 = 0;
  String turn = 'Loading...';
  bool iswon = false;
  dynamic data = {};
  int flag = 0;

  void random() {
    Random random = new Random();
    int r = random.nextInt(2);

    print('random number is $r');
    if (r == 0) {
      p1 = 1;
      p2 = 0;
      turn = '${data['p1name']} Turn';
    } else if (r == 1) {
      p1 = 0;
      p2 = 1;
      turn = '${data['p2name']} Turn';
    }
    print('p1 is $p1 p2 is $p2');
  }

  @override
  void initState() {
    super.initState();
    flag = 0;
    iswon = false;
    for (int i = 0; i < buttons.length; i++) buttons[i].disabled = false;
  }

  bool rowdone() {
    for (int i = 0; i < 7; i += 3) {
      if (buttons[i].letter == buttons[i + 1].letter &&
          buttons[i + 1].letter == buttons[i + 2].letter &&
          buttons[i].letter != 'A') {
        return true;
      }
    }
    return false;
  }

  bool coloumndone() {
    for (int i = 0; i < 3; i++) {
      if (buttons[i].letter == buttons[i + 3].letter &&
          buttons[i + 3].letter == buttons[i + 6].letter &&
          buttons[i].letter != 'A') {
        return true;
      }
    }
    return false;
  }

  bool diagonaldone() {
    if (buttons[0].letter == buttons[4].letter &&
        buttons[4].letter == buttons[8].letter &&
        buttons[0].letter != 'A') {
      return true;
    } else if (buttons[2].letter == buttons[4].letter &&
        buttons[4].letter == buttons[6].letter &&
        buttons[2].letter != 'A') {
      return true;
    }

    return false;
  }

  bool check() {
    if (rowdone())
      return true;
    else if (coloumndone())
      return true;
    else if (diagonaldone())
      return true;
    else
      return false;
  }

  void setthefirstplayer() {
    if (data['startwith'] == 'X') {
      p1 = 1;
      p2 = 0;
      turn = '${data['p1name']} Turn';
    } else if (data['startwith'] == 'O') {
      p2 = 1;
      p1 = 0;
      turn = '${data['p2name']} Turn';
    } else {
      random();
    }
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;

    if (flag == 0) {
      flag = 1;
      setthefirstplayer();
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('${data['p1name']} Vs ${data['p2name']}'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      bottomSheet: Container(
        color: Colors.black,
        height: 150,
        width: 370.0,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(turn,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.amberAccent,
                )),
            SizedBox(height: 50),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 160, 0, 0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: buttons.length,
          itemBuilder: (context, i) => Container(
            height: 100.0,
            width: 100.0,
            //  margin: EdgeInsets.all(32),
            // color: Colors.amberAccent,
            // child: Text('${buttons[i].text}'),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('${buttons[i].img}'),
              fit: BoxFit.cover,
            )),

            child: ElevatedButton(
              onPressed: buttons[i].disabled
                  ? null
                  : () {
                      setState(() {
                        if (p1 == 1) {
                          print('changing to p1 image');
                          buttons[i].img = 'images/X.jpg';
                          buttons[i].letter = 'X';
                          p1 = 0;
                          p2 = 1;
                          turn = '${data['p2name']} Turn';
                        } else if (p2 == 1) {
                          print('changing to p2 image');
                          buttons[i].img = 'images/O.jpg';
                          buttons[i].letter = 'O';
                          p2 = 0;
                          p1 = 1;
                          turn = '${data['p1name']} Turn';
                        }
                        count += 1;
                        //checking for win or lose;
                        print(check());
                        if (check() == true) {
                          // p1 == 0 ? print('P1 Won the game') : print('P2 Won the game');
                          Navigator.pushReplacementNamed(context, '/result',
                              arguments: {
                                'won': p1 == 0
                                    ? '${data['p1name']} Won the game'
                                    : '${data['p2name']} Won the game',
                                'Moves': count,
                              });
                        }
                        if (check() == false && count == 9) {
                          Navigator.pushReplacementNamed(context, '/result',
                              arguments: {
                                'won': 'Its a Tie Game',
                                'Moves': count,
                              });

                          print('Its a Tie game');
                        }
                        buttons[i].disabled = true;
                      });
                    },
              child: null,
            ),
          ),
        ),
      ),
    );
  }
}
