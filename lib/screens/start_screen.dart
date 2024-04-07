import 'package:flutter/material.dart';

import 'package:be_studying/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 141, 84),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromRGBO(32, 49, 51, 1),
                Color.fromRGBO(19, 29, 31, 1),
                Color.fromRGBO(14, 22, 23, 1),
                Color.fromRGBO(10, 15, 15, 1),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 200.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Text(
                            'Bem vindo ao ',
                            style: GoogleFonts.lato(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              textStyle: const TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Be Studying',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      )),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('Iniciar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
