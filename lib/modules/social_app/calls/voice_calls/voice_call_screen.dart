import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';

class VoiceCallScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:SafeArea(
      child: Stack(
          fit: StackFit.expand,
          children: 
          [
            Image(
              fit: BoxFit.cover,
              image: NetworkImage('https://image.freepik.com/free-photo/young-beautiful-female-inviting-come-casual-outfit-looking-confident-front-view_176474-108755.jpg'),
              ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                    [
                      Text(
                        'Essllam \nEelhhawwy',
                        style:Theme.of(context).textTheme.headline4
                        .copyWith(color:Colors.white),
                        ),
                      SizedBox(
                        height: 10.0,
                        ),
                        Text(
                          'inComing 02.00'.toUpperCase(),
                          style: TextStyle(
                            color:Colors.white60 ,
                            fontSize: 14
                            ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children:
                            [ 
                              Expanded(
                                child: Container(
                                  height: 55.0,
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                                     ),
                                  child: InkWell(
                                    child: Icon(
                                      IconBroken.Voice,
                                        size: 25.0,
                                        color: Colors.black,
                                        ),
                                    onTap: ()
                                      {
                                      },
                                   ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 55.0,
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle
                                     ),
                                  child: InkWell(
                                    child: Icon(
                                      IconBroken.Calling,
                                        size: 25.0,
                                        color: Colors.white,
                                        ),
                                    onTap: ()
                                      {
                                      },
                                   ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 55.0,
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                     ),
                                  child: InkWell(
                                    child: Icon(
                                      IconBroken.Volume_Up,
                                        size: 25.0,
                                        color: Colors.black,
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
              ),
          ],
        ),
    ),
    );
  }
}