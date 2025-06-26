import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../dto/dto_video_aula.dart';
import 'database_connection.dart';

class DaoVideoAula {
  Future<int> inserir(VideoAulaDto video) async {
    final db = await DatabaseConnection().database;
    return db.insert('video_aula', video.toJson());
  }

  Future<List<VideoAulaDto>> listarTodos() async {
    final db = await DatabaseConnection().database;
    final maps = await db.query('video_aula');
    return maps.map((e) => VideoAulaDto.fromJson(e)).toList();
  }

  Future<int> atualizar(VideoAulaDto video) async {
    final db = await DatabaseConnection().database;
    return db.update('video_aula', video.toJson(),
        where: 'id = ?', whereArgs: [video.id]);
  }

  Future<int> excluir(int id) async {
    final db = await DatabaseConnection().database;
    return db.delete('video_aula', where: 'id = ?', whereArgs: [id]);
  }
}
