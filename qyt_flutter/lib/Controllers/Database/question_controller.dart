import 'package:qyt_client/qyt_client.dart';
import 'package:qyt_flutter/Controllers/Database/db_controller.dart';
import 'package:qyt_flutter/Mixins/db_helper.dart';
import 'package:qyt_flutter/Mixins/state_tools.dart';

class QuestionDbController
    with DbHelper, StateTools
    implements DbController<Question> {
  @override
  Future<(Question?, DbException?)> add(Question data) async {
    return await handleAction(() => gc.client.question.add(data));
  }

  @override
  Future<(Question?, DbException?)> delete(Question data) async {
    return await handleAction(() => gc.client.question.delete(data));
  }

  @override
  Future<(List<Question>?, DbException?)> getAll(
      {int? limit, int? offset}) async {
    return await handleAction(
      () => gc.client.question.getAll(limit: limit, offset: offset),
    );
  }

  @override
  Future<(Question?, DbException?)> getById(int data) async {
    return await handleAction(() => gc.client.question.getById(data));
  }

  @override
  Future<(Question?, DbException?)> update(Question data) async {
    return await handleAction(() => gc.client.question.update(data));
  }
}
