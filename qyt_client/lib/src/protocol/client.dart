/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:qyt_client/src/protocol/category/category.dart' as _i3;
import 'package:qyt_client/src/protocol/question.dart' as _i4;
import 'package:qyt_client/src/protocol/user.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<_i3.Category?> add(_i3.Category data) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'add',
        {'data': data},
      );

  _i2.Future<_i3.Category?> delete(_i3.Category data) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'delete',
        {'data': data},
      );

  _i2.Future<List<_i3.Category>?> getAll({
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<List<_i3.Category>?>(
        'category',
        'getAll',
        {
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i3.Category?> getById(int data) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'getById',
        {'data': data},
      );

  _i2.Future<_i3.Category?> update(_i3.Category data) =>
      caller.callServerEndpoint<_i3.Category?>(
        'category',
        'update',
        {'data': data},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointQuestion extends _i1.EndpointRef {
  EndpointQuestion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'question';

  _i2.Future<_i4.Question?> add(_i4.Question data) =>
      caller.callServerEndpoint<_i4.Question?>(
        'question',
        'add',
        {'data': data},
      );

  _i2.Future<_i4.Question?> update(_i4.Question data) =>
      caller.callServerEndpoint<_i4.Question?>(
        'question',
        'update',
        {'data': data},
      );

  _i2.Future<_i4.Question?> delete(_i4.Question data) =>
      caller.callServerEndpoint<_i4.Question?>(
        'question',
        'delete',
        {'data': data},
      );

  _i2.Future<List<_i4.Question>?> getAll({
    int? limit,
    int? offset,
    int? categoryId,
    int? quizId,
  }) =>
      caller.callServerEndpoint<List<_i4.Question>?>(
        'question',
        'getAll',
        {
          'limit': limit,
          'offset': offset,
          'categoryId': categoryId,
          'quizId': quizId,
        },
      );

  _i2.Future<_i4.Question?> getById(int data) =>
      caller.callServerEndpoint<_i4.Question?>(
        'question',
        'getById',
        {'data': data},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<bool> userInfoUpdate(_i5.User user) =>
      caller.callServerEndpoint<bool>(
        'user',
        'userInfoUpdate',
        {'user': user},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    category = EndpointCategory(this);
    example = EndpointExample(this);
    question = EndpointQuestion(this);
    user = EndpointUser(this);
    modules = _Modules(this);
  }

  late final EndpointCategory category;

  late final EndpointExample example;

  late final EndpointQuestion question;

  late final EndpointUser user;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'category': category,
        'example': example,
        'question': question,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
