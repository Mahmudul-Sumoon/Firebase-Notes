import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes_app/domain/auth/user.dart';
import 'package:notes_app/domain/core/value_objects.dart';

extension FirebaseUserDomainMapper on User {
  AsUser toDomain() {
    return AsUser(id: UniqueId.fromUniqueIdString(uid));
  }
}
