import 'package:preso_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class MaintenanceEndpoint extends Endpoint {
  @override
  Set<Scope> get requiredScopes => {Scope.admin};

  Future<void> seed(Session session) async {
    var master = await Tenant.db.insertRow(
        session, Tenant(name: "master", description: "The master tenant"));
    var username = "admin";
    var email = "admin@nowhere.com";
    var password = "admin";
    var userInfo = await UserInfo.db.insertRow(
        session,
        UserInfo(
            userIdentifier: username,
            userName: username,
            email: email,
            created: DateTime.now(),
            scopeNames: [Scope.admin.name!],
            blocked: false));
    var passHash = await AuthConfig.current.passwordHashGenerator(password);
    await EmailAuth.db.insertRow(
        session, EmailAuth(userId: userInfo.id!, email: email, hash: passHash));
    await User.db
        .insertRow(session, User(name: username, userInfoId: userInfo.id!));

    Address? address = null;
    address = await Address.db.insertRow(
      session,
      Address(
        province: "湖北",
        city: "武汉",
        district: "洪水区",
        street: "关山大道301号",
      ),
    );
    var store = await Store.db.insertRow(
      session,
      Store(
        tenantId: master.id,
        name: "关山大道示范店",
        description: "武汉关山大道上的一家示范店",
        addressId: address.id!,
        address: address,
        latitude: 23.0,
        longitude: 34.916667,
        tags: "24小时;免打扰;主打月付",
        area: 625,
        services: "水;电;网;电视;空调;冰箱;洗衣机;热水器;沙发;床;桌子;椅子;沙发;床;桌子;椅子",
        equipments: "深蹲架;史密斯机",
        facilities: "wifi;免费停车;饮水机",
        wifi: "zhineng24hours", businessHours: '00:00-24:00',
      ),
    );
    var trainer1 = await Trainer.db.insertRow(
      session,
      Trainer(
        name: "冠希",
        description: "冠希是一名专业的健身教练", gender: '男  ', age: 30, servingHours: '09:00-21:00', 
        servingCity: "武汉", phone: "13123450987", classFee: 290.0, headshot: '', photos: '', videos: '',
      )
    );
    var trainer2 = await Trainer.db.insertRow(
      session,
      Trainer(
        name: "吴彦祖",
        description: "王老师是一名专业的健身教练", gender: '男  ', age: 30, servingHours: '09:00-21:00', 
        servingCity: "武汉", phone: "13123450987", classFee: 290.0, headshot: '', photos: '', videos: '',
      )
    );
  }
}
