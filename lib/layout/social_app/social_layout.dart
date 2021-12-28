import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/modules/social_app/new_post/new_post_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';

class Sociallayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
         listener: (BuildContext context, state) 
         {
           if(state is SocialNewPostState)
           {
             navigateTo(context, NewPostScreen());
           }
         },
        builder: (BuildContext context, state)
        {
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex]
              ),
              actions: 
              [
                IconButton(
                  icon: Icon(
                    IconBroken.Notification,
                    ),
                  onPressed: ()
                  {

                  }, 
                ),
                IconButton(
                  icon: Icon(
                    IconBroken.Search,
                    ),
                  onPressed: ()
                  {

                  }, 
                
                ),
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changebottom(index);
              },
              items: 
              [
                BottomNavigationBarItem(
                  icon:Icon(
                    IconBroken.Home,
                    ) ,
                  label: 'Home',
                  ),
                BottomNavigationBarItem(
                  icon:Icon(
                    IconBroken.Chat,
                    ) ,
                  label: 'Chat',
                  ),
                BottomNavigationBarItem(
                  icon:Icon(
                    IconBroken.Plus,
                    ) ,
                  label: 'Post',
                  ),
                BottomNavigationBarItem(
                  icon:Icon(
                    IconBroken.Location,
                    ) ,
                  label: 'users',
                  ),
                BottomNavigationBarItem(
                  icon:Icon(
                    IconBroken.Setting,
                    ) ,
                  label: 'Setting',
                  ),
                
              ],
            ),
            );
        }
        );
      
  }
}