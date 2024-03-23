import 'dart:math';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    _num1 = _random.nextInt(10) + 1;
    _num2 = _random.nextInt(99) + 1;
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
          controller: _controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: 'Enter your answer',
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
      });
    } else {
      setState(() {
        _controller.clear();
        _answerVisible = true;
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(203, 238, 243, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 100), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Contador de acertos: '),
            Text('$_hitCount', style: const TextStyle(color: Colors.green),),
          ],)),
          Text(
            '$_num1 $_operation $_num2 = ?',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              if (_answerVisible) _buildResultWidget() else _buildAnswerInput(),
            ],
          ),
        ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
