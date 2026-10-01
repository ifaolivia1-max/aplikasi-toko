import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/product_model.dart';
import '../models/cart_item_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'beauty_more_v9.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE master_products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            price REAL NOT NULL,
            category TEXT NOT NULL,
            image TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE local_cart (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            product_id INTEGER NOT NULL,
            name TEXT NOT NULL,
            price REAL NOT NULL,
            quantity INTEGER NOT NULL
          )
        ''');

        // --- 1. KATEGORI: MAKE UP (6 Produk) ---
        await db.insert('master_products', {
          'name': 'Lip Tint Velvet Pink',
          'price': 25000,
          'category': 'Make Up',
          'image': 'https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=400',
        });
        await db.insert('master_products', {
          'name': 'Lip Cream Matte Coral',
          'price': 30000,
          'category': 'Make Up',
          'image': 'https://images.unsplash.com/photo-1625093742435-6fa192b6fb10?w=400',
        });
        await db.insert('master_products', {
          'name': 'Cushion Glowing Natural',
          'price': 65000,
          'category': 'Make Up',
          'image': 'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?w=400',
        });
        await db.insert('master_products', {
          'name': 'Eyeshadow Palette Pinky',
          'price': 48000,
          'category': 'Make Up',
          'image': 'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=400',
        });
        await db.insert('master_products', {
          'name': 'Blush On Peach Soft',
          'price': 35000,
          'category': 'Make Up',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Mascara Waterproof Black',
          'price': 42000,
          'category': 'Make Up',
          'image': 'https://images.unsplash.com/photo-1560700146-eb7183848210?w=400',
        });

        // --- 2. KATEGORI: KIPAS (6 Produk) ---
        await db.insert('master_products', {
          'name': 'Kipas Mini USB Bunny',
          'price': 35000,
          'category': 'Kipas',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Kipas Genggam Lipat Pink',
          'price': 42000,
          'category': 'Kipas',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Kipas Saku Portable Soft',
          'price': 29000,
          'category': 'Kipas',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Kipas Leher Handsfree Cute',
          'price': 58000,
          'category': 'Kipas',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Kipas Meja Karakter Cat',
          'price': 49000,
          'category': 'Kipas',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Kipas LED Light Compact',
          'price': 38000,
          'category': 'Kipas',
          'image': 'assets/images/logo_header.png',
        });

        // --- 3. KATEGORI: MAHKOTA (6 Produk) ---
        await db.insert('master_products', {
          'name': 'Mahkota Tiara Crystal Shiny',
          'price': 55000,
          'category': 'Mahkota',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Mahkota Mini Princess Cute',
          'price': 48000,
          'category': 'Mahkota',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Mahkota Bunga Pearl White',
          'price': 42000,
          'category': 'Mahkota',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Tiara Silver Bride Queen',
          'price': 68000,
          'category': 'Mahkota',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Mahkota Sirkam Mutiara Pink',
          'price': 35000,
          'category': 'Mahkota',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Crown Aesthetic Rose Gold',
          'price': 60000,
          'category': 'Mahkota',
          'image': 'assets/images/logo_header.png',
        });

        // --- 4. KATEGORI: TAS (6 Produk) ---
        await db.insert('master_products', {
          'name': 'Tas Selempang Mini Pink',
          'price': 65000,
          'category': 'Tas',
          'image': 'https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400',
        });
        await db.insert('master_products', {
          'name': 'Tote Bag Canvas Aesthetic',
          'price': 45000,
          'category': 'Tas',
          'image': 'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=400',
        });
        await db.insert('master_products', {
          'name': 'Tas Kosmetik Ribbon Pink',
          'price': 38000,
          'category': 'Tas',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Ransel Mini Pastel Style',
          'price': 85000,
          'category': 'Tas',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Tas Bahu Shoulder Bag Cute',
          'price': 72000,
          'category': 'Tas',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Dompet Koin Character Soft',
          'price': 22000,
          'category': 'Tas',
          'image': 'assets/images/logo_header.png',
        });

        // --- 5. KATEGORI: BANDU (6 Produk) ---
        await db.insert('master_products', {
          'name': 'Bandana Pita Cute Korea',
          'price': 20000,
          'category': 'Bandu',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Headband Mutiara Elegant',
          'price': 28000,
          'category': 'Bandu',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Bandu Handuk Washing Face',
          'price': 15000,
          'category': 'Bandu',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Bandu Telinga Kucing Cute',
          'price': 22000,
          'category': 'Bandu',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Bandana Kain Bludru Soft',
          'price': 25000,
          'category': 'Bandu',
          'image': 'assets/images/logo_header.png',
        });
        await db.insert('master_products', {
          'name': 'Headband Crown Mini Gold',
          'price': 32000,
          'category': 'Bandu',
          'image': 'assets/images/logo_header.png',
        });
      },
    );
  }

  Future<List<Product>> getProducts({String category = 'Semua'}) async {
    final db = await database;
    List<Map<String, dynamic>> maps;
    if (category == 'Semua') {
      maps = await db.query('master_products');
    } else {
      maps = await db.query(
        'master_products',
        where: 'category = ?',
        whereArgs: [category],
      );
    }
    return List.generate(maps.length, (i) => Product.fromMap(maps[i]));
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('local_cart');
    return List.generate(maps.length, (i) => CartItem.fromMap(maps[i]));
  }

  Future<void> updateCartQuantity(int id, int quantity) async {
    final db = await database;
    await db.update(
      'local_cart',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteCartItem(int id) async {
    final db = await database;
    await db.delete(
      'local_cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> addToCart(Product product) async {
    final db = await database;
    final List<Map<String, dynamic>> existing = await db.query(
      'local_cart',
      where: 'product_id = ?',
      whereArgs: [product.id],
    );

    if (existing.isNotEmpty) {
      int currentQty = existing.first['quantity'] as int;
      int id = existing.first['id'] as int;
      await updateCartQuantity(id, currentQty + 1);
    } else {
      await db.insert('local_cart', {
        'product_id': product.id ?? 0,
        'name': product.name,
        'price': product.price,
        'quantity': 1,
      });
    }
  }
}