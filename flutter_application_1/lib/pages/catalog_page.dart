import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';
import 'cart_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  String _selectedCategory = 'Semua';

  // Master Data Produk Menggunakan Ikon / Stiker Bawaan
  final List<Map<String, dynamic>> _allProductsData = [
    // 1. MAKE UP
    {
      'id': 1,
      'name': 'Lip Tint Velvet Pink',
      'price': 25000,
      'category': 'Make Up',
      'icon': Icons.brush_outlined,
      'color': Colors.pinkAccent,
    },
    {
      'id': 2,
      'name': 'Lip Cream Matte Coral',
      'price': 30000,
      'category': 'Make Up',
      'icon': Icons.color_lens_outlined,
      'color': Colors.deepOrangeAccent,
    },
    {
      'id': 3,
      'name': 'Cushion Glowing Natural',
      'price': 65000,
      'category': 'Make Up',
      'icon': Icons.face_retouching_natural_outlined,
      'color': Colors.amber,
    },
    {
      'id': 4,
      'name': 'Eyeshadow Palette Pinky',
      'price': 48000,
      'category': 'Make Up',
      'icon': Icons.palette_outlined,
      'color': Colors.purpleAccent,
    },
    {
      'id': 5,
      'name': 'Blush On Peach Soft',
      'price': 35000,
      'category': 'Make Up',
      'icon': Icons.wb_sunny_outlined,
      'color': Colors.orangeAccent,
    },
    {
      'id': 6,
      'name': 'Mascara Waterproof Black',
      'price': 42000,
      'category': 'Make Up',
      'icon': Icons.remove_red_eye_outlined,
      'color': Colors.grey,
    },

    // 2. KIPAS
    {
      'id': 7,
      'name': 'Kipas Mini USB Bunny',
      'price': 35000,
      'category': 'Kipas',
      'icon': Icons.toys_outlined,
      'color': Colors.pinkAccent,
    },
    {
      'id': 8,
      'name': 'Kipas Genggam Lipat Pink',
      'price': 42000,
      'category': 'Kipas',
      'icon': Icons.air_outlined, // Menggunakan air_outlined yang valid di Flutter
      'color': Colors.lightBlueAccent,
    },
    {
      'id': 9,
      'name': 'Kipas Saku Portable Soft',
      'price': 29000,
      'category': 'Kipas',
      'icon': Icons.wind_power_outlined,
      'color': Colors.teal,
    },
    {
      'id': 10,
      'name': 'Kipas Leher Handsfree Cute',
      'price': 58000,
      'category': 'Kipas',
      'icon': Icons.headphones_outlined,
      'color': Colors.purple,
    },

    // 3. MAHKOTA
    {
      'id': 13,
      'name': 'Mahkota Tiara Crystal Shiny',
      'price': 55000,
      'category': 'Mahkota',
      'icon': Icons.stars_outlined,
      'color': Colors.amber,
    },
    {
      'id': 14,
      'name': 'Mahkota Mini Princess Cute',
      'price': 48000,
      'category': 'Mahkota',
      'icon': Icons.auto_awesome_outlined,
      'color': Colors.pinkAccent,
    },

    // 4. TAS
    {
      'id': 19,
      'name': 'Tas Selempang Mini Pink',
      'price': 65000,
      'category': 'Tas',
      'icon': Icons.shopping_bag_outlined,
      'color': Colors.pink,
    },
    {
      'id': 20,
      'name': 'Tote Bag Canvas Aesthetic',
      'price': 45000,
      'category': 'Tas',
      'icon': Icons.card_travel_outlined,
      'color': Colors.brown,
    },
  ];

  List<Product> get _allProducts {
    return _allProductsData.map((data) {
      return Product(
        id: data['id'],
        name: data['name'],
        price: (data['price'] as num).toDouble(),
        category: data['category'],
        image: '',
      );
    }).toList();
  }

  Future<List<Product>> _getFilteredProducts() async {
    if (_selectedCategory == 'Semua') {
      return _allProducts;
    } else {
      return _allProducts
          .where((p) => p.category.toLowerCase() == _selectedCategory.toLowerCase())
          .toList();
    }
  }

  // Widget Stiker / Ikon Produk
  Widget _buildStickerIcon(Product product) {
    final itemData = _allProductsData.firstWhere(
      (element) => element['id'] == product.id,
      orElse: () => {
        'icon': Icons.favorite_outline,
        'color': Colors.pinkAccent,
      },
    );

    IconData iconData = itemData['icon'] as IconData;
    Color iconColor = itemData['color'] as Color;

    return Container(
      color: iconColor.withValues(alpha: 0.12),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: iconColor.withValues(alpha: 0.2),
                blurRadius: 8,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            iconData,
            size: 48,
            color: iconColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFB6C1),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Beauty Olivia & More',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // STIKER UTAMA
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFFB6C1), width: 3),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.storefront_rounded,
                      size: 64,
                      color: Colors.pink,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Beauty Olivia',
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),

            // KATEGORI BAR
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFFFB6C1), width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _categoryBtn(Icons.grid_view_rounded, 'Semua'),
                  _divider(),
                  _categoryBtn(Icons.brush_outlined, 'Make Up'),
                  _divider(),
                  _categoryBtn(Icons.toys_outlined, 'Kipas'),
                  _divider(),
                  _categoryBtn(Icons.stars_outlined, 'Mahkota'),
                  _divider(),
                  _categoryBtn(Icons.shopping_bag_outlined, 'Tas'),
                  _divider(),
                  _categoryBtn(Icons.face_outlined, 'Bandu'),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // KATEGORI TERPILIH
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Kategori: $_selectedCategory',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // GRID PRODUK
            FutureBuilder<List<Product>>(
              future: _getFilteredProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.pinkAccent),
                    ),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SizedBox(
                    height: 150,
                    child: Center(
                      child: Text(
                        'Tidak ada produk di kategori ini 💕',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  );
                }

                final products = snapshot.data!;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: _buildStickerIcon(product),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Rp ${product.price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    color: Colors.pink[400],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  width: double.infinity,
                                  height: 32,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFB6C1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      Provider.of<CartProvider>(context, listen: false)
                                          .addToCart(product);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '${product.name} berhasil ditambahkan!',
                                          ),
                                          duration: const Duration(seconds: 1),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Tambah',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _categoryBtn(IconData icon, String label) {
    final bool isSelected = _selectedCategory == label;
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFFC71585) : const Color(0xFFDB7093),
            size: isSelected ? 22 : 18,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFFC71585) : const Color(0xFFDB7093),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 18,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      color: Colors.pink[200],
    );
  }
}