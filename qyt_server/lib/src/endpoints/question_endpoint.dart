import 'package:qyt_server/src/endpoints/db_controller.dart';
import 'package:qyt_server/src/generated/protocol.dart';
import 'package:qyt_server/src/mixin/db_helper.dart';
import 'package:serverpod/serverpod.dart';

class QuestionEndpoint extends Endpoint with DbHelper implements DbController<Question> {
  @override
  Future<Question?> add(Session session, Question data) async {
    return await handleAction(session, () => Question.db.insertRow(session, data));
  }

  @override
  Future<Question?> update(Session session, Question data) async {
    return await handleAction(session, () => Question.db.updateRow(session, data));
  }

  @override
  Future<Question?> delete(Session session, Question data) async {
    return await handleAction(session, () => Question.db.deleteRow(session, data));
  }

  @override
  Future<List<Question>?> getAll(
    Session session, {
    int? limit,
    int? offset,
    int? categoryId,
    int? quizId,
  }) async {
    return await handleAction(
      session,
      () {
        WhereExpressionBuilder<QuestionTable>? where;

        if (categoryId != null) {
          where = (e) => e.categories.any((c) => c.categoryId.equals(categoryId));
        }

        if (quizId != null) {
          where = (e) => e.quizs.any((q) => q.quizId.equals(quizId));
        }

        return Question.db.find(
          session,
          limit: limit,
          offset: offset,
          orderBy: (e) => e.id,
          orderDescending: true,
          where: where,
          include: Question.include(
            quizs: QuizQuestion.includeList(),
            categories: CategoryQuestion.includeList(),
          ),
        );
      },
    );
  }

  @override
  Future<Question?> getById(Session session, int data) async {
    return await handleAction(session, () => Question.db.findById(session, data));
  }
}
