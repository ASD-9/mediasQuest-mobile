class CreatorModel {
  final int id;
  final String name;
  final int mediasCompleted;
  final int mediasNotCompleted;

  CreatorModel({
    required this.id,
    required this.name,
    required this.mediasCompleted,
    required this.mediasNotCompleted
  });

  factory CreatorModel.fromJson(Map<String, dynamic> json) {
    return CreatorModel(
      id: json['id'],
      name: json['name'],
      mediasCompleted: json['medias_completed'],
      mediasNotCompleted: json['medias_not_completed']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'medias_completed': mediasCompleted,
    'medias_not_completed': mediasNotCompleted
  };
}
