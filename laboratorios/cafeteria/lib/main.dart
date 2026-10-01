import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MiPedido(),
  ));
}

class MiPedido extends StatefulWidget {
  const MiPedido({super.key});

  @override
  State<MiPedido> createState() => _MiPedidoState();
}

class _MiPedidoState extends State<MiPedido> {
  int cafe = 0;
  int sandwich = 0;
  int jugo = 0;

  double total() {
    return (cafe * 10) + (sandwich * 25) + (jugo * 12);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ProductoPedido(
              nombre: 'Café',
              precio: 10,
              cantidad: cafe,
              sumar: () {
                setState(() {
                  cafe++;
                });
              },
              restar: () {
                if (cafe > 0) {
                  setState(() {
                    cafe--;
                  });
                }
              },
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Sándwich',
              precio: 25,
              cantidad: sandwich,
              sumar: () {
                setState(() {
                  sandwich++;
                });
              },
              restar: () {
                if (sandwich > 0) {
                  setState(() {
                    sandwich--;
                  });
                }
              },
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Jugo',
              precio: 12,
              cantidad: jugo,
              sumar: () {
                setState(() {
                  jugo++;
                });
              },
              restar: () {
                if (jugo > 0) {
                  setState(() {
                    jugo--;
                  });
                }
              },
            ),

            const Spacer(),

            Text(
              'Total: Q${total().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  cafe = 0;
                  sandwich = 0;
                  jugo = 0;
                });
              },
              child: const Text('Vaciar pedido'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final VoidCallback sumar;
  final VoidCallback restar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.sumar,
    required this.restar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: const TextStyle(fontSize: 18),
              ),
              Text('Q${precio.toStringAsFixed(2)}'),
            ],
          ),
        ),

        ElevatedButton(
          onPressed: restar,
          child: const Text('-1'),
        ),

        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            '$cantidad',
            style: const TextStyle(fontSize: 18),
          ),
        ),

        ElevatedButton(
          onPressed: sumar,
          child: const Text('+1'),
        ),
      ],
    );
  }
}