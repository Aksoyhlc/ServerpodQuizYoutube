/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/question_endpoint.dart' as _i3;
import '../endpoints/user_endpoint.dart' as _i4;
import 'package:qyt_server/src/generated/question.dart' as _i5;
import 'package:qyt_server/src/generated/user.dart' as _i6;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'question': _i3.QuestionEndpoint()
        ..initialize(
          server,
          'question',
          null,
        ),
      'user': _i4.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['question'] = _i1.EndpointConnector(
      name: 'question',
      endpoint: endpoints['question']!,
      methodConnectors: {
        'add': _i1.MethodConnector(
          name: 'add',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i5.Question>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i3.QuestionEndpoint).add(
            session,
            params['data'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i5.Question>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i3.QuestionEndpoint).update(
            session,
            params['data'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i5.Question>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i3.QuestionEndpoint).delete(
            session,
            params['data'],
          ),
        ),
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i3.QuestionEndpoint).getAll(
            session,
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['question'] as _i3.QuestionEndpoint).getById(
            session,
            params['data'],
          ),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'userInfoUpdate': _i1.MethodConnector(
          name: 'userInfoUpdate',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i6.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i4.UserEndpoint).userInfoUpdate(
            session,
            params['user'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i7.Endpoints()..initializeEndpoints(server);
  }
}
