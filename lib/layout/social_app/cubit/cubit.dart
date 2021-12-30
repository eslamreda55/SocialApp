import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/models/message_model/message_model.dart';
import 'package:udemy_flutter/models/post_model/post_model.dart';
import 'package:udemy_flutter/models/social_app/social_user_model.dart';
import 'package:udemy_flutter/modules/social_app/chat/chat_screen.dart';
import 'package:udemy_flutter/modules/social_app/feeds/feeds_screen.dart';
import 'package:udemy_flutter/modules/social_app/new_post/new_post_screen.dart';
import 'package:udemy_flutter/modules/social_app/settings/settings_screen.dart';
import 'package:udemy_flutter/modules/social_app/users/users_screen.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';

class SocialCubit extends Cubit<SocialStates>{
  SocialCubit() : super(SocialIntialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;
  List<Widget> bottomScreens=
  [
    FeedsScreen(),
    ChatScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> titles =
  [
    'News Feed',
    'Chats',
    'Post',
    'Users',
    'Settings'

  ];

  void changebottom(int index)
  {
    if(index == 1)
      getAllUsers();
    
     if(index == 2)
    {
      emit(SocialNewPostState());
    }
    else
    {
      currentIndex=index;
      emit(SocialChangeBtNavState());
    }
  }

  bool isDark = false;
  void changeAppMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeThemeModeState());
    } else {
      isDark = !isDark;
      CasheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeThemeModeState());
      });
    }
  }


  SocialUserModel userModel;
  void getuserData()
  {
    emit(SocialGetUserLoadingState());

    FirebaseFirestore.instance
    .collection('users')
    .doc(uId)
    .get()
    .then((value) 
    {
      userModel = SocialUserModel.fromJson(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  File profileImage;
    final Picker = ImagePicker();

    Future<void> getProfileImage() async {

    final pickedFile = await Picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        emit(SocialProfileImageSuccessState());
      } else {
        print('No image selected.');
        emit(SocialProfileImageErrorState());
      }
    
      }

  File coverImage;  
    Future getCoverImage() async {

    final pickedFile = await Picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        coverImage = File(pickedFile.path);
        emit(SocialCoverImageSuccessState());
      } else {
        print('No image selected');
        emit(SocialCoverImageErrorState());
      }
    
      }

  void uploadProfileImage({
  @required String name,
  @required String bio,
  @required String phone,
  })
  {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
    .ref()
    .child('users/${Uri.file(profileImage.path).pathSegments.last}')
    .putFile(profileImage)
    .then((value) 
    {
      value.ref.getDownloadURL()
      .then((value) 
      {
        updateUser(
          name: name, 
          bio: bio, 
          phone: phone,
          profile: value,
          );
      }).catchError((error)
      {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error)
    {
      emit(SocialUploadProfileImageErrorState());
    });
  }

void uploadCoverImage({
  @required String name,
  @required String bio,
  @required String phone,
})
  {

    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
    .ref()
    .child('users/${Uri.file(coverImage.path).pathSegments.last}')
    .putFile(coverImage)
    .then((value) 
    {
      value.ref.getDownloadURL()
      .then((value) 
      {
        updateUser(
          name: name, 
          bio: bio, 
          phone: phone,
          cover: value,
          );
      }).catchError((error)
      {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error)
    {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  File postImage;  
  Future<void> getpostImage() async {

    final pickedFile = await Picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        postImage = File(pickedFile.path);
        emit(SocialUploadPostImageSuccessState());
      } else {
        print('No image selected');
        emit(SocialUploadPostImageErrorState());
      }
    
      }

  void removePostImage()
  {
    postImage = null;
    emit(SocialRemovePostImageState());
  }

void uploadPostImage({
  @required String text,
  @required String dateTime,

})
  {

    emit(SocialCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
    .ref()
    .child('posts/${Uri.file(postImage.path).pathSegments.last}')
    .putFile(postImage)
    .then((value) 
    {
      value.ref.getDownloadURL()
      .then((value) 
      {
        createPost(
          text: text, 
          dateTime: dateTime,
          postImage: value
          );
      }).catchError((error)
      {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error)
    {
      emit(SocialCreatePostErrorState());
    });
  }

  void updateUser({
  @required String name,
  @required String bio,
  @required String phone,
  String profile ,
  String cover,

})
  {
    SocialUserModel model=SocialUserModel(
      name: name,
      phone: phone,
      bio:bio, 
      uId: userModel.uId,
      cover:cover ?? userModel.cover,
      email: userModel.email,
      image: profile ?? userModel.image,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
    .collection('users')
    .doc(userModel.uId)
    .update(model.tomap())
    .then((value)
    {
      getuserData();

    }).catchError((error)
    {
      emit(SocialUserUpdateErrorState());
    });
  }

void createPost({
  @required String text,
  @required String dateTime,
  String postImage,

})
  {
    emit(SocialCreatePostLoadingState());

    PostModel model=PostModel(
      name: userModel.name,
      uId: userModel.uId,
      postImage:postImage ?? '',
      text: text,
      dateTime: dateTime,
    );

    FirebaseFirestore.instance
    .collection('posts')
    .add(model.tomap())
    .then((value)
    {
      emit(SocialCreatePostSuccessState());
    }).catchError((error)
    {
      emit(SocialCreatePostErrorState());
    });
  }

  List<PostModel> posts=[];
  List<String> postsId=[];
  List<int> likes=[];

  void getPosts()
  {
    FirebaseFirestore.instance
    .collection('posts')
    .get()
    .then((value) 
    {
      value.docs.forEach((element)
      {
        element.reference
        .collection('likes')
        .get()
        .then((value) 
        {
          likes.add(value.docs.length);
          postsId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        }).catchError((error)
        {
 
        });
      });
      emit(SocialGetPostsSuccessState());
    }).catchError((error)
    {
      emit(SocialGetPostsErrorState(error.toString()));
    });
  }

  void likePost(String postId)
  {
    FirebaseFirestore.instance
    .collection('posts')
    .doc(postId)
    .collection('likes')
    .doc(userModel.uId)
    .set({
      'like':true,
    })
    .then((value){
      emit(SocialGetLikePostSuccessState());
    }).catchError((error)
    {
      emit(SocialGetLikePostErrorState(error.toString()));
    });
  }

  List<SocialUserModel> users=[];

  void getAllUsers()
  {
    if(users.length == 0)
      FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((value) 
      {
        value.docs.forEach((element)
        {
          if(element.data()['uId'] != userModel.uId)
           users.add(SocialUserModel.fromJson(element.data()));
        });
        emit(SocialGetAllUsersSuccessState());
      }).catchError((error)
      {
        print(error.toString());
        emit(SocialGetAllUsersErrorState(error.toString()));
      });
  }

  void sendMessage({
    @required String receiverId,
    @required String dateTime,
    @required String text,
  })
  {
    MessageModel model = MessageModel(
      dateTime: dateTime,
      receiverId: receiverId,
      senderId: userModel.uId,
      text: text,
    );
    
    //Sender
    FirebaseFirestore.instance
    .collection('users')
    .doc(userModel.uId)
    .collection('chats')
    .doc(receiverId)
    .collection('messages')
    .add(model.tomap())
    .then((value) 
    {
      emit(SocialSendMessagesSuccessState());
    }).catchError((error)
    {
      emit(SocialSendMessagesErrorState());
    });

    //Receiver
    FirebaseFirestore.instance
    .collection('users')
    .doc(receiverId)
    .collection('chats')
    .doc(userModel.uId)
    .collection('messages')
    .add(model.tomap())
    .then((value) 
    {
      emit(SocialSendMessagesSuccessState());
    }).catchError((error)
    {
      emit(SocialSendMessagesErrorState());
    });
  }  


  List<MessageModel> messages = [];
  void getMessage({
    @required String receiverId,
  })
  {
    
    FirebaseFirestore.instance
    .collection('users')
    .doc(userModel.uId)
    .collection('chats')
    .doc(receiverId) 
    .collection('messages')
    .orderBy('dateTime')
    .snapshots()
    //event is my message(data)
    .listen((event) 
    {
      messages = [];
      event.docs.forEach((element) 
      {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialGetMessagesSuccessState());
     });
  } 
}

