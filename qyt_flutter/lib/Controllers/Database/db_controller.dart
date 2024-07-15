import 'package:qyt_client/qyt_client.dart';

abstract class DbController<T> {
  Future<(T?, DbException?)> add(T data);
  Future<(T?, DbException?)> update(T data);
  Future<(T?, DbException?)> delete(T data);
  Future<(T?, DbException?)> getById(int data);
  Future<(List<T>?, DbException?)> getAll({int? limit, int? offset});
}
