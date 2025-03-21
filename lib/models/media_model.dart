import 'package:mediasquest/models/role_model.dart';
import 'package:mediasquest/models/status_model.dart';
import 'package:mediasquest/models/type_model.dart';

class MediaModel {
  final int id;
  final String name;
  final StatusModel status;
  final TypeModel type;
  final RoleModel? role;

  MediaModel({
    required this.id,
    required this.name,
    required this.status,
    required this.type,
    this.role
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'],
      name: json['name'],
      status: StatusModel.fromJson(json['status']),
      type: TypeModel.fromJson(json['type']),
      role: (json['role'] as Map).isEmpty ? null : RoleModel.fromJson(json['role']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'status': status.toJson(),
    'type': type.toJson(),
    'role': role?.toJson(),
  };

  MediaModel copyWith({
    int? id,
    String? name,
    StatusModel? status,
    TypeModel? type,
    RoleModel? role,
  }) {
    return MediaModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      type: type ?? this.type,
      role: role ?? this.role
    );
  }
}
