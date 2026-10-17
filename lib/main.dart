import 'package:flutter/material.dart';

void main() {
  runApp(const ShelfFinderApp());
}

class ShelfFinderApp extends StatelessWidget {
  const ShelfFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShelfFinder Gto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A),
        ),
      ),
      home: const WarehouseSearchScreen(),
    );
  }
}

class WarehouseSearchScreen extends StatefulWidget {
  const WarehouseSearchScreen({super.key});

  @override
  State<WarehouseSearchScreen> createState() => _WarehouseSearchScreenState();
}

class _WarehouseSearchScreenState extends State<WarehouseSearchScreen> {
  int _currentIndex = 0;

  // Lista de productos basada en la imagen
  final List<Map<String, String>> _products = [
    {
      'name': 'Filtro de Aceite Gonher GP-42',
      'code': '750123456789',
      'price': '\$180.00',
      'location': 'A1, P2',
    },
    {
      'name': 'Balata Delantera Brembo B-102',
      'code': '750987654321',
      'price': '\$650.00',
      'location': 'A3, P4',
    },
    {
      'name': 'Bujía Iridium Ngk Lzkr6b',
      'code': '750111222333',
      'price': '\$220.00',
      'location': 'B2, P1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buscador (Surtidor de Almacén)',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF1E3A5F),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de búsqueda con botón QR
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFCBD5E1)),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar producto o código...',
                        hintStyle: TextStyle(color: Color(0xFF64748B)),
                        prefixIcon: Icon(Icons.search, color: Color(0xFF475569)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E3A5F),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
                    onPressed: () {
                      // Acción para escanear código QR
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Título de la sección
            const Text(
              'Catálogo de Productos:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),

            // Lista de productos
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return Card(
                    elevation: 0,
                    color: const Color(0xFFEDF2F7),
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          // Ícono de caja 3D / producto
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.view_in_ar,
                              color: Color(0xFF1E3A5F),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          
                          // Detalle del producto
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Código: ${product['code']} | Precio: ${product['price']}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF475569),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Etiqueta de ubicación (Ubicación en estante)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E3A5F),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              product['location']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF1E3A5F),
        unselectedItemColor: const Color(0xFF64748B),
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Plano Almacén',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}