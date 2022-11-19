
import 'package:flutter/material.dart';

class sun extends StatefulWidget {
  const sun({Key? key}) : super(key: key);

  @override
  State<sun> createState() => _sunState();
}

class _sunState extends State<sun> {
  String s1 = "X";
  String s2 = "O";
  String r = "Re-set";
  String U = "Undo",R="Redo";
  String n = "plz start the game..";
  List<String>     l = List.filled(9, "");
  List<String> u_v_list = [];
  List<int> u_p_list = [];
  List<String> r_v_list = [];
  List<int> r_p_list = [];

  List<Color> c = List.filled(9, Colors.white70);
  int i = 0, cnt = 0;
  bool winner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "tick_tack",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(3),
              alignment: Alignment.center,
              child: Text(
                n,
                style: TextStyle(fontSize: 35, color: Colors.deepOrange),
              ),
            ),
            //**************//
            Expanded(
              child: Row(
                children: [
                  con(0, Colors.deepPurple),
                  con(1, Colors.amberAccent),
                  con(2, Colors.deepPurple),
                ],
              ),
            ),
            /////////////////////////////
            Expanded(
              child: Row(
                children: [
                  con(3, Colors.amberAccent),
                  con(4, Colors.deepPurple),
                  con(5, Colors.amberAccent),
                ],
              ),
            ),
            /////////////////////////////
            Expanded(
              child: Row(
                children: [
                  con(6, Colors.deepPurple),
                  con(7, Colors.amberAccent),
                  con(8, Colors.deepPurple),
                ],
              ),
            ),
            //********button****//
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          if (u_p_list.length > 0) {
                            int lastpos = u_p_list.last;
                            String lastval = u_v_list.last;

                            l[lastpos] = "";
                            cnt--;
                            u_p_list.removeLast();
                            u_v_list.removeLast();

                            r_v_list.add(lastval);
                            r_p_list.add(lastpos);

                            setState(() {});
                          } else {
                            print("Not Possible...");
                          }
                        },
                        child: Text(
                          "$U",
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          game();
                        },
                        child: Text(
                          "$r",
                          style: TextStyle(fontSize: 26, color: Colors.black),
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(onPressed: () {
                            if(r_v_list.length>0)
                            {
                              int lastpos = r_p_list.last;
                              String lastval =r_v_list.last;

                              l[lastpos]=lastval;
                              cnt++;

                              r_p_list.removeLast();
                              r_v_list.removeLast();

                              u_p_list.add(lastpos);
                              u_v_list.add(lastval);

                              // print("${u_p_list}   ${u_v_list}" );
                              setState(() {});
                            }
                        },
                        child: Text(
                          "$R",
                          style: TextStyle(fontSize: 28, color: Colors.black),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  con(int i, Color c) {
    return Expanded(
      child: InkWell(
        onTap: (l[i] == "" && winner == false)
            ? () {
                if (cnt % 2 == 0) {
                  l[i] = s1;
                  u_v_list.add(s1);
                } else {
                  l[i] = s2;
                  u_v_list.add(s2);
                }
                u_p_list.add(i);
                cnt++;
                win();
                abc();
                setState(() {},);
              }
            : null,
        child: Container(
          decoration: ShapeDecoration(
              color:
                  l[i] == "" ? c : (l[i] == s1 ? Colors.grey : Color(0xffB90606)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    //   bottomLeft: Radius.circular(40),
                    //   topRight: Radius.circular(40),
                    topLeft:Radius.circular(30),
                  ),
                  side: BorderSide(width: 5,color: Colors.blue))),
          // color:l[i] == "" ? c : (l[i] == s1 ? Colors.redAccent : Colors.brown),
          height: double.infinity,
          margin: EdgeInsets.all(4),
          alignment: Alignment.center,
          child: Text(
            l[i],
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }

  game() {
    l = List.filled(9, "");
    cnt = 0;
    u_p_list.clear();
    u_v_list.clear();
    r_v_list.clear();
    r_p_list.clear();

    if (cnt == 0) {
      n = "plz start the game..";
    }
    setState(() {},);
    winner = false;
  }

  ////game running fun..
  abc() {
    if (cnt == 1) {
      n = "Game is running...";
    }
  }

  win() {
    //X condition
    if ((l[0] == s1 && l[1] == s1 && l[2] == s1) ||
        (l[3] == s1 && l[4] == s1 && l[5] == s1) ||
        (l[6] == s1 && l[7] == s1 && l[8] == s1) ||
        (l[0] == s1 && l[3] == s1 && l[6] == s1) ||
        (l[1] == s1 && l[4] == s1 && l[7] == s1) ||
        (l[2] == s1 && l[5] == s1 && l[8] == s1) ||
        (l[0] == s1 && l[4] == s1 && l[8] == s1) ||
        (l[2] == s1 && l[4] == s1 && l[6] == s1)) {
      n = "$s1 is Winner...";
      winner = true;

    } else if ((l[0] == s2 && l[1] == s2 && l[2] == s2) ||
        (l[3] == s2 && l[4] == s2 && l[5] == s2) ||
        (l[6] == s2 && l[7] == s2 && l[8] == s2) ||
        (l[0] == s2 && l[3] == s2 && l[6] == s2) ||
        (l[1] == s2 && l[4] == s2 && l[7] == s2) ||
        (l[2] == s2 && l[5] == s2 && l[8] == s2) ||
        (l[0] == s2 && l[4] == s2 && l[8] == s2) ||
        (l[2] == s2 && l[4] == s2 && l[6] == s2)) {
      n = "$s2  is Winner...";
      col(0,1,2,3,4,5,6,7,8);

      winner = true;

    } else if (cnt > 8) {
      n = "Game is draw...";
    }
  }
  col(int a1,int a2,int a3,int a4,int a5,int a6,int a7,int a8,int a9)
  {
    c[a1]=Colors.cyanAccent;
    c[a2]=Colors.cyanAccent;
    c[a3]=Colors.cyanAccent;
    c[a4]=Colors.cyanAccent;
    c[a5]=Colors.cyanAccent;
    c[a6]=Colors.cyanAccent;
    c[a7]=Colors.cyanAccent;
    c[a8]=Colors.cyanAccent;
    c[a9]=Colors.cyanAccent;
  }
}
