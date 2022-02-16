import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/domain/auth/auth_facade.dart';
import 'package:notes_app/domain/core/errors.dart';
import 'package:notes_app/injection.dart';

extension Firestore on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSingedInUser();
    final user = userOption.getOrElse(() => throw UnauthenticateErro());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }
}

extension DocumentRefX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}
