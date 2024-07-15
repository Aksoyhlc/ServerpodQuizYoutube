import 'package:serverpod/server.dart';

abstract class DbController<T> {
  Future<T?> add(Session session, T data);
  Future<T?> update(Session session, T data);
  Future<T?> delete(Session session, T data);
  Future<T?> getById(Session session, int data);
  Future<List<T>?> getAll(Session session, {int? limit, int? offset});
}
