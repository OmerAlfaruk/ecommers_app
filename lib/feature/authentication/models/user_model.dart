import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/utils/formatters/formatter.dart';

class UserModel {
  /// keep those values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// constructor for user Model
  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture});

  /// Helper function to get the full name;
  String get fullName => '$firstName $lastName';

  /// Helper function to get formatted phone Number;
  String get formattedPhoneNo => OFormatter.formatPhoneNumber(phoneNumber);

  /// static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// static function to generate a username

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    String camelCaseUsername = '$firstName$lastName';
    String UsernameWithprefix = "cat_$camelCaseUsername";
    return UsernameWithprefix;
  }

  /// static function to create on empty user model

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      userName: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  /// Convert Model to Json structure to store Data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a from firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          userName: data['UserName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
