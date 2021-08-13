class AppUser {
  late final String? uid;
  AppUser({this.uid});
}

class AppUserData {
  final String? uid;
  final String? name;
  final int? userCount;

  AppUserData({this.uid, this.name, this.userCount});
}
