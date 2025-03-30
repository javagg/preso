/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:preso_common/src/protocol/node.dart' as _i3;
import 'package:preso_common/src/protocol/tenantable.dart' as _i4;
import 'package:preso_common/src/protocol/tenant.dart' as _i5;
import 'package:preso_common/src/protocol/user.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'protocol.dart' as _i8;

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

  _i2.Stream<dynamic> echoStream(_i2.Stream<dynamic> stream) =>
      caller.callStreamingServerEndpoint<_i2.Stream<dynamic>, dynamic>(
        'example',
        'echoStream',
        {},
        {'stream': stream},
      );
}

/// {@category Endpoint}
class EndpointNotes extends _i1.EndpointRef {
  EndpointNotes(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notes';

  _i2.Future<List<_i3.Note>> getAllNotes() =>
      caller.callServerEndpoint<List<_i3.Note>>(
        'notes',
        'getAllNotes',
        {},
      );

  _i2.Future<void> updateNote(_i3.Note note) => caller.callServerEndpoint<void>(
        'notes',
        'updateNote',
        {'note': note},
      );

  _i2.Future<void> createNote(_i3.Note note) => caller.callServerEndpoint<void>(
        'notes',
        'createNote',
        {'note': note},
      );

  _i2.Future<void> deleteNote(_i3.Note note) => caller.callServerEndpoint<void>(
        'notes',
        'deleteNote',
        {'note': note},
      );
}

/// {@category Endpoint}
class EndpointStore extends _i1.EndpointRef {
  EndpointStore(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'store';

  _i2.Future<List<_i4.Store>> all() =>
      caller.callServerEndpoint<List<_i4.Store>>(
        'store',
        'all',
        {},
      );

  _i2.Future<_i4.Store?> get() => caller.callServerEndpoint<_i4.Store?>(
        'store',
        'get',
        {},
      );
}

/// {@category Endpoint}
class EndpointTenant extends _i1.EndpointRef {
  EndpointTenant(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tenant';

  _i2.Future<List<_i5.Tenant>> all() =>
      caller.callServerEndpoint<List<_i5.Tenant>>(
        'tenant',
        'all',
        {},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<bool> userInfoUpdate(_i6.User user) =>
      caller.callServerEndpoint<bool>(
        'user',
        'userInfoUpdate',
        {'user': user},
      );

  _i2.Future<_i6.User?> add(_i6.User data) =>
      caller.callServerEndpoint<_i6.User?>(
        'user',
        'add',
        {'data': data},
      );

  _i2.Future<_i6.User?> delete(_i6.User data) =>
      caller.callServerEndpoint<_i6.User?>(
        'user',
        'delete',
        {'data': data},
      );

  _i2.Future<List<_i6.User>?> getAll({
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<List<_i6.User>?>(
        'user',
        'getAll',
        {
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i6.User?> getById(int id) => caller.callServerEndpoint<_i6.User?>(
        'user',
        'getById',
        {'id': id},
      );

  _i2.Future<_i6.User?> getByUserInfoId(int id) =>
      caller.callServerEndpoint<_i6.User?>(
        'user',
        'getByUserInfoId',
        {'id': id},
      );

  _i2.Future<_i6.User?> update(_i6.User data) =>
      caller.callServerEndpoint<_i6.User?>(
        'user',
        'update',
        {'data': data},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
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
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    example = EndpointExample(this);
    notes = EndpointNotes(this);
    store = EndpointStore(this);
    tenant = EndpointTenant(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointExample example;

  late final EndpointNotes notes;

  late final EndpointStore store;

  late final EndpointTenant tenant;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'notes': notes,
        'store': store,
        'tenant': tenant,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
