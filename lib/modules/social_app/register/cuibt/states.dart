


abstract class SocialRegisterStates {} 

class SocialRegisterIntialStates extends SocialRegisterStates {} 

class SocialRegisterLoadingStates extends SocialRegisterStates {} 

class SocialRegisterSuccessStates extends SocialRegisterStates
{
  // final SocialLoginModel loginModel;

  // SocialRegisterSuccessStates(this.loginModel);
} 

class SocialRegisterErrorStates extends SocialRegisterStates {

  final String error;

  SocialRegisterErrorStates(this.error);
  } 

  class CreateUserSuccessStates extends SocialRegisterStates
{
  // final SocialLoginModel loginModel;

  // SocialRegisterSuccessStates(this.loginModel);
} 

class CreateUserErrorStates extends SocialRegisterStates {

  final String error;

  CreateUserErrorStates(this.error);
  } 

  class SocialRegisterChangePasswordVisibilityStates extends SocialRegisterStates {} 