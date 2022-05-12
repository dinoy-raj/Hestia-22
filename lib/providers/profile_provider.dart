import 'package:flutter/foundation.dart';
import 'package:hestia22/main.dart';

class ProfileProvider with ChangeNotifier {
  Profile profile = Profile();

  int _page = 0;

  void setUsername(String username) =>
      profile = profile.copyWith(name: username);
  void setEmail(String email) => profile = profile.copyWith(phone: email);
  void setCollege(String college) =>
      profile = profile.copyWith(college: college);
  void setDepartment(String department) =>
      profile = profile.copyWith(department: department);

  int get page => _page;

  set page(int page) {
    _page = page;
    notifyListeners();
  }

  String? nameError;
  String? phoneError;
  String? collegeError;
  String? departmentError;

  bool validateStep1() {
    if (profile.name == null || profile.name!.isEmpty) {
      nameError = 'Full name can not be empty';
      notifyListeners();
      return false;
    } else {
      nameError = null;
      notifyListeners();
    }
    if (profile.phone == null || profile.phone!.isEmpty) {
      phoneError = 'Phone number cannot be empty';
      notifyListeners();
      return false;
    } else if (profile.phone!.length != 10) {
      phoneError = 'Invalid phone number (Do not add 0 or +91)';
      notifyListeners();
      return false;
    }
    {
      bool emailValid = RegExp(r"^[0-9]").hasMatch(profile.phone!);
      if (!emailValid) {
        phoneError = 'Invalid phone number';
        notifyListeners();
        return false;
      }
      phoneError = null;
      notifyListeners();
    }
    profile.phone = "+91" + profile.phone!;
    return true;
  }

  bool validateStep2() {
    if (profile.college == null || profile.college!.isEmpty) {
      collegeError = 'College cannot be empty';
      notifyListeners();
      return false;
    } else {
      collegeError = null;
      notifyListeners();
    }
    if (profile.department == null || profile.department!.isEmpty) {
      departmentError = 'Department cannot be empty';
      notifyListeners();
      return false;
    } else {
      departmentError = null;
      notifyListeners();
    }
    return true;
  }

  void post() async {
    await auth.updateProfile(
        profile.name!, profile.phone!, profile.college!, profile.department!);
  }
}

class Profile {
  String? name;
  String? phone;
  String? college;
  String? department;

  Profile({
    this.name,
    this.phone,
    this.college,
    this.department,
  });

  Profile copyWith({
    String? name,
    String? phone,
    String? college,
    String? department,
  }) {
    return Profile(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      college: college ?? this.college,
      department: department ?? this.department,
    );
  }

  @override
  String toString() {
    return 'Profile(name: $name, email: $phone,  college: $college, department: $department)';
  }
}
