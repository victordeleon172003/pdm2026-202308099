import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Marcador(),
  ));
}

class Marcador extends StatefulWidget {
  const Marcador({super.key});

  @override
  State<Marcador> createState() => _MarcadorState();
}

class _MarcadorState extends State<Marcador> {
  int equipoA = 0;
  int equipoB = 0;

  @override
  Widget build(BuildContext context) {
    String mensaje = 'Empate';

    if (equipoA > equipoB) {
      mensaje = 'Va ganando Equipo A';
    }

    if (equipoB > equipoA) {
      mensaje = 'Va ganando Equipo B';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador Deportivo'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              // EQUIPO A
              Column(
                children: [
                  Text(
                    'Equipo A',
                    style: TextStyle(
                      color: equipoA > equipoB
                          ? Colors.green
                          : Colors.black,
                    ),
                  ),

                  Text(
                    '$equipoA',
                    style: const TextStyle(fontSize: 40),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        equipoA = equipoA + 1;
                      });
                    },
                    child: const Text('+1'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (equipoA > 0) {
                        setState(() {
                          equipoA = equipoA - 1;
                        });
                      }
                    },
                    child: const Text('-1'),
                  ),
                ],
              ),

              // EQUIPO B
              Column(
                children: [
                  Text(
                    'Equipo B',
                    style: TextStyle(
                      color: equipoB > equipoA
                          ? Colors.green
                          : Colors.black,
                    ),
                  ),

                  Text(
                    '$equipoB',
                    style: const TextStyle(fontSize: 40),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        equipoB = equipoB + 1;
                      });
                    },
                    child: const Text('+1'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (equipoB > 0) {
                        setState(() {
                          equipoB = equipoB - 1;
                        });
                      }
                    },
                    child: const Text('-1'),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),

          Text(mensaje),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              setState(() {
                equipoA = 0;
                equipoB = 0;
              });
            },
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}