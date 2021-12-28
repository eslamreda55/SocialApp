import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/social_app/Social_layout.dart';
import 'package:udemy_flutter/modules/social_app/register/social_register_screen.dart';
import 'package:udemy_flutter/modules/social_app/social_login/cuibt/cubit.dart';
import 'package:udemy_flutter/modules/social_app/social_login/cuibt/states.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/cashe_helper.dart';


class SocialLoginScreen extends StatelessWidget {
  
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context)=> SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit , SocialLoginStates>(
        listener: (context , state) 
        {
          if(state is SocialLoginErrorStates)
          {
            showToast(
              text: state.error, 
              state: toastState.ERROR,
              );
          }else if(state is SocialLoginSuccessStates)
          {
            CasheHelper.saveData(
              key: 'uId', 
              value:state.uId ,
              ).then((value) 
              {

                navigateAndFinish(context, Sociallayout());
              });
            
          }
        },
        builder: (context , state) 
        {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: 
                      [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'login low to meet new friends',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                            validate: (String value)
                            {
                              if(value.isEmpty){
                                return 'email must not to be empty';
                              }
                            },
                            prefixIcon: Icons.email,
                              label: 'Email Address',
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                  validate: (String value)
                                  {
                                    if(value.isEmpty){
                                      return 'password is too short';
                                    }
                                  },
                                isPassword: SocialLoginCubit.get(context).isPassword,
                                onsubmited: (value)
                                {
                                  if(formKey.currentState.validate())
                                      {
                                      SocialLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        );
                                      }
                                },
                                prefixIcon: Icons.lock_open,
                                sufix:SocialLoginCubit.get(context).suffix,
                                sufixOnPressed:()
                                {
                                  SocialLoginCubit.get(context).changeSuffixPassword();
                                } ,
                                label: 'Password',
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                            ConditionalBuilder(
                              condition:state is! SocialLoginLoadingStates ,
                               builder: (context)=> defaultButton(
                                onPressed: ()
                                {
                                  if(formKey.currentState.validate())
                                  {
                                    SocialLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      );
                                  }
                                },
                                text: 'LOGIN',
                                isUpperCase: true,
                                ),
                               fallback: (context)=>Center(child: CircularProgressIndicator()),
                               ),
                               
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                [
                                  Text('Don\'t have an account?'),
                                  defaultTextButton(
                                    onPressed: ()
                                    {
                                      navigateTo(context, SocialRegisterScreen(),);
                                    },
                                    text: 'Register Now' ,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  
        },
        ),
      );
    }
}