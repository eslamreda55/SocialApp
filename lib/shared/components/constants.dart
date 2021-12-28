//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=API_KEY

//https://newsapi.org/v2/everything?q=tesla&apiKey=7db2b261d772400ba9ade18d100454fc

import 'package:udemy_flutter/modules/social_app/social_login/social_login_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';

void signOut(context)
{
   CasheHelper.removeData(key: 'token').then((value) 
            {
              if(value)
              {
                navigateAndFinish(context, SocialLoginScreen(),);
              }
            }
            );
}

void printFullText(String text)
{
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}


String uId='';

// ConditionalBuilder(
//               condition: SocialCubit.get(context).model != null,
//                builder: (context) {

//                return Column(
//                 children: 
//                 [
//                   if(!FirebaseAuth.instance.currentUser.emailVerified)
//                   Container(
//                     color: Colors.amberAccent[100],
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Row(
//                         children: 
//                         [
//                           Icon(
//                             Icons.warning
//                           ),
//                           SizedBox(
//                             width: 10.0,
//                           ),
//                           Expanded(child: Text('please send your e-mail verifaction')),
                          
//                           SizedBox(
//                             width: 20.0,
//                           ),
//                           defaultTextButton(
//                             onPressed: ()
//                             {
//                               FirebaseAuth.instance.currentUser
//                               .sendEmailVerification()
//                               .then((value) 
//                               {
//                                 showToast(
//                                   text:'check your mail' , 
//                                   state: toastState.SUCCESS,
//                                   );
//                               }).catchError((error)
//                               {

//                               });
//                             },
//                             text: 'send',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//             );
//           },
//           fallback: (context) => Center(child: CircularProgressIndicator()),
              
//                ),