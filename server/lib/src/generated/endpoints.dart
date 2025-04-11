/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/notes_endpoint.dart' as _i3;
import '../endpoints/store_endpoint.dart' as _i4;
import '../endpoints/tenant_endpoint.dart' as _i5;
import '../endpoints/user_endpoint.dart' as _i6;
import 'package:preso_server/src/generated/note.dart' as _i7;
import 'package:preso_server/src/generated/tenant.dart' as _i8;
import 'package:preso_server/src/generated/user.dart' as _i9;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i10;

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
      'notes': _i3.NotesEndpoint()
        ..initialize(
          server,
          'notes',
          null,
        ),
      'store': _i4.StoreEndpoint()
        ..initialize(
          server,
          'store',
          null,
        ),
      'tenant': _i5.TenantEndpoint()
        ..initialize(
          server,
          'tenant',
          null,
        ),
      'user': _i6.UserEndpoint()
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
        ),
        'echoStream': _i1.MethodStreamConnector(
          name: 'echoStream',
          params: {},
          streamParams: {
            'stream': _i1.StreamParameterDescription<dynamic>(
              name: 'stream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['example'] as _i2.ExampleEndpoint).echoStream(
            session,
            streamParams['stream']!.cast<dynamic>(),
          ),
        ),
      },
    );
    connectors['notes'] = _i1.EndpointConnector(
      name: 'notes',
      endpoint: endpoints['notes']!,
      methodConnectors: {
        'getAllNotes': _i1.MethodConnector(
          name: 'getAllNotes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notes'] as _i3.NotesEndpoint).getAllNotes(session),
        ),
        'updateNote': _i1.MethodConnector(
          name: 'updateNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i7.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notes'] as _i3.NotesEndpoint).updateNote(
            session,
            params['note'],
          ),
        ),
        'createNote': _i1.MethodConnector(
          name: 'createNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i7.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notes'] as _i3.NotesEndpoint).createNote(
            session,
            params['note'],
          ),
        ),
        'deleteNote': _i1.MethodConnector(
          name: 'deleteNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i7.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notes'] as _i3.NotesEndpoint).deleteNote(
            session,
            params['note'],
          ),
        ),
      },
    );
    connectors['store'] = _i1.EndpointConnector(
      name: 'store',
      endpoint: endpoints['store']!,
      methodConnectors: {
        'all': _i1.MethodConnector(
          name: 'all',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['store'] as _i4.StoreEndpoint).all(session),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['store'] as _i4.StoreEndpoint).get(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['tenant'] = _i1.EndpointConnector(
      name: 'tenant',
      endpoint: endpoints['tenant']!,
      methodConnectors: {
        'all': _i1.MethodConnector(
          name: 'all',
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
              (endpoints['tenant'] as _i5.TenantEndpoint).all(
            session,
            params['limit'],
            params['offset'],
          ),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tenant'] as _i5.TenantEndpoint).get(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'tenant': _i1.ParameterDescription(
              name: 'tenant',
              type: _i1.getType<_i8.Tenant>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tenant'] as _i5.TenantEndpoint).update(
            session,
            params['tenant'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'tenant': _i1.ParameterDescription(
              name: 'tenant',
              type: _i1.getType<_i8.Tenant>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tenant'] as _i5.TenantEndpoint).create(
            session,
            params['tenant'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'tenant': _i1.ParameterDescription(
              name: 'tenant',
              type: _i1.getType<_i8.Tenant>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['tenant'] as _i5.TenantEndpoint).delete(
            session,
            params['tenant'],
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
              type: _i1.getType<_i9.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i6.UserEndpoint).userInfoUpdate(
            session,
            params['user'],
          ),
        ),
        'add': _i1.MethodConnector(
          name: 'add',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i9.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i6.UserEndpoint).add(
            session,
            params['data'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i9.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i6.UserEndpoint).delete(
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
              (endpoints['user'] as _i6.UserEndpoint).getAll(
            session,
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'getById': _i1.MethodConnector(
          name: 'getById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i6.UserEndpoint).getById(
            session,
            params['id'],
          ),
        ),
        'getByUserInfoId': _i1.MethodConnector(
          name: 'getByUserInfoId',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i6.UserEndpoint).getByUserInfoId(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'data': _i1.ParameterDescription(
              name: 'data',
              type: _i1.getType<_i9.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i6.UserEndpoint).update(
            session,
            params['data'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i10.Endpoints()..initializeEndpoints(server);
  }
}
