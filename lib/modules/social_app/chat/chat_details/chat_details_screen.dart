import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/models/message_model/message_model.dart';
import 'package:udemy_flutter/models/social_app/social_user_model.dart';
import 'package:udemy_flutter/modules/social_app/calls/vidio_calls/vidio_call_screen.dart';
import 'package:udemy_flutter/modules/social_app/calls/voice_calls/dial_screen.dart';
import 'package:udemy_flutter/modules/social_app/calls/voice_calls/voice_call_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';


class ChatDetailsScreen extends StatelessWidget {

  var messageController = TextEditingController();

  SocialUserModel userModel;
  ChatDetailsScreen({
    this.userModel
    });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:(BuildContext context)
      {
        SocialCubit.get(context).getMessage(
          receiverId: userModel.uId,
        );

        return BlocConsumer<SocialCubit , SocialStates>(
          listener: (context , state){},
          builder: (context , state)
          {
           return Scaffold(
                  appBar: AppBar(
                    titleSpacing: 0.0,
                    title:Row(
                      children: 
                      [
                        CircleAvatar(
                          radius: 20.0  ,
                          backgroundImage: NetworkImage('${userModel.image}')
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Text(
                            '${userModel.name}',
                          ),
                        ),
                      ],
                    ),
                    actions: 
                      [
                        IconButton(
                          onPressed: ()
                          {
                            navigateTo(context, vidioCallScreen());
                          }, 
                          icon: Icon(IconBroken.Video),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: IconButton(
                            onPressed: ()
                            {
                              navigateTo(context, DialScreen());
                            }, 
                            icon: Icon(IconBroken.Calling),
                            ),
                        )
                      ],
                  ),
                  body: ConditionalBuilder(
                    condition: true,//SocialCubit.get(context).messages.length > 0, 
                    builder: (context)
                    {
                     return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: 
                        [
                          Expanded(
                            child: ListView.separated(
                              itemBuilder:(context , index)
                              {
                                var message= SocialCubit.get(context).messages[index];
                                if(SocialCubit.get(context).userModel.uId == message.senderId)
                                {
                                return buildMyMessage(message);
                                }else
                                {
                                  return buildMessage(message);
                                }
                              },
                              separatorBuilder: (context , index) => SizedBox(
                                height: 10.0,
                              ), 
                              itemCount: SocialCubit.get(context).messages.length,
                              ),
                          ),
                          Container(
                            height: 45,
                            child: Row(
                              children: 
                              [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25.0),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 3),
                                            blurRadius: 5,
                                            color: Colors.grey)
                                      ],
                                    ),
                                    child: Row(
                                      children: 
                                      [
                                        IconButton(
                                            icon: Icon(
                                              Icons.face
                                              ), 
                                            onPressed: () {}),
                                        Expanded(
                                          child: TextField(
                                            controller: messageController,
                                            decoration: InputDecoration(
                                                hintText: 'Type Something...',
                                                border: InputBorder.none,
                                                ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.camera_alt,
                                            ),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.attach_file,
                                            ),
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                  ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: socialColor,
                                      shape: BoxShape.circle
                                      ),
                                  child: InkWell(
                                    child: Icon(
                                      IconBroken.Send,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                    onTap: ()
                                    {
                                      
                                      SocialCubit.get(context).sendMessage(
                                        receiverId: userModel.uId,
                                        dateTime: DateTime.now().toString(), 
                                        text: messageController.text,
                                        );
                                      //to clear text field after send
                                      messageController.clear();
                                    },
                                    onLongPress: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  );
                },
                  fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            );
          },
        );
      } ,
    );
    
  }

  Widget buildMessage(MessageModel model)
  {
      return Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                child: Text(
                  model.text
                 ),
                 padding: EdgeInsets.symmetric(
                   vertical: 7.0,
                   horizontal: 12.0
                 ),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent[100],
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(15.0),
                    topEnd: Radius.circular(15.0),
                    bottomEnd: Radius.circular(15.0),
                  ),
                ),
              ),
            );
  }

  Widget buildMyMessage(MessageModel model)
  {
      return Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                child: Text(
                  model.text
                 ),
                 padding: EdgeInsets.symmetric(
                   vertical: 7.0,
                   horizontal: 12.0
                 ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(15.0),
                    topEnd: Radius.circular(15.0),
                    bottomStart: Radius.circular(15.0),
                  ),
                ),
              ),
            );
  }
}