import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/models/post_model/post_model.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';

class FeedsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<SocialCubit , SocialStates>(
     listener:(context ,state){} ,
     builder: (context , state)
     {
       return ConditionalBuilder(
         condition: SocialCubit.get(context).posts.length > 0
         && SocialCubit.get(context).userModel != null, 
         builder: (context)
         {
          return SingleChildScrollView(
            physics:BouncingScrollPhysics(),
            child: Column(
              children: 
              [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 4.0,
                  margin: EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image: NetworkImage('https://image.freepik.com/free-photo/narrow-japan-street-with-lanterns_23-2148942947.jpg'),
                        fit: BoxFit.cover,
                        height: 180.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'communicate with friends',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index) => 
                    buildPostItem(SocialCubit.get(context).posts[index] , context , index),
                  itemCount: SocialCubit.get(context).posts.length,
                  separatorBuilder:(context , index) => SizedBox(
                    height: 8.0,
                  ),
                  ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          );
         },
         fallback: (context) => Center(child: CircularProgressIndicator()),
         );
     },
     );
  }

  Widget buildPostItem(PostModel model , context , index)
  {
    return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 4.0,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
                [
                  Row(
                    children: 
                    [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage('https://image.freepik.com/free-photo/portrait-happy-young-man_171337-21716.jpg'),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: 
                          [
                            Row(
                              children: [
                                Text(
                                  '${model.name}',
                                  style: TextStyle(
                                    height: 1.1,
                                    ),
                                  
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: socialColor,
                                  size: 15.0,
                                ),
                              ],
                            ),
                            Text(
                              '${model.dateTime}',
                              style: Theme.of(context).textTheme.caption.copyWith(
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        IconButton(
                          onPressed: ()
                          {
    
                          }, 
                          icon: Icon(Icons.more_horiz_rounded),
                          iconSize: 18.0,
                          ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    '${model.text}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     bottom: 6.0,
                  //     top: 4.0,
                  //   ),
                  //   child: Container(
                  //     width: double.infinity,
                  //     child: Wrap(
                  //       children: 
                  //       [
                  //         Padding(
                  //           padding: const EdgeInsetsDirectional.only(
                  //             end: 3.0,
                  //           ),
                  //           child: Container(
                  //             height: 20.0,
                  //             child: MaterialButton(
                  //               onPressed: ()
                  //               {
                  //               }, 
                  //               minWidth: 1.0,
                  //               padding: EdgeInsets.zero,
                  //               child: Text(
                  //                 '#Software',
                  //                 style: Theme.of(context).textTheme.caption.copyWith(
                  //                   color: socialColor,
                  //                 ),
                  //                 ),
                  //               ),
                  //           ),
                  //         ),
                  //          Padding(
                  //           padding: const EdgeInsetsDirectional.only(
                  //             end: 3.0,
                  //           ),
                  //           child: Container(
                  //             height: 22.0,
                  //             child: MaterialButton(
                  //               onPressed: ()
                  //               {
    
                  //               }, 
                  //               minWidth: 1.0,
                  //               padding: EdgeInsets.zero,
                  //               child: Text(
                  //                 '#flutter',
                  //                 style: Theme.of(context).textTheme.caption.copyWith(
                  //                   color: socialColor,
                  //                 ),
                  //                 ),
                  //               ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  if(model.postImage != '')
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0
                    ),
                    child: Container(
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image: NetworkImage('${model.postImage}'),
                          fit: BoxFit.cover,    
                          ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                    ),
                    child: Row(
                      children: 
                      [
                        Expanded(
                          child: InkWell(
                            onTap: ()
                            {

                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                              child: Row(
                                children: 
                                [
                                  Icon(
                                    IconBroken.Heart,
                                    size: 20.0,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 3.5,
                                  ),
                                  Text(
                                    '${SocialCubit.get(context).likes[index]}',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: ()
                            {
                              
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: 
                                [
                                  Icon(
                                    IconBroken.Chat,
                                    size: 20.0,
                                    color: Colors.amberAccent,
                                  ),
                                  SizedBox(
                                    width: 3.5,
                                  ),
                                  Text(
                                    '0 comments',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 7.0,
                    ),
                    child: Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                  ),
                    Row(
                      children: 
                      [
                        Expanded(
                          child: InkWell(
                            onTap: ()
                            {

                            },
                            child: Row(
                              children: 
                              [
                                CircleAvatar(
                                  radius: 15.0,
                                  backgroundImage: NetworkImage('${SocialCubit.get(context).userModel.image}'),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Text(
                                  'write a comment....',
                                  style: Theme.of(context).textTheme.caption.copyWith(
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                             right: 6.0,
                          ),
                          child: InkWell(
                              onTap: ()
                              {
                                SocialCubit.get(context)
                                .likePost(SocialCubit.get(context).postsId[index]);
                              },
                              child: Row(
                                children: 
                                [
                                  Icon(
                                    IconBroken.Heart,
                                    size: 18.0,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  Text(
                                    'Like',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                            ),
                        ),
                        InkWell(
                            onTap: ()
                            {
                        
                            },
                            child: Row(
                              children: 
                              [
                                Icon(
                                  IconBroken.Send,
                                  size: 18.0,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  'Share',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ), 
                ],  
              ),
            )
          );
  }
}