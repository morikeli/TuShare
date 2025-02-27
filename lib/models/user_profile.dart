class UserProfile {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String mobileNumber;
  final String profilePicture;
  final String bio;
  final String facebookHandle;
  final String instagramHandle;
  final String twitterHandle;
  final String workAddress;
  final String homeAddress;
  final String dateJoined;

  UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.mobileNumber,
    required this.profilePicture,
    required this.dateJoined,
    required this.facebookHandle,
    required this.instagramHandle,
    required this.twitterHandle,
    required this.workAddress,
    required this.homeAddress,
    required this.bio,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'],
      bio: json['bio'],
      mobileNumber: json['mobile_number'],
      facebookHandle: json['facebook_handle'],
      instagramHandle: json['instagram_handle'],
      twitterHandle: json['twitter_handle'],
      workAddress: json['work_address'],
      homeAddress: json['home_address'],
      dateJoined: json['date_joined'],
      profilePicture: json['profile_image'],

    );
  }
}
