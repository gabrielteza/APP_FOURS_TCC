import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';
 
class ChatProvider {
 final FirebaseFirestore firebaseFirestore;
 
 ChatProvider({required this.firebaseFirestore});
 
 Stream<QuerySnapshot> getMessageList() {
   return firebaseFirestore
       .collection('messages')
       .orderBy('timestamp', descending: true)
       .snapshots();
 }
 
 void sendMessage(String message, String author) {
   MessageModel chatMessages = MessageModel(
     author: author,
     timestamp: Timestamp.now(),
     message: message,
   );
 
   firebaseFirestore.collection('messages').add(chatMessages.toJson());
 }
}