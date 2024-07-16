
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
///[FIREBASE VARIABLES]
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore db = FirebaseFirestore.instance;
final FirebaseStorage storage = FirebaseStorage.instance;
User? get currentUser => auth.currentUser;


///[FIREBASE COLLECTIONS]
const String userCollection = "users";
const String chatCollection = "chats";
const String messageCollection = "messages";
const String imageCollection = "images";
