import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/social_app/social_login/cuibt/states.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates>
{
  SocialLoginCubit() : super(SocialLoginIntialStates());

  static SocialLoginCubit get(context) => BlocProvider.of(context);
  
  void userLogin({
    @required String email,
    @required String password,

  })
  {

    emit(SocialLoginLoadingStates());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, 
      password: password,
      ).then((value) 
      {
        print(value.user.email);
        print(value.user.uid);
        emit(SocialLoginSuccessStates(value.user.uid));
      }).catchError((error)
      {
        emit(SocialLoginErrorStates(error.toString()));
      });
  }

  IconData suffix= Icons.remove_red_eye_rounded;

  bool isPassword=true;

  void changeSuffixPassword()
  {
    
    isPassword = !isPassword;

    suffix= isPassword ?  Icons.remove_red_eye_rounded : Icons.visibility_off_outlined ;
    emit(SocialChangePasswordVisibilityStates());
  }
}