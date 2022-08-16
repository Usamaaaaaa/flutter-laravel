// ignore_for_file: file_names use, file_names

/////// not use /////////////////
class Profile {
  int id;
  String fname;
  String lname;
  String email;
  String phone;
  String image;
  String membership;
  Profile(
      {this.id,
      this.fname,
      this.lname,
      this.email,
      this.phone,
      this.image,
      this.membership});
  Profile.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        fname = res['name'],
        lname = res['lname'],
        email = res['email'],
        phone = res['phone'],
        image = res['image'],
        membership = res['membership'];
  Map<String, Object> toMap() {
    return {
      'id': id,
      'fname': fname,
      'lname': lname,
      'email': email,
      'phone': phone,
      'membership': membership,
      'image': image
    };
  }
}
