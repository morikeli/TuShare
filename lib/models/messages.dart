// Represents the chat data for a ride, including ride details, messages, and group members.
class ChatData {
  final String rideId;
  final String driverName;
  final String driverProfileImage;
  final List<Message> messages;
  final List<User> groupMembers;

  // Creates an instance of [ChatData].
  ChatData({
    required this.rideId,
    required this.driverName,
    required this.driverProfileImage,
    required this.messages,
    required this.groupMembers,
  });

  // Creates a [ChatData] instance from a JSON object.
  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
      rideId: json["ride_id"],
      driverName: json["driver_name"],
      driverProfileImage: json["driver_profile_image"],
      messages: (json["messages"] as List)
          .map((msg) => Message.fromJson(msg))
          .toList(),
      groupMembers: (json["group_members"] as List)
          .map((member) => User.fromJson(member))
          .toList(),
    );
  }
}

// Represents a chat message in the ride-sharing app.
class Message {
  final String id;
  final String content;
  final DateTime timestamp;
  final User sender;

  // Creates an instance of [Message].
  Message({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.sender,
  });

  // Creates a [Message] instance from a JSON object.
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["id"],
      content: json["content"],
      timestamp: DateTime.parse(json["timestamp"]),
      sender: User.fromJson(json["sender"]),
    );
  }
}

// Represents a user in the ride-sharing app.
class User {
  final String id;
  final String firstName;
  final String lastName;
  final String profileImage;

  // Creates an instance of [User].
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
  });

  // Creates a [User] instance from a JSON object.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      profileImage: json["profile_image"],
    );
  }
}

// represents messages for the current user
class UserMessages {
  final String rideID,
      driverName,
      driverProfilePic,
      latestMessage,
      latestTimeStamp;
  final int unreadCount;

  
  UserMessages({
    required this.rideID,
    required this.driverName,
    required this.driverProfilePic,
    required this.latestMessage,
    required this.latestTimeStamp,
    required this.unreadCount,
  });

  factory UserMessages.fromJson(Map<String, dynamic> json) {
    return UserMessages(
      rideID: json['ride_id'],
      driverName: json['driver_name'],
      driverProfilePic: json['driver_profile_image'],
      latestMessage: json['latest_message'],
      latestTimeStamp: json['latest_timestamp'],
      unreadCount: json['unread_count'],
    );
  }
}

class SentMessage {
  final String senderID, messageContent;

  SentMessage({
    required this.senderID,
    required this.messageContent,
  });

  factory SentMessage.fromJson(Map<String, dynamic> json) {
    return SentMessage(
      senderID: json['ride_id'],
      messageContent: json['content']
    );
  }
}
