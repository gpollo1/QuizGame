import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuizCategories extends StatelessWidget {
  const QuizCategories({super.key});

  final categories = const [
    {"name":"Cinema","id":11,"bg":"cinema.png","prof":"bregistra.png"},
    {"name":"Scienza","id":17,"bg":"lab.png","prof":"mlab.png"},
    {"name":"Sport","id":21,"bg":"campo.png","prof":"sport.png"},
    {"name":"Videogiochi","id":15,"bg":"casa.png","prof":"donkeyVideogame.png"},
    {"name":"Storia","id":23,"bg":"storia.png","prof":"lstoria.png"},
    {"name":"Libri","id":10,"bg":"ita.png","prof":"pita.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("IL CERVELLONE")),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sfondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            itemCount: categories.length,
            itemBuilder:(c,i){
              return Card(
                child: ListTile(
                  title: Text(categories[i]["name"] as String),
                  trailing: const Icon(Icons.play_arrow),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder:(_)=>QuizPage(categories[i])
                        ));
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final Map data;
  const QuizPage(this.data, {super.key});

  @override
  State<QuizPage> createState() => _QuizState();
}

class _QuizState extends State<QuizPage>{

  List questions = [];
  int i = 0;
  int score = 0;

  @override
  void initState(){
    super.initState();
    fetch();
  }

  Future fetch() async {
    final url = Uri.parse(
        "https://opentdb.com/api.php?amount=10&category=${widget.data["id"]}&type=multiple"
    );
    final res = await http.get(url);
    questions = jsonDecode(res.body)["results"];
    setState(() {});
  }

  void answer(bool correct){
    if(correct) score++;

    if(i < questions.length-1){
      setState(()=>i++);
    } else {
      showDialog(context: context,
          builder:(_)=> AlertDialog(
            title: const Text("FINE QUIZ"),
            content: Text("Punteggio: $score / ${questions.length}"),
            actions: [
              TextButton(
                  onPressed:(){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("HOME")
              )
            ],
          )
      );
    }
  }

  @override
  Widget build(BuildContext context){

    if(questions.isEmpty){
      return const Scaffold(
          body: Center(child: CircularProgressIndicator())
      );
    }

    final q = questions[i];
    List answers = [...q["incorrect_answers"], q["correct_answer"]]..shuffle();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${widget.data["bg"]}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),

            // Personaggio grande
            Image.asset(
              "assets/images/${widget.data["prof"]}",
              height: 180,
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
            ...answers.map((a) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ElevatedButton(
                onPressed: () => answer(a == q["correct_answer"]),
                child: Text(a),
              ),
            )),

            const Spacer(),

            // Punteggio + vite in basso
            Column(
              children: [
                Text(
                  "🏆 $score",
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}