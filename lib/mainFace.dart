import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class MainFace extends StatefulWidget {
  const MainFace({super.key});

  @override
  State<MainFace> createState() => _MainFaceState();
}

class _MainFaceState extends State<MainFace> {

  // Timer Functionality

  Timer? _countdown;
  DateTime? _endsAt;
  Duration timeRemaining = Duration.zero;
  bool timerRunning = false;

  void startCountdown(Duration duration){

    //This is to cancel an existing countdown
    _countdown?.cancel();

    //Set the target end time
    _endsAt = DateTime.now().add(duration);

    //Update state immediately for the UI to reflect it
    setState(() {
      timeRemaining = duration;
      timerRunning = true;
    });

    //Tick every second to compute the remaining time based on _endsAt
    _countdown = Timer.periodic(const Duration(seconds: 1), (_) {
      final endsAt = _endsAt;
      if (endsAt == null) return;

      final diff = endsAt.difference(DateTime.now());

      if (diff <= Duration.zero) {
        _countdown?.cancel();
        _countdown = null;

        setState(() {
          timeRemaining = Duration.zero;
          timerRunning = false;
        });

        return;
      }

      setState(() {
        timeRemaining = diff;
      });
    });
  }

  String formatHMMSS(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return hours > 0 ? '$hours:$minutes:$seconds' : '${d.inMinutes.toString().padLeft(2, '0')}:$seconds';
  }

  // Colors------------------------------------------------------------------------------------------------------------------------

  // Extras
  static const orange = Color(0xFF00FF00);
  static const blue = Color(0xFF00FF00);
  static const yellow = Color(0xFF00FF00);
  static const pink = Color(0xFF00FF00);
  static const brightBlue = Color.fromARGB(255, 0, 255, 0);
  static const green = Color(0xFF00FF00);
  // static const orange = Color(0xFFFF7276);
  // static const blue = Color(0xFF44A6FE);
  // static const yellow = Color(0xFFFDC47D);
  // static const pink = Color(0xFFFF7DC5);
  // static const brightBlue = Color.fromARGB(255, 68, 165, 255);
  // static const green = Color(0xFFACFFEB);

  // Backgrounds
  // static const bg = Color(0xFF30334A);
  static const bg = Color(0xFF000000);

  //Objectives---------------------------------------------------------------------------------------------------------------------

  // Progress Bar
  double x = 0;

  // Main Objectives
  bool dsa = false;
  bool iitm = false;
  bool college = false;
  bool appDev = false;

  // Side Objectives
  bool exercise = false;
  bool meditation = false;
  bool writing = false;
  bool reading = false;

  // Timers------------------------------------------------------------------------------------------------------------------------
  bool thirty = false;
  bool fourtyFive = false;
  bool hour = false;
  

