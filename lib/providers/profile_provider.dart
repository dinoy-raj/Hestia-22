import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier {
  Profile profile = Profile();

  int _page = 0;

  void setUsername(String username) =>
      profile = profile.copyWith(username: username);
  void setEmail(String email) => profile = profile.copyWith(email: email);
  void setName(String name) => profile = profile.copyWith(name: name);
  void setAddress(String address) =>
      profile = profile.copyWith(address: address);
  void setCollege(String college) =>
      profile = profile.copyWith(college: college);
  void setDepartment(String department) =>
      profile = profile.copyWith(department: department);

  int get page => _page;

  set page(int page) {
    _page = page;
    notifyListeners();
  }

  String? userNameError;
  String? emailError;
  String? nameError;
  String? addressError;
  String? collegeError;
  String? departmentError;

  bool validateStep1() {
    if (profile.username == null || profile.username!.isEmpty) {
      userNameError = 'username can not be empty';
      notifyListeners();
      return false;
    } else {
      userNameError = null;
      notifyListeners();
    }
    if (profile.email == null || profile.email!.isEmpty) {
      emailError = 'email can not be empty';
      notifyListeners();
      return false;
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(profile.email!);
      if (!emailValid) {
        emailError = 'invalid email fomat';
        notifyListeners();
        return false;
      }
      emailError = null;
      notifyListeners();
    }
    return true;
  }

  bool validateStep2() {
    if (profile.name == null || profile.name!.isEmpty) {
      nameError = 'name can not be empty';
      notifyListeners();
      return false;
    } else {
      nameError = null;
      notifyListeners();
    }
    if (profile.address == null || profile.address!.isEmpty) {
      addressError = 'address can not be empty';
      notifyListeners();
      return false;
    } else {
      addressError = null;
      notifyListeners();
    }
    return true;
  }

  bool validateStep3() {
    if (profile.college == null || profile.college!.isEmpty) {
      collegeError = 'college can not be empty';
      notifyListeners();
      return false;
    } else {
      collegeError = null;
      notifyListeners();
    }
    if (profile.department == null || profile.department!.isEmpty) {
      departmentError = 'department can not be empty';
      notifyListeners();
      return false;
    } else {
      departmentError = null;
      notifyListeners();
    }
    return true;
  }

  void post() {
    print(profile.toString());
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

  @override
  String toString() {
    return 'Profile(username: $username, email: $email, name: $name, address: $address, college: $college, department: $department)';
  }
}
