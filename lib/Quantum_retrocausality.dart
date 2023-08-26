import 'dart:math';

import 'package:flutter/material.dart';

class QuantumRetrocausality extends StatefulWidget {
  @override
  _QuantumRetrocausalityState createState() => _QuantumRetrocausalityState();
}

class _QuantumRetrocausalityState extends State<QuantumRetrocausality> {
  bool showBarrier = false;
  bool isMeasuring = false;
  String resultMessage = "";

  Future<void> startExperiment() async {
    setState(() {
      isMeasuring = true;
      resultMessage = "Running experiment...";
    });

    await Future.delayed(Duration(seconds: 2));

    final random = Random();
    final particleInSuperposition = random.nextBool();

    await Future.delayed(Duration(seconds: 2));

    final interferencePattern = simulateInterference(particleInSuperposition);

    setState(() {
      resultMessage = "Measurement made: " +
          (interferencePattern ? "Interference Pattern" : "No Interference");
    });
  }

  bool simulateInterference(bool particleInSuperposition) {
    // Simulate interference based on whether the particle is in superposition
    if (particleInSuperposition) {
      final random = Random();
      final phaseDifference = random.nextDouble() * 2 * pi;
      final interference = cos(phaseDifference);
      return interference >
          0; // Interference pattern occurs for positive interference
    } else {
      return false; // No interference pattern when particle collapses
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delayed Choice Experiment"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 240,
                width: 200,
                color: Colors.grey[300],
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: showBarrier ? 1.0 : 0.0,
                      duration: Duration(seconds: 1),
                      child: Container(
                        height: 200,
                        width: 4,
                        color: Colors.black,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      top: showBarrier ? 20 : 120,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                resultMessage,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              if (!isMeasuring)
                ElevatedButton(
                  onPressed: startExperiment,
                  child: Text("Start Experiment"),
                ),
              if (isMeasuring)
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Measurement in Progress..."),
                ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showBarrier = !showBarrier;
                      });
                    },
                    child: Icon(Icons.flip_camera_android),
                  ),
                ],
              ),
              Text(''),
              Container(
                  child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '  ', // Espaços em branco para criar o recuo
                    ),
                    TextSpan(
                        text:
                            'In the experiment, a particle (represented by a blue circle) is fired towards a barrier. Behind the barrier, two options can occur:',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  ],
                ),
              )),
              SizedBox(height: 10),
              Container(
                  child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '  ', // Espaços em branco para criar o recuo
                    ),
                    TextSpan(
                        text:
                            'Superposition and Interference: If the particle is in a superposition state, it can exist in multiple states simultaneously. This is represented by an indeterminate movement of the circle before hitting the barrier. When the particle hits the barrier, it can interfere with itself, creating a recognizable interference pattern. This interference is calculated using phase and cosine calculations.'),
                  ],
                ),
              )),

              SizedBox(height: 10),
              Container(
                  child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '  ', // Espaços em branco para criar o recuo
                    ),
                    TextSpan(
                        text:
                            'Wave Function Collapse: If the particle is not in a superposition state, it will have a definite position when crossing the barrier. In this case, an interference pattern will not occur, since the possibility of interference has "collapsed" at the time of measurement.'),
                  ],
                ),
              )),
              SizedBox(height: 10),
              Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '  ', // Espaços em branco para criar o recuo
                        ),
                        TextSpan(text: 'Quantum retroactivity implies that the decision to observe or measure a system in a certain state can retroactively influence the previous state of the system. This challenges our classical intuition of cause and effect, as it suggests that future events can affect past events.',
                          style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )),
              SizedBox(height: 10),
            ],
          ),
        ),
      ) ,
    );
  }
}
