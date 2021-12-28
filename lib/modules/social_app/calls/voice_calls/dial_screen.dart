import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';

class DialScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900].withOpacity(0.7),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: 
              [
                Text(
                  'Anna Williams',
                  style: Theme.of(context).textTheme.headline4
                  .copyWith(color: Colors.white),
                ),
                Text(
                  'Calling....',
                  style: TextStyle(
                    color: Colors.white60,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                // Text(
                //   '2:15',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 25.0,
                //   ),
                // ),
                SizedBox(
                  height: 40.0,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 180.0,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                        ),
                      ) ,
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://image.freepik.com/free-photo/photo-positive-european-female-model-makes-okay-gesture-agrees-with-nice-idea_273609-25629.jpg'),
                        radius: 70.0,
                        ),
                    
                  ],
                ),
                Spacer(),
                Container(
                  child:Column(
                    children: [
                      Row(
                        children: 
                        [
                          Expanded(
                            child: Column(
                              children: 
                              [
                                InkWell(
                                  child: Icon(
                                    IconBroken.Voice,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                  onTap: ()
                                  {
                                  },
                                  ),
                                  Text(
                                    'Audio',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: 
                              [
                                InkWell(
                                  child: Icon(
                                    IconBroken.Volume_Up,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                  onTap: ()
                                  {
                                  },
                                  ),
                                  Text(
                                    'MicroPhone',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: 
                              [
                                InkWell(
                                  child: Icon(
                                    IconBroken.Video,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                  onTap: ()
                                  {
                                  },
                                  ),
                                  Text(
                                    'Vidio',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                              ],
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
                            child: Column(
                              children: 
                              [
                                InkWell(
                                  child: Icon(
                                    IconBroken.Chat,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                  onTap: ()
                                  {
                                  },
                                  ),
                                  Text(
                                    'Message',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: 
                              [
                                InkWell(
                                  child: Icon(
                                    Icons.person_add_outlined,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                  onTap: ()
                                  {
                                  },
                                  ),
                                  Text(
                                    'Add Contact',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: 
                              [
                                InkWell(
                                  child: Icon(
                                    Icons.voicemail_outlined,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                  onTap: ()
                                  {
                                  },
                                  ),
                                  Text(
                                    'Voice Mail',
                                    style: TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 20.0,
                        ),
                        child: Row(
                          children: 
                          [
                            Expanded(
                                  child: Container(
                                    height: 60.0,
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                       ),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.call_end_sharp,
                                          size: 25.0,
                                          color: Colors.white,
                                          ),
                                      onTap: ()
                                        {
                                        },
                                     ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ), 
        ),
    );
  }
}