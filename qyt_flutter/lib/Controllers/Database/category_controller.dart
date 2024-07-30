import 'package:qyt_client/qyt_client.dart';
import 'package:qyt_flutter/Mixins/db_helper.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';

import 'db_controller.dart';

class CategoryController with DbHelper, StateTools implements DbController<Category> {
  @override
  Future<(Category?, DbException?)> add(Category data) async {
    return await handleAction(() => gc.client.category.add(data));
  }

  @override
  Future<(Category?, DbException?)> delete(Category data) async {
    return await handleAction(() => gc.client.category.delete(data));
  }

  @override
  Future<(List<Category>?, DbException?)> getAll({int? limit, int? offset}) async {
    return await handleAction(() => gc.client.category.getAll(limit: limit, offset: offset));
  }

  @override
  Future<(Category?, DbException?)> getById(int data) async {
    return await handleAction(() => gc.client.category.getById(data));
  }

  @override
  Future<(Category?, DbException?)> update(Category data) async {
    return await handleAction(() => gc.client.category.update(data));
  }
}
