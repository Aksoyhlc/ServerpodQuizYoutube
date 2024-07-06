import 'package:qyt_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/module.dart';

class UserEndpoint extends Endpoint {
  Future<bool> userInfoUpdate(Session session, User user) async {
    try {
      bool res = await session.isUserSignedIn;

      if (!res) {
        return false;
      }

      int? id = (await session.authenticated)?.userId;

      if (id == null) {
        return false;
      }

      var userInfo = await Users.findUserByUserId(session, id);

      if (userInfo == null) {
        return false;
      }

      var userInfoData = await User.db
          .findFirstRow(session, where: (e) => e.userInfoId.equals(id));

      if (userInfoData == null) {
        await User.db.insertRow(session, user);
      } else {
        User result =
            await User.db.updateRow(session, user.copyWith(userInfo: userInfo));
      }

      return true;
    } catch (e, s) {
      print(e);
      print(s);
      return false;
    }
  }
}
