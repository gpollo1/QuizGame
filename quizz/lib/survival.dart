import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Survival extends StatefulWidget {
  const Survival({super.key});

  @override
  State<Survival> createState() => _SurvivalState();
}

class _SurvivalState extends State<Survival> {

  List questions = [];
  int i = 0;
  int score = 0;
  int lives = 3;

  String wario = "wario.png";

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future fetch() async {
    final res = await http.get(
      Uri.parse("https://opentdb.com/api.php?amount=50&type=multiple"),
    );
    questions = jsonDecode(res.body)["results"];
    setState(() {});
  }

  void answer(bool correct) {
    if(correct){
      score++;
      wario = "wfelice.png";
    } else {
      lives--;
      wario = lives>0 ? "warrabiato.png" : "wtriste.png";
    }
    setState(() {});

    if(lives<=0){
      showDialog(
          context: context,
          barrierDismissible: false,
          builder:(_)=>AlertDialog(
            title: const Text("GAME OVER"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/wtriste.png", height:120),
                const SizedBox(height:10),
                const Text("PUNTEGGIO FINALE", style: TextStyle(fontSize:20)),
                Text("$score", style: const TextStyle(fontSize:50,fontWeight:FontWeight.bold)),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("HOME")
              )
            ],
          )
      );
    } else {
      i++;
    }
  }

  @override
  Widget build(BuildContext context){

    if(questions.isEmpty){
      return const Scaffold(
        body: Center(child:CircularProgressIndicator()),
      );
    }

    final q = questions[i];
    List answers = [...q["incorrect_answers"], q["correct_answer"]]..shuffle();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sfondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),

            // Personaggio Wario grande
            Image.asset(
              "assets/images/$wario",
              height: 220,
            ),

            const SizedBox(height: 10),

            // Vignetta fumetto
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  )
                ],
              ),
              child: Text(
                q["question"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Risposte
            ...answers.map((a)=> Padding(
              padding: const EdgeInsets.symmetric(vertical:5,horizontal:20),
              child: ElevatedButton(
                  onPressed: ()=> answer(a==q["correct_answer"]),
                  child: Text(a)
              ),
            )),

            const Spacer(),

            // Punteggio + vite in basso
            Column(
              children: [
                Text(
                  "🏆 $score",
                  style: const TextStyle(fontSize:26,fontWeight:FontWeight.bold,color:Colors.white),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      lives,
                          (_)=> Padding(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(
                          "assets/images/vita.png",
                          height: 40,
                        ),
                      )
                  ),
                ),
                const SizedBox(height:15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}