import 'package:eze/core/enums/media_type.dart';

class TypedMediaModel {
  final String media;
  final MediaType type;

  const TypedMediaModel(this.media, {this.type = MediaType.photo});
}
