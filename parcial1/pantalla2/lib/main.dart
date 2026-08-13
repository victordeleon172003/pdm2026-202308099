import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add money',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB7F32B),
          brightness: Brightness.light,
        ),
      ),
      home: const AddMoneyScreen(),
    );
  }
}

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            /*
            En computadora mantenemos el aspecto de teléfono,
            pero centrado.

            En teléfono ocupa prácticamente todo el ancho.
            */
            final double maxWidth =
                constraints.maxWidth > 500 ? 390 : constraints.maxWidth;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                ),

                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    14,
                    20,
                    16,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // =========================================
                      // ENCABEZADO
                      // =========================================

                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),

                              border: Border.all(
                                color: const Color(0xFFE2E2E2),
                              ),
                            ),

                            child: const Icon(
                              Icons.chevron_left_rounded,
                              size: 27,
                              color: Color(0xFF202020),
                            ),
                          ),

                          const Expanded(
                            child: Center(
                              child: Text(
                                'Add money',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1D1D1D),
                                ),
                              ),
                            ),
                          ),

                          // Equilibra el botón izquierdo
                          const SizedBox(width: 40),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // =========================================
                      // SELECT CARD
                      // =========================================

                      const Text(
                        'Select card',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF202020),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // =========================================
                      // LISTA HORIZONTAL DE TARJETAS
                      // =========================================

                      SizedBox(
                        height: 112,

                        child: ListView(
                          scrollDirection: Axis.horizontal,

                          children: const [
                            BankCard(
                              color: Color(0xFFB7F32B),
                              textColor: Color(0xFF282828),
                              bank: 'NEO',
                              type: 'Debit Card',
                              number: '•••• 4568',
                              selected: true,
                              showMastercard: true,
                            ),

                            SizedBox(width: 10),

                            BankCard(
                              color: Color(0xFF292929),
                              textColor: Colors.white,
                              bank: 'VISA',
                              type: 'Credit Card',
                              number: '•••• 2478',
                            ),

                            SizedBox(width: 10),

                            BankCard(
                              color: Color(0xFF4B4B4B),
                              textColor: Colors.white,
                              bank: 'BANK',
                              type: 'Bank Card',
                              number: '•••• 9081',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // =========================================
                      // TITULO DE OPCIONES
                      // =========================================

                      const Text(
                        'Add money to Neobank',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF202020),
                        ),
                      ),

                      const SizedBox(height: 14),

                      // =========================================
                      // OPCIONES
                      // =========================================

                      const MoneyOption(
                        icon: Icons.savings_outlined,
                        title: 'Move your direct deposit',
                      ),

                      const SizedBox(height: 10),

                      const MoneyOption(
                        icon: Icons.swap_horiz_rounded,
                        title: 'Transfer from other banks',
                      ),

                      const SizedBox(height: 10),

                      const MoneyOption(
                        icon: Icons.apple,
                        title: 'Apple Pay',
                      ),

                      const SizedBox(height: 10),

                      const MoneyOption(
                        icon: Icons.credit_card_outlined,
                        title: 'Debit / Credit Card',
                      ),

                      const SizedBox(height: 65),

                      // =========================================
                      // BARRA INFERIOR TIPO IPHONE
                      // =========================================

                      Center(
                        child: Container(
                          width: 115,
                          height: 4,

                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),

                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// =======================================================
// WIDGET DE TARJETA BANCARIA
// =======================================================

class BankCard extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String bank;
  final String type;
  final String number;

  final bool selected;
  final bool showMastercard;

  const BankCard({
    super.key,
    required this.color,
    required this.textColor,
    required this.bank,
    required this.type,
    required this.number,
    this.selected = false,
    this.showMastercard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,

      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(18),

        border: selected
            ? Border.all(
                color: const Color(0xFF242424),
                width: 3,
              )
            : null,
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),

        child: Stack(
          children: [
            // =========================================
            // PATRÓN DECORATIVO TARJETA VERDE
            // =========================================

            if (selected)
              Positioned.fill(
                child: Opacity(
                  opacity: 0.20,

                  child: Wrap(
                    spacing: 2,
                    runSpacing: 3,

                    children: List.generate(
                      40,
                      (index) => const Text(
                        'NEO',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // =========================================
            // DECORACIÓN TARJETA OSCURA
            // =========================================

            if (!selected)
              Positioned(
                right: -13,
                bottom: -20,

                child: Transform.rotate(
                  angle: -0.4,

                  child: Container(
                    width: 18,
                    height: 100,
                    color: Colors.white12,
                  ),
                ),
              ),

            if (!selected)
              Positioned(
                right: 13,
                bottom: -20,

                child: Transform.rotate(
                  angle: -0.4,

                  child: Container(
                    width: 12,
                    height: 100,
                    color: Colors.white12,
                  ),
                ),
              ),

            // =========================================
            // CONTENIDO
            // =========================================

            Padding(
              padding: const EdgeInsets.all(11),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      // Pequeño círculo superior
                      Container(
                        width: 15,
                        height: 15,

                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const Spacer(),

                      if (showMastercard)
                        const MastercardIcon()
                      else
                        Text(
                          bank,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                    ],
                  ),

                  const Spacer(),

                  Text(
                    type,
                    style: TextStyle(
                      color: textColor.withOpacity(0.75),
                      fontSize: 9,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    number,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// SIMULACIÓN DEL LOGO MASTERCARD CON WIDGETS
// =======================================================

class MastercardIcon extends StatelessWidget {
  const MastercardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 29,
      height: 18,

      child: Stack(
        children: [
          Positioned(
            left: 1,

            child: Container(
              width: 18,
              height: 18,

              decoration: const BoxDecoration(
                color: Color(0xFFE53935),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            right: 1,

            child: Container(
              width: 18,
              height: 18,

              decoration: const BoxDecoration(
                color: Color(0xFFFF9800),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =======================================================
// OPCIÓN DE MÉTODO DE PAGO
// =======================================================

class MoneyOption extends StatelessWidget {
  final IconData icon;
  final String title;

  const MoneyOption({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,

      color: const Color(0xFFF1F2F2),

      margin: EdgeInsets.zero,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),

      child: SizedBox(
        height: 51,

        child: ListTile(
          dense: true,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),

          leading: Icon(
            icon,
            size: 20,
            color: const Color(0xFF333333),
          ),

          title: Text(
            title,

            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF303030),
            ),
          ),

          trailing: const Icon(
            Icons.chevron_right_rounded,
            size: 23,
            color: Color(0xFF929292),
          ),
        ),
      ),
    );
  }
}