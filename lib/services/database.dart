import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';
import '../models/order.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'wai.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        userAddress TEXT,
        userPhoneNumber TEXT,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        orderNumber TEXT NOT NULL,
        userPhoneNumber TEXT NOT NULL,
        userLocation TEXT NOT NULL,
        orderDate TEXT NOT NULL,
        orderDestination TEXT NOT NULL,
        FOREIGN KEY (userId) REFERENCES users (id)
      )
    ''');
  }

  Future<int> registerUser(User user) async {
    Database db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> loginUser(String email, String password) async {
    Database db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }

  Future<int> createOrder(Order order) async {
    Database db = await instance.database;
    return await db.insert('orders', order.toMap());
  }

  Future<User?> getUser(String email, String password) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query('users',
        where: 'email = ? AND password =? ', whereArgs: [email, password]);

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Order>> getAllOrders() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> results = await db.query('orders');
    return results.map((json) => Order.fromMap(json)).toList();
  }

  Future<List<Order>> getOrdersByUserId(int userId) async {
    Database db = await instance.database;
    final result =
        await db.query('orders', where: 'userId = ?', whereArgs: [userId]);
    return result.map((json) => Order.fromMap(json)).toList();
  }
}
