import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FailuerClass {
  String message;
  FailuerClass(this.message);
}

class ServerFailuer extends FailuerClass {
  ServerFailuer(super.message);
  factory ServerFailuer.fromFireBase(FirebaseException exception) {
    switch (exception.code) {
      case "invalid-argument":
        return ServerFailuer("invalid-argument");
      case "unknown":
        return ServerFailuer("Unable to establish connection on channel");
      case "permission-denied":
        return ServerFailuer("permission-denied");
      case "not-found":
        return ServerFailuer("not-found");
      case "conflict":
        return ServerFailuer("conflict");
      case "precondition-failed":
        return ServerFailuer("precondition-failed");
      case "too-many-requests":
        return ServerFailuer("too-many-requests");
      case "internal":
        return ServerFailuer("internal");
      case "deadline-exceeded":
        return ServerFailuer("deadline-exceeded");
      case "aborted":
        return ServerFailuer("aborted");
      case "resource-exhausted":
        return ServerFailuer("resource-exhausted");
      case "failed-precondition":
        return ServerFailuer("failed-precondition");
      case "The server has terminated the upload session":
        return ServerFailuer("cant upload this");
      default:
        return ServerFailuer(exception.message!);
    }
  }
}
