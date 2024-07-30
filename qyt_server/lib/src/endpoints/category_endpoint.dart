import 'package:qyt_server/src/generated/protocol.dart';
import 'package:qyt_server/src/mixin/db_helper.dart';
import 'package:serverpod/server.dart';

import 'db_controller.dart';

class CategoryEndpoint extends Endpoint with DbHelper implements DbController<Category> {
  @override
  Future<Category?> add(Session session, Category data) async {
    return await handleAction(session, () async {
      var result = await Category.db.insertRow(session, data);

      for (String el in data.questionIds ?? []) {
        await CategoryQuestion.db.insertRow(
          session,
          CategoryQuestion(
            categoryId: data.id!,
            questionId: int.parse(el),
            createdAt: DateTime.now(),
          ),
        );
      }

      return result;
    });
  }

  @override
  Future<Category?> delete(Session session, Category data) async {
    return await handleAction(session, () => Category.db.deleteRow(session, data));
  }

  @override
  Future<List<Category>?> getAll(Session session, {int? limit, int? offset}) async {
    return await handleAction(
      session,
      () {
        return Category.db.find(
          session,
          limit: limit,
          offset: offset,
          orderBy: (e) => e.id,
          orderDescending: true,
          include: Category.include(
            questions: CategoryQuestion.includeList(),
          ),
        );
      },
    );
  }

  @override
  Future<Category?> getById(Session session, int data) async {
    return await handleAction(session, () => Category.db.findById(session, data));
  }

  @override
  Future<Category?> update(Session session, Category data) {
    return handleAction(session, () async {
      await Category.db.updateRow(session, data);

      await CategoryQuestion.db.deleteWhere(session, where: (e) => e.categoryId.equals(data.id));

      for (String el in data.questionIds ?? []) {
        await CategoryQuestion.db.insertRow(
          session,
          CategoryQuestion(
            categoryId: data.id!,
            questionId: int.parse(el),
            createdAt: DateTime.now(),
          ),
        );
      }

      return data;
    });
  }
}
