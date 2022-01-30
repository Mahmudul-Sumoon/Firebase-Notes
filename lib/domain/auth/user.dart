import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/domain/core/value_objects.dart';
part 'user.freezed.dart';

@freezed
abstract class AsUser with _$AsUser {
  const factory AsUser({
    required UniqueId id,
  }) = _AsUser;
}
