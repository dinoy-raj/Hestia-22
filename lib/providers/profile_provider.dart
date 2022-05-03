import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier {
  Profile profile = Profile();

  int _page = 0;

  void setUsername(String username) => profile.copyWith(username: username);
  void setEmail(String email) => profile.copyWith(email: email);
  void setName(String name) => profile.copyWith(name: name);
  void setAddress(String address) => profile.copyWith(address: address);
  void setCollege(String college) => profile.copyWith(college: college);
  void setDepartment(String department) =>
      profile.copyWith(department: department);

  int get page => _page;

  int nextPage() {
    _page++;
    _page > 2 ? _page-- : _page;
    notifyListeners();
    return page;
  }

  String? validateStep1() {
    if (profile.username == null ||
        profile.username!.isEmpty ||
        profile.email == null ||
        profile.email!.isEmpty) {
      return 'Cannot be blank.';
    }
    return null;
  }
}

class Profile {
  String? username;
  String? email;
  String? name;
  String? address;
  String? college;
  String? department;

  Profile({
    this.username,
    this.email,
    this.name,
    this.address,
    this.college,
    this.department,
  });

  Profile copyWith({
    String? username,
    String? email,
    String? name,
    String? address,
    String? college,
    String? department,
  }) {
    return Profile(
      username: username ?? this.username,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
      college: college ?? this.college,
      department: department ?? this.department,
    );
  }
}
