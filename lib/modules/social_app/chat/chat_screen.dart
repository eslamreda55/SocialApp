import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/models/social_app/social_user_model.dart';
import 'package:udemy_flutter/modules/social_app/chat/chat_details/chat_details_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class ChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context , state){},
      builder:(context , state)
      {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0, 
          builder: (context) 
          {
            return ListView.separated( 
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context , index) => myDivider(), 
              itemBuilder: (context , index) => buildChatItem(SocialCubit.get(context).users[index] , context),
              itemCount: SocialCubit.get(context).users.length,
              );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        
      } ,
      );
  }

  Widget buildChatItem(SocialUserModel model ,context)
  {
    return InkWell(
      onTap: ()
      {
        navigateTo(context, ChatDetailsScreen(
          userModel: model,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: 
          [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage('${model.image}'),
             ),
             SizedBox(
               width: 12.0,
             ),
             Text(
               '${model.name}',
               style: TextStyle(
                 height: 2.0,
                 fontSize: 15.0,
                 fontWeight: FontWeight.bold,
               ),
               ),
          ],
        ),
      ),
    );
  }
}