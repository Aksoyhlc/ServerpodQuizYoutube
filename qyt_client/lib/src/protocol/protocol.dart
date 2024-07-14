/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'category/category.dart' as _i2;
import 'category/category_question.dart' as _i3;
import 'example.dart' as _i4;
import 'question.dart' as _i5;
import 'quiz/quiz.dart' as _i6;
import 'quiz/quiz_question.dart' as _i7;
import 'quiz/quiz_status.dart' as _i8;
import 'quiz/quiz_type.dart' as _i9;
import 'quiz_result/quiz_result.dart' as _i10;
import 'quiz_result/quiz_result_type.dart' as _i11;
import 'user.dart' as _i12;
import 'protocol.dart' as _i13;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i14;
export 'category/category.dart';
export 'category/category_question.dart';
export 'example.dart';
export 'question.dart';
export 'quiz/quiz.dart';
export 'quiz/quiz_question.dart';
export 'quiz/quiz_status.dart';
export 'quiz/quiz_type.dart';
export 'quiz_result/quiz_result.dart';
export 'quiz_result/quiz_result_type.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Category) {
      return _i2.Category.fromJson(data) as T;
    }
    if (t == _i3.CategoryQuestion) {
      return _i3.CategoryQuestion.fromJson(data) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data) as T;
    }
    if (t == _i5.Question) {
      return _i5.Question.fromJson(data) as T;
    }
    if (t == _i6.Quiz) {
      return _i6.Quiz.fromJson(data) as T;
    }
    if (t == _i7.QuizQuestion) {
      return _i7.QuizQuestion.fromJson(data) as T;
    }
    if (t == _i8.QuizStatus) {
      return _i8.QuizStatus.fromJson(data) as T;
    }
    if (t == _i9.QuizType) {
      return _i9.QuizType.fromJson(data) as T;
    }
    if (t == _i10.QuizResult) {
      return _i10.QuizResult.fromJson(data) as T;
    }
    if (t == _i11.QuizResultType) {
      return _i11.QuizResultType.fromJson(data) as T;
    }
    if (t == _i12.User) {
      return _i12.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Category?>()) {
      return (data != null ? _i2.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CategoryQuestion?>()) {
      return (data != null ? _i3.CategoryQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Question?>()) {
      return (data != null ? _i5.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Quiz?>()) {
      return (data != null ? _i6.Quiz.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.QuizQuestion?>()) {
      return (data != null ? _i7.QuizQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.QuizStatus?>()) {
      return (data != null ? _i8.QuizStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.QuizType?>()) {
      return (data != null ? _i9.QuizType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.QuizResult?>()) {
      return (data != null ? _i10.QuizResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.QuizResultType?>()) {
      return (data != null ? _i11.QuizResultType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.User?>()) {
      return (data != null ? _i12.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i13.CategoryQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.CategoryQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.CategoryQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.CategoryQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.QuizQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.QuizQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.QuizQuestion>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.QuizQuestion>(e))
              .toList()
          : null) as dynamic;
    }
    try {
      return _i14.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i14.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Category) {
      return 'Category';
    }
    if (data is _i3.CategoryQuestion) {
      return 'CategoryQuestion';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.Question) {
      return 'Question';
    }
    if (data is _i6.Quiz) {
      return 'Quiz';
    }
    if (data is _i7.QuizQuestion) {
      return 'QuizQuestion';
    }
    if (data is _i8.QuizStatus) {
      return 'QuizStatus';
    }
    if (data is _i9.QuizType) {
      return 'QuizType';
    }
    if (data is _i10.QuizResult) {
      return 'QuizResult';
    }
    if (data is _i11.QuizResultType) {
      return 'QuizResultType';
    }
    if (data is _i12.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i14.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i2.Category>(data['data']);
    }
    if (data['className'] == 'CategoryQuestion') {
      return deserialize<_i3.CategoryQuestion>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i5.Question>(data['data']);
    }
    if (data['className'] == 'Quiz') {
      return deserialize<_i6.Quiz>(data['data']);
    }
    if (data['className'] == 'QuizQuestion') {
      return deserialize<_i7.QuizQuestion>(data['data']);
    }
    if (data['className'] == 'QuizStatus') {
      return deserialize<_i8.QuizStatus>(data['data']);
    }
    if (data['className'] == 'QuizType') {
      return deserialize<_i9.QuizType>(data['data']);
    }
    if (data['className'] == 'QuizResult') {
      return deserialize<_i10.QuizResult>(data['data']);
    }
    if (data['className'] == 'QuizResultType') {
      return deserialize<_i11.QuizResultType>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i12.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
