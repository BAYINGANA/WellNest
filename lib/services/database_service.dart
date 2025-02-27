import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user.dart';
import '../models/journal_entry.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() => _instance;

  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('wellnest.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE users (
      id $idType,
      full_name $textType,
      email $textType UNIQUE,
      password $textType
    )
    ''');

    await db.execute('''
    CREATE TABLE journal_entries (
      id $idType,
      date $textType,
      mood $textType,
      mood_color INTEGER NOT NULL,
      content $textType
    )
    ''');
  }

  // --- User Authentication Methods ---

  // Register a new user
  Future<int> registerUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  // Login: Check if user exists
  Future<User?> loginUser(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null; // No user found
  }

  // --- Journal Entry Methods ---
  Future<int> insertJournalEntry(JournalEntry entry) async {
    final db = await database;
    return await db.insert('journal_entries', entry.toMap());
  }

  Future<List<JournalEntry>> getJournalEntries() async {
    final db = await database;
    final result = await db.query('journal_entries', orderBy: 'date DESC');
    return result.map((json) => JournalEntry.fromMap(json)).toList();
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
