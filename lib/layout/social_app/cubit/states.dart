abstract class SocialStates{}

class SocialIntialState extends SocialStates{}

//get users
class SocialGetUserLoadingState extends SocialStates{}

class SocialGetUserSuccessState extends SocialStates{}

class SocialGetUserErrorState extends SocialStates
{
  final String error;

  SocialGetUserErrorState(this.error);
}


//get AllUsers
class SocialGetAllUsersLoadingState extends SocialStates{}

class SocialGetAllUsersSuccessState extends SocialStates{}

class SocialGetAllUsersErrorState extends SocialStates
{
  final String error;

  SocialGetAllUsersErrorState(this.error);
}



//get posts
class SocialGetPostsLoadingState extends SocialStates{}

class SocialGetPostsSuccessState extends SocialStates{}

class SocialGetPostsErrorState extends SocialStates
{
  final String error;

  SocialGetPostsErrorState(this.error);
}



//get likePosts
class SocialGetLikePostSuccessState extends SocialStates{}

class SocialGetLikePostErrorState extends SocialStates
{
  final String error;

  SocialGetLikePostErrorState(this.error);
}



//chat
class SocialSendMessagesSuccessState extends SocialStates{}

class SocialSendMessagesErrorState extends SocialStates{}

class SocialGetMessagesSuccessState extends SocialStates{}


class AppChangeThemeModeState extends SocialStates{}

class SocialChangeBtNavState extends SocialStates{}

class SocialNewPostState extends SocialStates{}

class SocialProfileImageSuccessState extends SocialStates{}

class SocialProfileImageErrorState extends SocialStates{}

class SocialCoverImageSuccessState extends SocialStates{}

class SocialCoverImageErrorState extends SocialStates{}

class SocialUploadProfileImageSuccessState extends SocialStates{}

class SocialUploadProfileImageErrorState extends SocialStates{}

class SocialUploadCoverImageSuccessState extends SocialStates{}

class SocialUploadCoverImageErrorState extends SocialStates{}

class SocialUserUpdateLoadingState extends SocialStates{}

class SocialUserUpdateErrorState extends SocialStates{}


//create post
class SocialCreatePostLoadingState extends SocialStates{}

class SocialCreatePostSuccessState extends SocialStates{}

class SocialCreatePostErrorState extends SocialStates{}

class SocialUploadPostImageSuccessState extends SocialStates{}

class SocialUploadPostImageErrorState extends SocialStates{}

class SocialRemovePostImageState extends SocialStates{}






