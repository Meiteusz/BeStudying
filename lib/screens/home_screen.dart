import 'dart:math';
import 'package:flutter/material.dart';

import 'package:be_studying/layout/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  final TextEditingController _controller = TextEditingController();
  late int _num1 = 0;
  late int _num2 = 0;
  late int _result = 0;
  late int _hitCount = 0;
  late String _operation = "";
  bool _answerVisible = false;
  late int _menuIndex = 0;
  late String valueImputed = "";

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    _num1 = _random.nextInt(1000); // números de 1 a 100
    _num2 = _random.nextInt(0); // números de 1 a 20
    if (_random.nextBool()) {
      _operation = '×';
      _result = _num1 * _num2;
    } else {
      // To ensure a whole number division result
      _result = _num1;
      _num1 = _num1 * _num2;
      _operation = '÷';
    }
    setState(() {
      _answerVisible = false;
    });
  }

  Widget _buildAnswerInput() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          onChanged: (value) => setState(() {
            valueImputed = value;
          }),
          controller: _controller,
          style: const TextStyle(color: Colors.white, fontSize: 18),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: 'Informe sua resposta',
            hintStyle: TextStyle(color: Colors.white),
          ),
          onSubmitted: (_) {
            _checkAnswer();
          },
        ),
      ),
    );
  }

  void _checkAnswer() {
    int? userAnswer = int.tryParse(_controller.text);
    if (userAnswer == _result) {
      setState(() {
        _hitCount++;
        _answerVisible = false;
        _controller.clear();
        _generateQuestion();
        valueImputed = "";
      });
    } else {
      setState(() {
        _controller.clear();
        _answerVisible = true;
        valueImputed = "";
      });
    }
  }

  Widget _buildResultWidget() {
    return Expanded(
      child: Column(
        children: [
          const Text(
            'Resposta Errada!',
            style: TextStyle(color: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _answerVisible = false;
              });
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _updateMenuIndex(int index) {
    setState(() {
      _menuIndex = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Atividades',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(160, 18, 18, 40),
        body: Center(
          child: Container(
            //decoration: const BoxDecoration(
            //  gradient: LinearGradient(
            //    begin: Alignment.topRight,
            //    end: Alignment.bottomLeft,
            //    colors: [
            //      Color.fromARGB(54, 108, 136, 118),
            //      Color.fromARGB(255, 108, 141, 122),
            //    ],
            //  ),
            //),
            child: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 120),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Contador de acertos',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                              ),
                              child: Text('$_hitCount',
                                  style: const TextStyle(
                                      fontSize: 25, color: Colors.green)),
                            )
                          ],
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_num1 $_operation $_num2 = ',
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Text(
                              valueImputed.isNotEmpty ? valueImputed : '?',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.blue)),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        if (_answerVisible)
                          _buildResultWidget()
                        else
                          _buildAnswerInput(),
                      ],
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('Versão Be Studying: v0.1',
                    style: TextStyle(color: Colors.white)),
              )
            ][_menuIndex],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(
            Icons.check,
            color: Color.fromRGBO(18, 18, 40, 1),
          ),
          onPressed: () {
            _checkAnswer();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BeStudyingNavigationBar(update: _updateMenuIndex));
  }
}
