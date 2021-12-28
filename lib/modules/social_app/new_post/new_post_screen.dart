import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';

class NewPostScreen extends StatelessWidget {

  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        
        var userModel = SocialCubit.get(context).userModel;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: 
            [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: defaultTextButton(
                  onPressed: ()
                  {
                      var now = DateTime.now();
                    if(SocialCubit.get(context).postImage == null )
                    {
                      SocialCubit.get(context).createPost(
                        text: textController.text, 
                        dateTime: now.toString(),
                        );
                    }else
                    {
                      SocialCubit.get(context).uploadPostImage(
                        text: textController.text, 
                        dateTime: now.toString()  ,

                        );
                    }
                  }, 
                  text: 'POST',
                  ),
              ),
            ]
            ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: 
              [
                if(state is SocialCreatePostLoadingState)
                LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: 
                  [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage('${userModel.image}'),
                        ),
                    SizedBox(
                              width: 15.0,
                            ),
                    Expanded(
                      child: Text(
                        '${userModel.name}',
                        style: TextStyle(
                          height: 1.1,
                          ), 
                      ),
                              ), 
                    ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: ' what is on your mind',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                 SizedBox(
                   height: 25.0,
                 ),
                 if(SocialCubit.get(context).postImage != null)
                 Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: FileImage(SocialCubit.get(context).postImage),
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
                            SocialCubit.get(context).removePostImage();
                          }, 
                        icon:Icon(
                            Icons.close_outlined
                          ) ,
                        ),
                      ),
                    ),
               ],
             ),
             SizedBox(
               height: 30.0,
             ),
                Row(
                  children: 
                  [
                    Expanded(
                      child: TextButton(
                        onPressed: ()
                        {
                          SocialCubit.get(context).getpostImage();
                        }, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: 
                          [
                            Icon(
                              IconBroken.Image_2
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text('Add photo'),
                          ],
                        ),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
         );
       },
      );
  }
}