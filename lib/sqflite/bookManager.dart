import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'book.dart';

class BookSqlite {
  Database db;

  openSqlite() async {
    // 获取数据库文件的存储路径
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

//根据数据库文件路径和数据库版本号创建数据库表
    db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            CREATE TABLE $tableBook (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT,
            $columnAuthor TEXT,
            $columnPrice REAL,
            $columnPublishingHouse TEXT)
          ''');
        });
  }
  // 插入一条书籍数据
  Future<Book> insert(Book book) async {
    book.id = await db.insert(tableBook, book.toMap());
    return book;
  }

  // 查找所有书籍信息
  Future<List<Book>> queryAll() async {
    List<Map> maps = await db.query(tableBook, columns: [
      columnId,
      columnName,
      columnAuthor,
      columnPrice,
      columnPublishingHouse
    ]);

    if (maps == null || maps.length == 0) {
      return null;
    }

    List<Book> books = [];
    for (int i = 0; i < maps.length; i++) {
      books.add(Book.fromMap(maps[i]));
    }
    return books;
  }

  // 根据ID查找书籍信息
  Future<Book> getBook(int id) async {
    List<Map> maps = await db.query(tableBook,
        columns: [
          columnId,
          columnName,
          columnAuthor,
          columnPrice,
          columnPublishingHouse
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Book.fromMap(maps.first);
    }
    return null;
  }

  // 根据ID删除书籍信息
  Future<int> delete(int id) async {
    return await db.delete(tableBook, where: '$columnId = ?', whereArgs: [id]);
  }

  // 更新书籍信息
  Future<int> update(Book book) async {
    return await db.update(tableBook, book.toMap(),
        where: '$columnId = ?', whereArgs: [book.id]);
  }

  // 记得及时关闭数据库，防止内存泄漏
  close() async {
    await db.close();
  }
}
