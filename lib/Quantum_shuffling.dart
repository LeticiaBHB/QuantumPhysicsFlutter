import 'package:flutter/material.dart';

class Complex {
  final double real;
  final double imaginary;

  Complex(this.real, this.imaginary);

  Complex operator *(Complex other) {
    final realPart = real * other.real - imaginary * other.imaginary;
    final imaginaryPart = real * other.imaginary + imaginary * other.real;
    return Complex(realPart, imaginaryPart);
  }

  Complex operator +(Complex other) {
    final realPart = real + other.real;
    final imaginaryPart = imaginary + other.imaginary;
    return Complex(realPart, imaginaryPart);
  }
}

class Qubit {
  Complex alpha; // |0⟩ coefficient
  Complex beta; // |1⟩ coefficient

  Qubit({required Complex alpha, required Complex beta})
      : alpha = alpha,
        beta = beta;
}

class Quantum_Shuffling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qubit1 = Qubit(alpha: Complex(1, 0), beta: Complex(0, 0));
    final qubit2 = Qubit(alpha: Complex(0, 0), beta: Complex(1, 0));

    final entangledState = Qubit(
      alpha: qubit1.alpha * qubit2.alpha + qubit1.beta * qubit2.beta,
      beta: qubit1.alpha * qubit2.beta + qubit1.beta * qubit2.alpha,
    );


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quantum Entanglement Example'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Bell State (Entangled):',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '|Ψ⟩ = (|00⟩ + |11⟩) / √2',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Qubit 1:',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '|Ψ₁⟩ = ${entangledState.alpha.real.toStringAsFixed(2)}|0⟩ + ${entangledState.alpha.imaginary.toStringAsFixed(2)}|1⟩',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Qubit 2:',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '|Ψ₂⟩ = ${entangledState.beta.real.toStringAsFixed(2)}|0⟩ + ${entangledState.beta.imaginary.toStringAsFixed(2)}|1⟩',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '  ', // Espaços em branco para criar o recuo
                      ),
                      TextSpan(
                        text:
                        'Quantum entanglement is one of the most intriguing and fundamental phenomena in quantum mechanics. It occurs when two or more quantum systems are so closely correlated that the state of one system cannot be described independently of the state of the other entangled systems. This means that even if systems are separated by great distances, changes in one system will instantly affect the state of the other, violating the classical idea that information cannot travel faster than the speed of light.',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                child: Text(
                    'concept of quantum entanglement in a clearer and more scientific way:',
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 50),
              Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '  ', // Espaços em branco para criar o recuo
                        ),
                        TextSpan(
                          text:
                          'Imagine that we have two qubits (the building blocks of quantum computing) entangled. Each qubit can be in a state of |0⟩ or |1⟩, representing the basic states of a classical bit. However, according to quantum mechanics, before we measure qubits, they can exist in a linear combination of these states, which is known as a superposition.',
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 50),
              Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '  ', // Espaços em branco para criar o recuo
                        ),
                        TextSpan(
                            text:
                            'The entanglement phenomenon occurs when these two qubits are in an entangled quantum state, like the Bell state |Ψ+⟩:'),
                      ],
                    ),
                  )),
              SizedBox(height: 50),
              Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '  ', // Espaços em branco para criar o recuo
                        ),
                        TextSpan(
                          text:
                          '|Ψ+⟩ = (|00⟩ + |11⟩) / √2', // Espaços em branco para criar o recuo
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 50),
              Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '  ', // Espaços em branco para criar o recuo
                        ),
                        TextSpan(
                          text:
                          'Here, |00⟩ and |11⟩ are representations of the states of both qubits. Dividing by √2 is a necessary normalization to ensure that the total probability is 1. This state represents a situation where, if we measure the first qubit and find the state |0⟩, we immediately know that the second qubit is also in the state | 0⟩. Likewise, if the first qubit is measured as |1⟩, the second qubit will also be in the |1⟩ state.',
                          // Espaços em branco para criar o recuo
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 50),
              Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '  ', // Espaços em branco para criar o recuo
                        ),
                        TextSpan(
                          text:
                          'What makes entanglement so fascinating is that when entangled qubits are separated by great distances and measurements are performed on one of them, the state of the other qubit is instantly determined, regardless of the distance between them. This seems to defy our classical intuition and suggests that information is being transmitted instantaneously, which contradicts the theory of relativity.', // Espaços em branco para criar o recuo
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 50),
              Container(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '  ', // Espaços em branco para criar o recuo
                      ),
                      TextSpan(
                        text:
                        'Although entanglement has been experimentally proven, its interpretation and implications still generate debates and discussions among scientists. It is fundamental to many applications of quantum computing, such as quantum cryptography and secure quantum communication, and also has potential applications in areas such as quantum simulations and optimization.', // Espaços em branco para criar o recuo
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
