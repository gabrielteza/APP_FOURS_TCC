import 'package:cloud_firestore/cloud_firestore.dart';
 
class MessageModel {
 String author;
 String message;
 Timestamp timestamp;
 
 MessageModel(
     {required this.author, required this.message, required this.timestamp});
 
 Map<String, dynamic> toJson() {
   return {
     'author': author,
     'message': message,
     'timestamp': timestamp,
   };
 }
 
 factory MessageModel.fromDocument(DocumentSnapshot documentSnapshot) {
   String author = documentSnapshot.get('author');
   String message = documentSnapshot.get('message');
   Timestamp timestamp = documentSnapshot.get('timestamp');
 
   return MessageModel(author: author, message: message, timestamp: timestamp);
 }
}