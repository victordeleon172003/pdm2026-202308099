import 'package:flutter/material.dart';

void main() {
  runApp(const ParqueosRapiditosApp());
}

class ParqueosRapiditosApp extends StatelessWidget {
  const ParqueosRapiditosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parqueos Rapiditos',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE9A15B),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF9F2),
      ),

      home: const PaginaInicio(),
    );
  }
}

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {

  // Lista de lugares disponibles
  final List<Map<String, String>> lugares = [
    {
      'nombre': 'Restaurante La Terraza',
      'zona': 'Zona 1',
      'parqueo': 'Parqueo seguro',
    },
    {
      'nombre': 'Restaurante El Mirador',
      'zona': 'Zona 4',
      'parqueo': 'Parqueo disponible',
    },
    {
      'nombre': 'Centro Comercial Utz Ulew',
      'zona': 'Zona 3',
      'parqueo': 'Parqueo privado',
    },
    {
      'nombre': 'Restaurante Los Arcos',
      'zona': 'Zona 7',
      'parqueo': 'Parqueo disponible',
    },
  ];

  // Aquí se guardan los resultados que se muestran
  List<Map<String, String>> resultados = [];

  @override
  void initState() {
    super.initState();

    // Al iniciar se muestran todos los lugares
    resultados = lugares;
  }

  // Esta función se ejecuta cuando escribimos en el SearchBar
  void buscarLugar(String texto) {
    setState(() {

      // Si no hay texto, muestra todos
      if (texto.isEmpty) {
        resultados = lugares;
        return;
      }

      // Convierte el texto a minúsculas
      final busqueda = texto.toLowerCase();

      // Filtra por nombre o zona
      resultados = lugares.where((lugar) {

        final nombre = lugar['nombre']!.toLowerCase();
        final zona = lugar['zona']!.toLowerCase();

        return nombre.contains(busqueda) ||
            zona.contains(busqueda);

      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ENCABEZADO
              Row(
                children: [

                  const Icon(
                    Icons.menu,
                    size: 32,
                  ),

                  const Spacer(),

                  const Column(
                    children: [
                      Text(
                        'PARQUEOS',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'RAPIDITOS',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Icon(
                    Icons.notifications_outlined,
                    size: 30,
                    color: Colors.orange.shade700,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ========================================
              // COMPONENTE MATERIAL SELECCIONADO
              // SEARCHBAR
              // ========================================

              SearchBar(

                // Texto que aparece antes de escribir
                hintText: 'Buscar restaurante o zona',

                // Icono que aparece a la izquierda
                leading: const Icon(
                  Icons.search,
                ),

                // Se ejecuta cada vez que escribimos
                onChanged: buscarLugar,
              ),

              const SizedBox(height: 30),

              const Text(
                'Lugares disponibles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // RESULTADOS
              Expanded(
                child: resultados.isEmpty

                    // Si no encuentra resultados
                    ? const Center(
                        child: Text(
                          'No se encontraron lugares',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      )

                    // Si encuentra resultados
                    : ListView.builder(

                        itemCount: resultados.length,

                        itemBuilder: (context, index) {

                          final lugar = resultados[index];

                          return Container(
                            margin: const EdgeInsets.only(
                              bottom: 12,
                            ),

                            padding: const EdgeInsets.all(16),

                            decoration: BoxDecoration(
                              color: Colors.white,

                              borderRadius:
                                  BorderRadius.circular(15),

                              border: Border.all(
                                color: const Color(0xFFF0DDC8),
                              ),
                            ),

                            child: Row(
                              children: [

                                Container(
                                  width: 50,
                                  height: 50,

                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFE9D2),

                                    borderRadius:
                                        BorderRadius.circular(12),
                                  ),

                                  child: const Icon(
                                    Icons.local_parking,
                                    color: Color(0xFFD97A3A),
                                  ),
                                ),

                                const SizedBox(width: 15),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [

                                      Text(
                                        lugar['nombre']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      Text(
                                        lugar['zona']!,
                                        style: TextStyle(
                                          color:
                                              Colors.grey.shade700,
                                        ),
                                      ),

                                      const SizedBox(height: 3),

                                      Text(
                                        lugar['parqueo']!,
                                        style: const TextStyle(
                                          color: Color(0xFFD97A3A),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const Icon(
                                  Icons.chevron_right,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}