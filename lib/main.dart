import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/social_layout.dart';
import 'package:udemy_flutter/modules/social_app/calls/vidio_calls/vidio_call_screen.dart';
import 'package:udemy_flutter/modules/social_app/calls/voice_calls/voice_call_screen.dart';
import 'package:udemy_flutter/modules/social_app/social_login/social_login_screen.dart';
import 'package:udemy_flutter/shared/bloc_observer.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';
import 'package:udemy_flutter/shared/styles/themes.dart';


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async 
{
  print('on BackGround Message');
    print(message.data.toString());
    showToast(text: 'on BackGround Message', state: toastState.WARNING);
}
void main() async {
  //بيتاكد ان كل حاجه هنا ف الميثود خلصت وبعدين يرن الاب
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //to get Device token(UniqId)
  var token = await FirebaseMessaging.instance.getToken();
  print(token);

  //when open the App
  FirebaseMessaging.onMessage.listen((event) 
  {
    print('onMessage');
    print(event.data.toString());
    showToast(text: 'onMessage', state: toastState.SUCCESS);
  });

  //when closed the App but still opened in the background
  FirebaseMessaging.onMessageOpenedApp.listen((event) 
  {
    print('on App Message');
    print(event.data.toString());
    showToast(text: 'on App Message', state: toastState.SUCCESS);
  });

  //BackGround FCM
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  await CasheHelper.init();

  Widget widget;

  bool isDark = CasheHelper.getData(key: 'isDark');

    
   uId = CasheHelper.getData(key: 'uId');

    if(uId !=null)
    {
      widget = Sociallayout();
    }else
    {
      widget = SocialLoginScreen();
    }
    

  runApp(MyApp(
    isDark:isDark,
    startWidget :widget,
    )
    );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  
  MyApp({this.isDark,this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()..getuserData()..getPosts() ,
      child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode:  ThemeMode.light ,
                home: startWidget,
                title: 'Mazareta',
              ),
    );
    
          
        
      
    
  }
}
