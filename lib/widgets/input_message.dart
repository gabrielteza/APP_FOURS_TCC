import 'package:flutter/material.dart';
 
class InputMessageWidget extends StatelessWidget {
 const InputMessageWidget({
   Key? key,
   required this.messageEditingController,
   required this.handleSubmit,
 }) : super(key: key);
 
 final TextEditingController messageEditingController;
 final Function(String message) handleSubmit;
 
 @override
 Widget build(BuildContext context) {
   return Container(
     padding: const EdgeInsets.all(8.0),
     child: SizedBox(
       width: double.infinity,
       height: 60,
       child: Row(
         children: [
           Flexible(
               child: TextField(
             keyboardType: TextInputType.text,
             textCapitalization: TextCapitalization.sentences,
             controller: messageEditingController,
             cursorColor: const Color(0xff9b84ec),
             style: const TextStyle(color: Colors.white),
             decoration: const InputDecoration(
               floatingLabelBehavior: FloatingLabelBehavior.never,
               contentPadding: EdgeInsets.all(20.0),
               filled: true,
               fillColor: Color(0xff2f3136),
               labelText: 'Mensagem',
               hintStyle: TextStyle(color: Colors.white),
               labelStyle: TextStyle(color: Colors.white),
               enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.black26),
                 borderRadius: BorderRadius.all(Radius.circular(60.0)),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Color(0xff9b84ec), width: 1),
                 borderRadius: BorderRadius.all(Radius.circular(60.0)),
               ),
               border: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.green, width: 5),
                 borderRadius: BorderRadius.all(Radius.circular(60.0)),
                 gapPadding: 8.0,
               ),
             ),
           )),
           Container(
             margin: const EdgeInsets.only(left: 4),
             decoration: BoxDecoration(
               color: Colors.purple,
               borderRadius: BorderRadius.circular(30),
             ),
             child: IconButton(
               onPressed: () => handleSubmit(messageEditingController.text),
               icon: const Icon(Icons.send_rounded),
               color: Colors.white,
             ),
           ),
         ],
       ),
     ),
   );
 }
}