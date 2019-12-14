import 'package:rideal/models/user.dart';

class SignedUser {
  static User signedUser = new User();
  
  static void setSignedUser(User user) {
    signedUser = user;
  }

  static User getSignedUser() {
    return signedUser;
  }
}