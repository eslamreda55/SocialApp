
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
        
    var nameController = TextEditingController();
    var bioController = TextEditingController();
    var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
      listener:(context , state){} ,
      builder:(context , state)
      {
        var userModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;

        nameController.text=userModel.name;
        bioController.text=userModel.bio;
        phoneController.text=userModel.phone;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: 
            [
              defaultTextButton(
              onPressed: ()
              {
                SocialCubit.get(context).updateUser(
                  name: nameController.text,
                  bio: bioController.text,
                  phone: phoneController.text
                );
              }, 
              text: 'UPDATE',
              ),
              SizedBox(
                width: 12.0,
              ),
            ],
            ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: 
                [
                  if(state is SocialUserUpdateLoadingState)
                  LinearProgressIndicator(),
                  if(state is SocialUserUpdateLoadingState)
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                  height: 190.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 150.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0),
                                ),
                                image: DecorationImage(
                                image:coverImage == null ? NetworkImage('${userModel.cover}') : FileImage(coverImage),
                                fit: BoxFit.cover,    
                                      ),
                                   ),
                                ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 18.0,
                                child: IconButton(
                                  iconSize: 20.0,
                                  onPressed: ()
                                  {
                                    SocialCubit.get(context).getCoverImage();
                                  }, 
                                  icon:Icon(
                                    IconBroken.Camera,
                                  ) ,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ), 
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 53.0,
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 48.0,
                              backgroundImage: profileImage == null ? NetworkImage('${userModel.image}') : FileImage(profileImage),
                              
                            ),
                          ),
                          CircleAvatar(
                            radius: 18.0,
                              child: IconButton(
                                iconSize: 20.0,
                                onPressed: ()
                                {
                                  SocialCubit.get(context).getProfileImage();
                                }, 
                                icon:Icon(
                                  IconBroken.Camera,
                                ) ,
                                  ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                  SizedBox(
                  height: 30.0,
                ),
                  if(SocialCubit.get(context).profileImage !=null || SocialCubit.get(context).coverImage !=null )
                  Row(
                    children: 
                    [
                      if(SocialCubit.get(context).profileImage != null)
                        Expanded(
                        child: defaultTextButton(
                          onPressed: ()
                          {
                            SocialCubit.get(context).uploadProfileImage(
                              name: nameController.text, 
                              bio: bioController.text, 
                              phone: phoneController.text,
                              );
                          }, 
                          text: 'UPLOAD PROFILE'
                          ),
                        ),
                      SizedBox(
                        width: 8.0,
                      ),
                      if(SocialCubit.get(context).coverImage != null)
                        Expanded(
                        child: defaultTextButton(
                          onPressed: ()
                          {
                            SocialCubit.get(context).uploadCoverImage(
                              name: nameController.text, 
                              bio: bioController.text, 
                              phone: phoneController.text,
                              );
                          }, 
                          text: 'UPLOAD COVER'
                          ),
                        ),
                        
                    ],
                  ),
                  if(SocialCubit.get(context).profileImage !=null || SocialCubit.get(context).coverImage !=null )
                  SizedBox(
                    height: 12.0,
                  ),
                  defaultFormField(
                    controller: nameController, 
                    type: TextInputType.name, 
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'name must not be empty';
                      }
                      return null;
                    }, 
                    prefixIcon: Icons.person, 
                    label: 'Name',
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                  defaultFormField(
                    controller: bioController, 
                    type: TextInputType.text, 
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'bio must not be empty';
                      }
                      return null;
                    }, 
                    prefixIcon: IconBroken.Bookmark, 
                    label: 'Bio',
                    ),
                  SizedBox(
                      height: 12.0,
                    ),
                  defaultFormField(
                    controller: phoneController, 
                    type: TextInputType.phone, 
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'phone must not be empty';
                      }
                      return null;
                    }, 
                    prefixIcon: IconBroken.Call, 
                    label: 'Phone',
                    ),
                  SizedBox(
                      height: 12.0,
                    ),
                ],
              ),
            ),
          ),
        );
      },
      );
  }
}