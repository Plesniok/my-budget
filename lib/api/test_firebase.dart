
import 'package:firebase_database/firebase_database.dart';

class FireBaseClass {
  FirebaseDatabase? firebaseInstance;


  void initInstance(){
    firebaseInstance = FirebaseDatabase.instance;
  } 
}
