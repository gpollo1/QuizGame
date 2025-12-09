# Trivia Arena

**Trivia Arena** è un'applicazione Flutter per quiz interattivi, pensata per mettere alla prova la conoscenza generale degli utenti in maniera divertente e dinamica. L'app offre due modalità di gioco principali: **Il Cervellone** e **Sopravvivenza**, ciascuna con caratteristiche uniche e un design personalizzato.

---

## Modalità di Gioco

### Il Cervellone
Questa modalità si concentra sulle **categorie tematiche**, permettendo di scegliere il quiz in base ai propri interessi.

- **Categorie disponibili:**
  - **Cinema**: sfondo cinema e professore Bregistra.
  - **Scienza**: sfondo laboratorio e professore MLab.
  - **Sport**: sfondo campo e professore Sport.
  - **Videogiochi**: sfondo casa e personaggio Donkey Videogame.
  - **Storia**: sfondo storico e professore LStoria.
  - **Libri**: sfondo italiano e professore Pita.
- Ogni categoria ha uno **sfondo dedicato** e un **personaggio** (professore) che introduce le domande.
- Ogni domanda corretta vale **1 punto**.
- Non ci sono vite: il giocatore procede fino alla fine del quiz.
- Alla fine di ogni categoria viene mostrato il punteggio ottenuto.

### Sopravvivenza
Questa modalità mette alla prova la capacità di rispondere rapidamente a domande casuali, con un sistema di vite limitate.

- Il giocatore ha **3 vite** all’inizio del gioco.
- Ogni risposta sbagliata riduce una vita.
- Il personaggio **Wario** cambia espressione in base alle risposte:
  - **Felice** quando la risposta è corretta.
  - **Arrabbiato** quando si perde una vita.
  - **Triste** quando si esauriscono tutte le vite.
- Lo sfondo è unico e uniforme per tutta la modalità.
- Il punteggio viene visualizzato in modo evidente al termine del gioco.

---

## Caratteristiche principali

- **Design interattivo**: ogni modalità ha sfondi e personaggi unici, rendendo il gioco più coinvolgente.
- **Domande dinamiche**: tutte le domande sono recuperate in tempo reale dall’**Open Trivia Database**.
- **Sistema punti e vite**: punteggio visualizzato durante il gioco e vite rappresentate con icone grafiche.
- **Vignette fumetto**: le domande appaiono come se fossero dette dai personaggi stessi.
- **Adattabilità**: l’interfaccia si adatta a diversi dispositivi senza perdere il layout.

---

## Tecnologie

- **Flutter**: framework principale per l’interfaccia e la logica dell’app.
- **Dart**: linguaggio di programmazione utilizzato.
- **Open Trivia Database**: fonte delle domande per i quiz.
- **Assets grafici personalizzati**: immagini dei personaggi, sfondi e icone delle vite.

---

Trivia Arena combina divertimento, conoscenza e un’interfaccia coinvolgente per creare un’esperienza di quiz unica e personalizzata.
