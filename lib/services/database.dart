import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/accepted_order.dart';
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
    String path = join(await getDatabasesPath(), 'wai5.db');
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
        status TEXT NOT NULL,
        FOREIGN KEY (userId) REFERENCES users (id)
      )
    ''');
    await db.execute('''
      CREATE TABLE accepted_orders (
        delivery_id INTEGER PRIMARY KEY AUTOINCREMENT,
        customer_id INTEGER,
        courier_id INTEGER,
        accepted_time TEXT,
        departure_time TEXT,
        arrival_time TEXT,
        orderNumber TEXT,
        status TEXT,
        FOREIGN KEY (customer_id) REFERENCES users (id),
        FOREIGN KEY (courier_id) REFERENCES users (id),
        FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber)
        FOREIGN KEY (status) REFERENCES orders (status)
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

  Future<List<Order>> getPendingOrders() async {
    // Example: Fetch orders where status is 'pending'
    final db = await instance.database;
    final result =
        await db.query('orders', where: 'status = ?', whereArgs: ['pending']);
    return result.map((json) => Order.fromMap(json)).toList();
  }

  Future<int> updateOrderStatus(int orderId, String status) async {
    Database db = await instance.database;
    return await db.update(
      'orders',
      {'status': status},
      where: 'order_number = ?',
      whereArgs: [orderId],
    );
  }

  Future<int> createAcceptedOrder(AcceptedOrder acceptedOrder) async {
    Database db = await instance.database;
    return await db.insert('accepted_orders', acceptedOrder.toMap());
  }

  Future<List<AcceptedOrder>> getAcceptedOrders() async {
    Database db = await instance.database;
    final results = await db.query('accepted_orders');
    return results.map((json) => AcceptedOrder.fromMap(json)).toList();
  }

  Future<List<AcceptedOrder>> getAcceptedOrdersByCustomerId(
      int customerId) async {
    Database db = await instance.database;
    final results = await db.query('accepted_orders',
        where: 'customer_id = ?', whereArgs: [customerId]);
    return results.map((json) => AcceptedOrder.fromMap(json)).toList();
  }

  Future<List<AcceptedOrder>> getAcceptedOrdersByCourierId(
      int courierId) async {
    Database db = await instance.database;
    final results = await db.query('accepted_orders',
        where: 'courier_id = ?', whereArgs: [courierId]);
    return results.map((json) => AcceptedOrder.fromMap(json)).toList();
  }

  Future<int> finishedOrderStatus(String orderNumber, String status) async {
    Database db = await instance.database;
    return await db.update(
      'accepted_orders',
      {'status': status},
      where: 'orderNumber = ?',
      whereArgs: [orderNumber],
    );
  }
}
