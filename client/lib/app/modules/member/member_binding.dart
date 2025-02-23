import 'package:get/get.dart';

import 'member_controller.dart';

class MemberBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<MemberViewController>(
        () => MemberViewController(),
      )
    ];
  }
}
