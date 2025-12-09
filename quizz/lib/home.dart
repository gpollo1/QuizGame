import 'package:flutter/material.dart';
import 'quiz.dart';
import 'survival.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sfondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 20),

              ElevatedButton(
                  child: const Text("🧠 IL CERVELLONE"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const QuizCategories())
                    );
                  }
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                  child: const Text("❤️ SOPRAVVIVENZA"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Survival())
                    );
                  }
              )

            ],
          ),
        ),
      ),
    );
  }
}