  // Clock values
  DateTime now = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Tick every second, but rebuild only when the minute changes.
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final current = DateTime.now();
      if (current.minute != now.minute) {
        setState(() {
          now = current;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 460,
        width: 310,
        color: bg,
        child: Row(
          children: [
            Container(width: 5, height: 460,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Container(width: 290, child: Center(child: Text(">_system online", style: TextStyle(color: green, height: 0.85),))),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 320 - 26,
                    decoration: BoxDecoration(border: Border.all(color: orange, width: 0.5), 
                      //color: orange.withOpacity(0.04)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('hh:mm').format(now),
                          style: TextStyle(
                            height: 1.1,
                            fontSize: 90,
                            color: orange
                          ),
                        ),
                        Text(
                          DateFormat('-DD/MM/yyyy-').format(now),
                          style: TextStyle(
                            color: orange.withOpacity(0.65),
                            fontSize: 25,
                            height: 0.9
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 285,
                      width: 142,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(color: pink, width: 0.5),
                        //color: pink.withOpacity(0.04)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text("-Tasks-", style: TextStyle(color: pink, fontSize: 18), textAlign: TextAlign.center,),
                          ),
                          Divider(color: pink, thickness: 0.5, height: 5,),
                          //Main Objectives
                          Text("------MAIN------", style: TextStyle(color: blue, fontSize: 14), textAlign: TextAlign.center,),
                          Container(
                            color: dsa ? blue : Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("DSA", style: TextStyle(color: dsa ? bg: blue, fontSize: 14), textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.square_outlined, color: dsa ? Colors.transparent : blue,),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  dsa = !dsa;
                                  dsa ? x += 1 : x -= 1;
                                });
                              },
                            ),
                          ),
                          Container(
                            color: iitm ? blue : Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("IITM", style: TextStyle(color: iitm ? bg: blue, fontSize: 14), textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.square_outlined, color: iitm ? Colors.transparent : blue,),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  iitm = !iitm;
                                  iitm ? x += 1 : x -= 1;
                                });
                              },
                            ),
                          ),
                          Container(
                            color: college ? blue : Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("College", style: TextStyle(color: college ? bg: blue, fontSize: 14), textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.square_outlined, color: college ? Colors.transparent : blue,),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  college = !college;
                                  college ? x += 1 : x -= 1;
                                });
                              },
                            ),
                          ),
                          Container(
                            color: appDev ? blue : Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("App-Dev.", style: TextStyle(color: appDev ? bg: blue, fontSize: 14), textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.square_outlined, color: appDev ? Colors.transparent : blue,),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  appDev = !appDev;
                                  appDev ? x += 1 : x -= 1;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 4,),
                          Text("------SIDE------", style: TextStyle(color: yellow, fontSize: 14), textAlign: TextAlign.center,),
                          Container(
                            color: exercise ? yellow : Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Exercise", style: TextStyle(color: exercise ? bg: yellow, fontSize: 14), textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.square_outlined, color: exercise ? Colors.transparent : yellow,),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  exercise = !exercise;
                                  exercise ? x += 1 : x -= 1;
                                });
                              },
                            ),
                          ),
                          Container(
                            color: meditation ? yellow : Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Meditation", style: TextStyle(color: meditation ? bg: yellow, fontSize: 14), textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.square_outlined, color: meditation ? Colors.transparent : yellow,),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  meditation = !meditation;
                                  meditation ? x += 1 : x -= 1;
                                });
                              },
                            ),
                          ),
                          Container(
                            color: writing ? yellow : Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Writing", style: TextStyle(color: writing ? bg: yellow, fontSize: 14), textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.square_outlined, color: writing ? Colors.transparent : yellow,),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  writing = !writing;
                                  writing ? x += 1 : x -= 1;
                                });
                              },
                            ),
                          ),
                          Container(
                            color: reading ? yellow : Colors.transparent,
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Reading", style: TextStyle(color: reading ? bg: yellow, fontSize: 14), textAlign: TextAlign.center,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Icon(Icons.square_outlined, color: reading ? Colors.transparent : yellow,),
                                  )
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  reading = !reading;
                                  reading ? x += 1 : x -= 1;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Container(
                          height: 102,
                          width: 142,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(00),
                            border: Border.all(color: blue, width: 0.5),
                            //color: blue.withOpacity(0.075)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Column(
                              children: [
                                Text("-Prog.-", style: TextStyle(color: brightBlue, fontSize: 18), textAlign: TextAlign.center,),
                                Divider(color: blue, thickness: 0.5, height: 5),
                                SizedBox(height: 1,),
                                Text("Progress : ${x.toInt()}/8", style: TextStyle(color: brightBlue, fontSize: 13), textAlign: TextAlign.start,),
                                Text("Percent : ${(x/8)*100}%", style: TextStyle(color: brightBlue, fontSize: 13), textAlign: TextAlign.start,),
                                SizedBox(height: 3,),
                  
                                //main container with progress bar
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(height: 16, width: ((16) * x), color: brightBlue,),
                                    Container(height: 16, width: ((16)* (8 - x)), color: blue.withOpacity(0.25),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 173,
                          width: 142,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(00),
                            border: Border.all(color: green, width: 0.5),
                            //color: green.withOpacity(0.04)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Column(
                              children: [
                                Text("-Timers-", style: TextStyle(color: green, fontSize: 18), textAlign: TextAlign.center,),
                                Divider(color: green, thickness: 0.5, height: 5,),
                                SizedBox(height: 2,),
                                Container(
                                  color: thirty ? green : Colors.transparent,
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text("30:00", style: TextStyle(color: thirty ? bg: green, fontSize: 14), textAlign: TextAlign.center,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: Icon(Icons.alarm, color: thirty ? bg : green, size: 20,),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (thirty) {
                                          thirty = false;
                                          fourtyFive = false;
                                          hour = false;
                                        }
                                        else {
                                          thirty = true;
                                          fourtyFive = false;
                                          hour = false;
                                        }
                                      });
                                      thirty ? startCountdown(const Duration(minutes: 30)) : startCountdown(const Duration(milliseconds: 1));
                                    },
                                  ),
                                ),
                                SizedBox(height: 2,),
                                Container(
                                  color: fourtyFive ? green : Colors.transparent,
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text("45:00", style: TextStyle(color: fourtyFive ? bg: green, fontSize: 14), textAlign: TextAlign.center,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: Icon(Icons.alarm, color: fourtyFive ? bg : green, size: 20,),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (fourtyFive) {
                                          thirty = false;
                                          fourtyFive = false;
                                          hour = false;
                                        }
                                        else {
                                          thirty = false;
                                          fourtyFive = true;
                                          hour = false;
                                        }
                                      });
                                      fourtyFive ? startCountdown(const Duration(minutes: 45)) : startCountdown(const Duration(milliseconds: 1));
                                    },
                                  ),
                                ),
                                SizedBox(height: 2,),
                                Container(
                                  color: hour ? green : Colors.transparent,
                                  child: GestureDetector(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text("1:00:00", style: TextStyle(color: hour ? bg: green, fontSize: 14), textAlign: TextAlign.center,),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: Icon(Icons.alarm, color: hour ? bg : green, size: 20,),
                                        )
                                      ],
                                    ),
                                    onTap: () {
                                      setState(() {
                                        if (hour) {
                                          thirty = false;
                                          fourtyFive = false;
                                          hour = false;
                                        }
                                        else {
                                          thirty = false;
                                          fourtyFive = false;
                                          hour = true;
                                        }
                                      });
                                      hour ? startCountdown(const Duration(minutes: 60)) : startCountdown(const Duration(milliseconds: 1));
                                    },
                                  ),
                                ),
                                Divider(color: green.withOpacity(0.3), thickness: 1.75),
                                SizedBox(height: 3,),
                                Text(timerRunning ? formatHMMSS(timeRemaining) : "IDLE", style: TextStyle(color: green, fontSize: 27), textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
