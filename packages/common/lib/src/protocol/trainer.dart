/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'serving.dart' as _i2;
import 'appointment.dart' as _i3;

abstract class Trainer implements _i1.SerializableModel {
  Trainer._({
    this.id,
    required this.name,
    required this.description,
    required this.gender,
    required this.age,
    required this.headshot,
    required this.photos,
    required this.videos,
    required this.servingCity,
    required this.servingHours,
    this.serving,
    this.appointments,
    required this.classFee,
    required this.phone,
    int? hotness,
    double? rating,
  })  : hotness = hotness ?? 0,
        rating = rating ?? 0.0;

  factory Trainer({
    int? id,
    required String name,
    required String description,
    required String gender,
    required int age,
    required String headshot,
    required String photos,
    required String videos,
    required String servingCity,
    required String servingHours,
    List<_i2.Serving>? serving,
    List<_i3.Appointment>? appointments,
    required double classFee,
    required String phone,
    int? hotness,
    double? rating,
  }) = _TrainerImpl;

  factory Trainer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Trainer(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      gender: jsonSerialization['gender'] as String,
      age: jsonSerialization['age'] as int,
      headshot: jsonSerialization['headshot'] as String,
      photos: jsonSerialization['photos'] as String,
      videos: jsonSerialization['videos'] as String,
      servingCity: jsonSerialization['servingCity'] as String,
      servingHours: jsonSerialization['servingHours'] as String,
      serving: (jsonSerialization['serving'] as List?)
          ?.map((e) => _i2.Serving.fromJson((e as Map<String, dynamic>)))
          .toList(),
      appointments: (jsonSerialization['appointments'] as List?)
          ?.map((e) => _i3.Appointment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      classFee: (jsonSerialization['classFee'] as num).toDouble(),
      phone: jsonSerialization['phone'] as String,
      hotness: jsonSerialization['hotness'] as int,
      rating: (jsonSerialization['rating'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String description;

  String gender;

  int age;

  String headshot;

  String photos;

  String videos;

  String servingCity;

  String servingHours;

  List<_i2.Serving>? serving;

  List<_i3.Appointment>? appointments;

  double classFee;

  String phone;

  int hotness;

  double rating;

  /// Returns a shallow copy of this [Trainer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Trainer copyWith({
    int? id,
    String? name,
    String? description,
    String? gender,
    int? age,
    String? headshot,
    String? photos,
    String? videos,
    String? servingCity,
    String? servingHours,
    List<_i2.Serving>? serving,
    List<_i3.Appointment>? appointments,
    double? classFee,
    String? phone,
    int? hotness,
    double? rating,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'gender': gender,
      'age': age,
      'headshot': headshot,
      'photos': photos,
      'videos': videos,
      'servingCity': servingCity,
      'servingHours': servingHours,
      if (serving != null)
        'serving': serving?.toJson(valueToJson: (v) => v.toJson()),
      if (appointments != null)
        'appointments': appointments?.toJson(valueToJson: (v) => v.toJson()),
      'classFee': classFee,
      'phone': phone,
      'hotness': hotness,
      'rating': rating,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrainerImpl extends Trainer {
  _TrainerImpl({
    int? id,
    required String name,
    required String description,
    required String gender,
    required int age,
    required String headshot,
    required String photos,
    required String videos,
    required String servingCity,
    required String servingHours,
    List<_i2.Serving>? serving,
    List<_i3.Appointment>? appointments,
    required double classFee,
    required String phone,
    int? hotness,
    double? rating,
  }) : super._(
          id: id,
          name: name,
          description: description,
          gender: gender,
          age: age,
          headshot: headshot,
          photos: photos,
          videos: videos,
          servingCity: servingCity,
          servingHours: servingHours,
          serving: serving,
          appointments: appointments,
          classFee: classFee,
          phone: phone,
          hotness: hotness,
          rating: rating,
        );

  /// Returns a shallow copy of this [Trainer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Trainer copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? gender,
    int? age,
    String? headshot,
    String? photos,
    String? videos,
    String? servingCity,
    String? servingHours,
    Object? serving = _Undefined,
    Object? appointments = _Undefined,
    double? classFee,
    String? phone,
    int? hotness,
    double? rating,
  }) {
    return Trainer(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      headshot: headshot ?? this.headshot,
      photos: photos ?? this.photos,
      videos: videos ?? this.videos,
      servingCity: servingCity ?? this.servingCity,
      servingHours: servingHours ?? this.servingHours,
      serving: serving is List<_i2.Serving>?
          ? serving
          : this.serving?.map((e0) => e0.copyWith()).toList(),
      appointments: appointments is List<_i3.Appointment>?
          ? appointments
          : this.appointments?.map((e0) => e0.copyWith()).toList(),
      classFee: classFee ?? this.classFee,
      phone: phone ?? this.phone,
      hotness: hotness ?? this.hotness,
      rating: rating ?? this.rating,
    );
  }
}
