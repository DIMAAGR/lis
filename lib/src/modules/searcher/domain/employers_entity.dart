class EmployersEntity {
  final String? name;
  final String? occupation;
  final String? experience;
  final String? localization;
  final double? rating;
  final String? averageRate;
  final String? description;
  final List<ChatEntity> chatMessage;
  final String? imageURL;

  EmployersEntity({
    required this.imageURL,
    required this.name,
    required this.occupation,
    required this.experience,
    required this.localization,
    required this.rating,
    required this.averageRate,
    required this.description,
    required this.chatMessage,
  });

  factory EmployersEntity.fromJson(Map<String, dynamic> json) {
    return EmployersEntity(
      name: json['name'],
      occupation: json['occupation'],
      experience: json['experience'],
      localization: json['localization'],
      rating: json['rating'],
      averageRate: json['averageRate'],
      description: json['description'],
      chatMessage: json['chatMessage'].map<ChatEntity>((m) => ChatEntity.fromJson(m)).toList(),
      imageURL: json['imageUrl'],
    );
  }
}

enum FromWho {
  me,
  you;

  static FromWho fromString(String who) {
    return who == 'me' ? FromWho.me : you;
  }

  bool get isMe => this == me;
  bool get isYou => this == you;
}

class ChatEntity {
  final FromWho fromWho;
  final String message;

  ChatEntity({
    required this.fromWho,
    required this.message,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    print(json);
    return ChatEntity(fromWho: FromWho.fromString(json['who']), message: json['message']);
  }
}
