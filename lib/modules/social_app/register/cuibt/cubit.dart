import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/social_app/social_user_model.dart';
import 'package:udemy_flutter/modules/social_app/register/cuibt/states.dart';



class SocialRegisterCubit extends Cubit<SocialRegisterStates>
{
  SocialRegisterCubit() : super(SocialRegisterIntialStates());

  


  static SocialRegisterCubit get(context) => BlocProvider.of(context);
  
  void userRegister({
    @required String email,
    @required String password,
    @required String name,
    @required String phone,

  })
  {

    emit(SocialRegisterLoadingStates());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, 
      password: password,
      ).then((value) 
      {
        createUser(
          email:email, 
          name: name, 
          phone: phone, 
          uId: value.user.uid,
          );
        print(value.user.uid);
        
      }).catchError((error)
      {
        print(error.toString());
        emit(SocialRegisterErrorStates(error.toString()));
      });
  }

  void createUser({
    @required String email,
    @required String name,
    @required String phone,
    //@required String image,
    @required String uId,

  })
  {
    SocialUserModel model=SocialUserModel(
      email: email,
      name: name,
      phone: phone,
      bio: 'write your bio...', 
      uId: uId,
      cover:'https://image.freepik.com/free-vector/cute-bad-cat-wearing-suit-sunglasses-with-baseball-bat-cartoon-icon-illustration-animal-fashion-icon-concept-isolated-flat-cartoon-style_138676-2170.jpg',
      image: 'https://image.freepik.com/free-vector/cute-bad-cat-wearing-suit-sunglasses-with-baseball-bat-cartoon-icon-illustration-animal-fashion-icon-concept-isolated-flat-cartoon-style_138676-2170.jpg',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
    .collection('users')
    .doc(uId).set(model.tomap()).then((value) 
    {
      emit(CreateUserSuccessStates());
    }).catchError((error)
    {
      print(error.toString());
      emit(CreateUserErrorStates(error.toString()));
    });
  }

  IconData suffix= Icons.remove_red_eye_rounded;

  bool isPassword=true;

  void changeSuffixPassword()
  {
    
    isPassword = !isPassword;

    suffix= isPassword ?  Icons.remove_red_eye_rounded : Icons.visibility_off_outlined ;
    emit(SocialRegisterChangePasswordVisibilityStates());
  }
}