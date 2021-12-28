import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/social_app/cubit/states.dart';
import 'package:udemy_flutter/modules/social_app/edit_profile/edit_profile.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit , SocialStates>(
      listener: (context , state) {},
      builder: (context , state)
      {
        //There was an error starting the campaign: target_time for running
        // campaigns should be at least 10seconds into the future.
      var userModel = SocialCubit.get(context).userModel;
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: 
          [
            Container(
              height: 190.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      height: 150.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        image: DecorationImage(
                        image: NetworkImage('${userModel.cover}'),
                        fit: BoxFit.cover,    
                              ),
                           ),
                        ),
                  ), 
                  CircleAvatar(
                    radius: 53.0,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: 48.0,
                      backgroundImage: NetworkImage('${userModel.image}'),
                      
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              '${userModel.name}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              '${userModel.bio}',
              style: Theme.of(context).textTheme.caption,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 22.0,
              ),
              child: Row(
                children: 
                [
                  Expanded(
                    child: InkWell(
                      onTap: ()
                      {

                      },
                      child: Column(
                        children: 
                        [
                          Text(
                            '180',
                            style: Theme.of(context).textTheme.subtitle2,
                            ),
                          Text(
                            'posts',
                            style: Theme.of(context).textTheme.caption,
                            ),    
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: ()
                      {

                      },
                      child: Column(
                        children: 
                        [
                          Text(
                            '160',
                            style: Theme.of(context).textTheme.subtitle2,
                            ),
                          Text(
                            'Photos',
                            style: Theme.of(context).textTheme.caption,
                            ),    
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: ()
                      {

                      },
                      child: Column(
                        children: 
                        [
                          Text(
                            '600k',
                            style: Theme.of(context).textTheme.subtitle2,
                            ),
                          Text(
                            'Followers',
                            style: Theme.of(context).textTheme.caption,
                            ),    
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: ()
                      {

                      },
                      child: Column(
                        children: 
                        [
                          Text(
                            '888',
                            style: Theme.of(context).textTheme.subtitle2,
                            ),
                          Text(
                            'Following',
                            style: Theme.of(context).textTheme.caption,
                            ),    
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: 
              [
                Expanded(
                  child:OutlinedButton(
                    onPressed: ()
                    {

                    },
                    child: Text('Add Photos'),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                OutlinedButton(
                  onPressed: ()
                  {
                    navigateTo(context, EditProfileScreen());
                  },
                child: Icon(
                  IconBroken.Edit_Square,
                  color: socialColor,
                  size: 16.0,
                ),
                ),
              ],
            ),
          ],
        ),
      );
      }
         
      );  
  }
}