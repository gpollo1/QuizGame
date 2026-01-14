# Trivia Arena

**Trivia Arena** è un'applicazione Flutter per quiz interattivi. L'app offre due modalità di gioco principali: **Il Cervellone** e **Sopravvivenza**.

---

## Modalità di Gioco

### Il Cervellone
Questa modalità si concentra sulle **categorie tematiche**, permettendo di scegliere il quiz in base ai propri interessi.

- **Categorie disponibili:**
  - **Cinema**.
  - **Scienza**.
  - **Sport**.
  - **Videogiochi**.
  - **Storia**.
  - **Libri**.
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
- Il punteggio massimo è di 50 risposte corrette

---

## Caratteristiche principali

- **Design interattivo**: ogni modalità ha sfondi e personaggi.
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
## Importazione del gioco sul pc
Per eseguire Trivia Arena sul tuo dispositivo Android (o emulatori), segui questi passaggi:
- **Prerequisiti:**
- Assicurati di avere Flutter installato sul PC.
- Installa Android Studio o un altro IDE compatibile con Flutter.
- Verifica che l’ambiente Flutter sia configurato correttamente con flutter doctor.
- **Scarica il proggetto:**
- Copia tutte le cartelle e i file del progetto.
- Non dimenticare la cartella assets/images, che contiene tutti gli sfondi, i personaggi e le icone del gioco.
- Apri il progetto in Android Studio
- Seleziona “Open an existing project” e punta alla cartella principale del gioco.
- Esegui il gioco
- Collega un telefono Android via USB (attiva la modalità sviluppatore) oppure usa un emulatore Android.
- Premi il pulsante “Run”.
- L’app verrà compilata e avviata sul dispositivo scelto.

