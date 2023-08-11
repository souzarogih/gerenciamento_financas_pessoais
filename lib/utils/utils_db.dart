import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'dart:developer' as dev;

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(
        dbPath,
        'gerenciador_gastos_app.db',
      ),
      onCreate: (db, version) {
        _createDb(db);
      },
      version: 1,
    );
  }

  static void _createDb(sql.Database db) {
    dev.log('${DateTime.now()} - Início da criação da tabela conta.');
    db.execute("""
CREATE TABLE conta(id INTEGER PRIMARY KEY AUTOINCREMENT,
nome VARCHAR(50),
valor REAL)
""");
  }

  static Future<void> insereDados(
      String table, Map<String, dynamic> dados) async {
    dev.log('${DateTime.now()} - Inserindo dados na tabela $table.');
    final db = await DbUtil.database();
    print(await db.insert(
      table,
      dados,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    ));
    dev.log(
        '${DateTime.now()} - Finalizando o insert dos dados na tabela $table.');
  }

  static Future<List<Map<String, dynamic>>> pegaDados(String table) async {
    dev.log('${DateTime.now()} - Consultando dados na tabela $table.');
    final db = await DbUtil.database();

    return db.query(table);
  }
}
