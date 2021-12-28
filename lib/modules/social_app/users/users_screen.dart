import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';

class UsersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
           [
             OutlinedButton(
               onPressed: ()
               {
                 FirebaseMessaging.instance.subscribeToTopic('EnglishCourse');
               }, 
               child: Text('Subscribed')
               ),
              OutlinedButton(
              onPressed: ()
              {
                FirebaseMessaging.instance.unsubscribeFromTopic('EnglishCourse');
              }, 
              child: Text('UnSubscribed')
              ),
              SizedBox(
                height: 25.0,
                ),
              defaultTextButton(
                onPressed: ()
                {
                  signOut(context);
                }, 
                text: 'LOGOUT',
                ),
           ],
           ),
      ),
    );
  }
}