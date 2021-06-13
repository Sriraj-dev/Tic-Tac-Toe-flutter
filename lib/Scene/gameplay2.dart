import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Scene/gamebutton.dart';

class Game2 extends StatefulWidget {
  const Game2({Key? key}) : super(key: key);

  @override
  _Game2State createState() => _Game2State();
}

class _Game2State extends State<Game2> {
  int count = 0;
  dynamic data = {};
  int flag = 0;
  bool isplaying = false;
  late String myimg;
  late String autoimg;
  String turn = 'Loading...';
  String autokey = 'A';
  int trigger = 0;

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

  bool rowdone() {
    for (int i = 0; i < 7; i += 3) {
      if (buttons[i].letter == buttons[i + 1].letter &&
          buttons[i + 1].letter == buttons[i + 2].letter &&
          buttons[i].letter != 'A') {
        if (buttons[i].letter == autokey) {
          trigger = 1;
        } else {
          trigger = 2;
        }
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
        if (buttons[i].letter == autokey) {
          trigger = 1;
        } else {
          trigger = 2;
        }
        return true;
      }
    }
    return false;
  }

  bool diagonaldone() {
    if (buttons[0].letter == buttons[4].letter &&
        buttons[4].letter == buttons[8].letter &&
        buttons[0].letter != 'A') {
      if (buttons[0].letter == autokey) {
        trigger = 1;
      } else {
        trigger = 2;
      }
      return true;
    } else if (buttons[2].letter == buttons[4].letter &&
        buttons[4].letter == buttons[6].letter &&
        buttons[2].letter != 'A') {
      if (buttons[2].letter == autokey) {
        trigger = 1;
      } else {
        trigger = 2;
      }
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

  void initiatefirstplayer() {
    if (data['startwith'] == 'player') {
      isplaying = true;

      turn = '${data['player']} Turn';

      if (data['playerkey'] == 'X') {
        autokey = 'O';
        myimg = 'images/X.jpg';
        autoimg = 'images/O.jpg';
      } else {
        autokey = 'X';
        myimg = 'images/O.jpg';
        autoimg = 'images/X.jpg';
      }
    } else if (data['startwith'] == 'AI') {
      isplaying = false;

      turn = 'Waiting for the Computer move';

      if (data['playerkey'] == 'X') {
        autokey = 'O';
        myimg = 'images/X.jpg';
        autoimg = 'images/O.jpg';
      } else {
        autokey = 'X';
        myimg = 'images/O.jpg';
        autoimg = 'images/X.jpg';
      }
    } else {
      random();
    }
  }

  void random() {
    Random random = new Random();
    int r = random.nextInt(2);

    if (r == 0) {
      isplaying = true;

      turn = '${data['player']} Turn';

      if (data['playerkey'] == 'X') {
        autokey = 'O';
        myimg = 'images/X.jpg';
        autoimg = 'images/O.jpg';
      } else {
        autokey = 'X';
        myimg = 'images/O.jpg';
        autoimg = 'images/X.jpg';
      }
    } else if (r == 1) {
      isplaying = false;

      turn = 'Waiting for the Computer move';

      if (data['playerkey'] == 'X') {
        autokey = 'O';
        myimg = 'images/X.jpg';
        autoimg = 'images/O.jpg';
      } else {
        autokey = 'X';
        myimg = 'images/O.jpg';
        autoimg = 'images/X.jpg';
      }
    }
  }

  void performstep() {
    int r = aistep();
    print('R is $r');
    buttons[r].letter = autokey;
    buttons[r].img = autoimg;
    buttons[r].disabled = true;
    print('button - $r is disabled');
    count += 1;
    isplaying = true;
    turn = '${data['player']} Turn';
    // do {
    //   Random random = new Random();
    //   int r = random.nextInt(9);
    //   if (buttons[r].letter == 'A') {
    //     buttons[r].letter = autokey;
    //     buttons[r].img = autoimg;
    //     buttons[r].disabled = true;
    //     print('button - $r is disabled');
    //     count += 1;
    //     isplaying = true;
    //     turn = '${data['player']} Turn';
    //   }
    // } while (!isplaying);
  }

  int aistep() {
    int num1 = 0;
    int num2 = 0;
    int pos = -1;

    //Row;
    for (int i = 0; i < 7; i += 3) {
      for (int j = 0; j < 3; j++) {
        if (buttons[i + j].letter == autokey) {
          num1 += 1;
        } else if (buttons[i + j].letter == data['playerkey']) {
          num2 += 1;
        } else {
          pos = i + j;
        }
      }
      if (num1 == 2 || num2 == 2) {
        if (pos != -1) {
          if (buttons[pos].letter == 'A') return pos;
        }
      }
      num1 = 0;
      num2 = 0;
      pos = -1;
    }

    //Coloumn
    num1 = 0;
    num2 = 0;
    pos = -1;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 7; j += 3) {
        if (buttons[i + j].letter == autokey) {
          num1 += 1;
        } else if (buttons[i + j].letter == data['playerkey']) {
          num2 += 1;
        } else {
          pos = i + j;
        }
      }
      if (num1 == 2 || num2 == 2) {
        if (pos != -1) {
          if (buttons[pos].letter == 'A') return pos;
        }
      }
      num1 = 0;
      num2 = 0;
      pos = -1;
    }

    //Diagonal
    num1 = 0;
    num2 = 0;
    pos = -1;
    for (int j = 0; j < 9; j += 4) {
      if (buttons[j].letter == autokey) {
        num1 += 1;
      } else if (buttons[j].letter == data['playerkey']) {
        num2 += 1;
      } else {
        pos = j;
      }
    }
    if (num1 == 2 || num2 == 2) {
      if (pos != -1) {
        if (buttons[pos].letter == 'A') return pos;
      }
    }
    num1 = 0;
    num2 = 0;
    pos = -1;

    for (int j = 2; j < 7; j += 2) {
      if (buttons[j].letter == autokey) {
        num1 += 1;
      } else if (buttons[j].letter == data['playerkey']) {
        num2 += 1;
      } else {
        pos = j;
      }
    }
    if (num1 == 2 || num2 == 2) {
      if (pos != -1) {
        if (buttons[pos].letter == 'A') return pos;
      }
    }
    num1 = 0;
    num2 = 0;
    pos = -1;

    if (buttons[4].letter == 'A') {
      return 4;
    }
    print('${buttons[0].letter} is 0th button');
    if (buttons[0].letter == 'A') {
      return 0;
    }
    if (buttons[2].letter == 'A') {
      return 2;
    }
    if (buttons[6].letter == 'A') {
      return 6;
    }
    if (buttons[8].letter == 'A') {
      return 8;
    }

    if (buttons[1].letter == 'A') {
      return 1;
    }
    if (buttons[3].letter == 'A') {
      return 3;
    }
    if (buttons[5].letter == 'A') {
      return 5;
    }
    if (buttons[7].letter == 'A') {
      return 7;
    }

    return -1;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments;

    if (flag == 0) {
      flag = 1;
      initiatefirstplayer();
      if (!isplaying) {
        performstep();
      }
    }

    return Scaffold(
      //floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        backgroundColor: Colors.amberAccent,
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: Colors.black,
      //ends;

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
                        print(isplaying);
                        if (isplaying) {
                          count += 1;
                          isplaying = false;
                          turn = 'Waiting for the Computer move';
                          buttons[i].img = myimg;
                          buttons[i].letter = data['playerkey'];
                          buttons[i].disabled = true;
                          print('button - $i is disabled');
                          print('count 1 - $count');
                          if (count < 9) performstep();
                          print('count 2 - $count');
                        }

                        //checking for win or lose;
                        if (check() == true) {
                          // p1 == 0 ? print('P1 Won the game') : print('P2 Won the game');
                          Navigator.pushReplacementNamed(context, '/result',
                              arguments: {
                                'won': (trigger == 1)
                                    ? 'Computer won'
                                    : '${data['player']} won the game',
                                'Moves': count,
                              });
                        }
                        if (check() == false && count == 9) {
                          Navigator.pushReplacementNamed(context, '/result',
                              arguments: {
                                'won': 'Its a Tie Game',
                                'Moves': count,
                              });
                        }
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
