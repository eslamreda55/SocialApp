// import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:udemy_flutter/shared/styles/icons_broken.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

class vidioCallScreen extends StatefulWidget {

  @override
  State<vidioCallScreen> createState() => _vidioCallScreenState();
}

class _vidioCallScreenState extends State<vidioCallScreen> {
  
  // final AgoraClient client = AgoraClient(
  // agoraConnectionData: AgoraConnectionData(
  //   appId: "57f9e67522094d84ad87c1baa42c6ed3",
  //   channelName: "mazareta_chat",
  // ),
  // enabledPermission: [
  //   Permission.camera,
  //   Permission.microphone,
  // ],
  // );

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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                    [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 140.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.0),
                              color: Colors.red,
                            ),
                            child:Image(
                              fit: BoxFit.cover,
                              image:  NetworkImage('https://image.freepik.com/free-photo/vertical-shot-caucasian-male-with-red-t-shirt_181624-52255.jpg'),
                              ),
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






// class VidioCallScreen extends StatefulWidget {

//   @override
//   State<VidioCallScreen> createState() => _VidioCallScreenState();
// }

// class _VidioCallScreenState extends State<VidioCallScreen> {
   
//    int remoteId =0 ;
//    RtcEngine engine;
//   @override
//   void initState() {
//     initAgora();
//     super.initState();
//   }
//   @override
//   void dispose() {
//     engine.leaveChannel();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     body:SafeArea(
//       child: Stack(
//           fit: StackFit.expand,
//           children: 
//           [
//             Image( 
//               fit: BoxFit.cover,
//               image: NetworkImage('https://image.freepik.com/free-photo/young-beautiful-female-inviting-come-casual-outfit-looking-confident-front-view_176474-108755.jpg'),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: SafeArea(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: 
//                     [
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: Container(
//                             height: 140.0,
//                             width: 100.0,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12.0),
//                               color: Colors.red,
//                             ),
//                             child:renderLocalPreview(),
//                           ),
//                         ),
//                         Spacer(),
//                         Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Row(
//                             children:
//                             [ 
//                               Expanded(
//                                 child: Container(
//                                   height: 55.0,
//                                   padding: const EdgeInsets.all(10.0),
//                                   decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle
//                                      ),
//                                   child: InkWell(
//                                     child: Icon(
//                                       IconBroken.Voice,
//                                         size: 25.0,
//                                         color: Colors.black,
//                                         ),
//                                     onTap: ()
//                                       {
//                                       },
//                                    ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   height: 55.0,
//                                   padding: const EdgeInsets.all(10.0),
//                                   decoration: BoxDecoration(
//                                   color: Colors.red,
//                                   shape: BoxShape.circle
//                                      ),
//                                   child: InkWell(
//                                     child: Icon(
//                                       IconBroken.Calling,
//                                         size: 25.0,
//                                         color: Colors.white,
//                                         ),
//                                     onTap: ()
//                                       {
//                                       },
//                                    ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   height: 55.0,
//                                   padding: const EdgeInsets.all(10.0),
//                                   decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   shape: BoxShape.circle,
//                                      ),
//                                   child: InkWell(
//                                     child: Icon(
//                                       IconBroken.Volume_Up,
//                                         size: 25.0,
//                                         color: Colors.black,
//                                         ),
//                                     onTap: ()
//                                       {
//                                       },
//                                    ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//     ),
//     );
//   }

//   Future<void> initAgora() async 
//   {
//     await [Permission.microphone,Permission.camera].request();
//     engine =await RtcEngine.create(AgoraManger.appId);
//     engine.enableVideo();
//     engine.setEventHandler(
//       RtcEngineEventHandler(
//         joinChannelSuccess: (
//           String channel,
//           int uid,
//           int elapsed
//         )
//         {
//           print('local user $uid joined successfully'); 
//         },
        
//         userJoined:(
//           int uid,
//           int elapsed,
//         )
//         {
//           print('Remote user $uid joined successfully');
//           setState(() {
//             return remoteId = uid; 
//           });
//         },
        
//         userOffline: (
//           int uid,
//           UserOfflineReason reson,
//         )
//         {
//           print('Remote user $uid  left call');
//           setState(() {
//             return remoteId = 0 ;
//           });
//           Navigator.of(context).pop(true);
//         }
//       )
//     );
//     await engine.joinChannel(
//       AgoraManger.token, 
//       AgoraManger.channelName, 
//       null, 
//       0,
//       );
//   }

//   Widget renderLocalPreview()
//   {
//     return RtcLocalView.SurfaceView();
//   }

//   Widget renderRemoteVidio()
//   {
//     if(remoteId != 0)
//     {
//       return RtcRemoteView.SurfaceView(
//         uid:remoteId
//         );
//     }else
//     {
//       return Text(
//         'Calling...',
//         style: Theme.of(context).textTheme.headline5,
//         textAlign: TextAlign.center,
//         );
//     }
//   }
// }