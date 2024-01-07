import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idoc/main.dart';
import 'package:idoc/views/auth/sign_up_screen.dart';
import 'package:idoc/views/dashboard/dashboard_screen.dart';
import '../../common/providers/providers.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_textfield.dart';
import '../../common/widgets/loading_button_container.dart';
import '../../utils/app_constants.dart';
import '../../utils/color_constants.dart';
import '../../utils/shared_pref_instance.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/Login';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> _password = ValueNotifier<bool>(true);
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _termsCondition = ValueNotifier<bool>(false);
  @override
  void initState() {
    String? email = SharedPreference.instance.getData('email');
    String? password = SharedPreference.instance.getData('password');
    String? terms = SharedPreference.instance.getData('terms');
    if (terms == 'true') {
      Future.delayed(Duration.zero, () {
        _termsCondition.value = true;
      });
    }
    if (email != null && password != null) {
      passwordController.text = password;
      emailController.text = email;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Background color of the status bar
      statusBarIconBrightness: Brightness.light, // Icon color of the status bar
    ));
    //ref.watch(authProvider).pushNotificationsManager.init();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.primary,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 100,),
          Hero(
            tag: "AppIcon",
            child: Image.asset(
              'assets/image/app_icon_white.png',
              height: 60,
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(height: 45,),
          Text("Sign in",style: AppConstants.heading2.copyWith(color: Colors.white,fontSize: 27),),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
            ),
            child: Column(
              children: [
                Consumer(builder: (ctx, ref, _) {
                  bool loginError = ref
                      .watch(authProvider.select((value) => value.loginError));
                  return loginError
                      ? Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: const Text(
                            'Email or password is incorrect',
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      : const SizedBox();
                }),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        isWhite: true,
                        backgroundColor: ColorConstants.primary,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color:ColorConstants.grey.shade300,
                        ),
                        controller: emailController,
                        hintText: 'Email address',
                        textInputType: TextInputType.emailAddress,
                        titleSpacing: 5,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: _password,
                        builder: (context, password, _) {
                          return AppTextFormField(
                            isWhite: true,
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color:ColorConstants.grey.shade300,
                            ),
                            backgroundColor: ColorConstants.primary,
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: password,
                            titleSpacing: 5,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _password.value = !password;
                              },
                              child: !password
                                  ? Image.asset(
                                      "assets/image/see.png",
                                      color: ColorConstants.grey.shade300,
                                      scale: 2,
                                    )
                                  : Image.asset(
                                      "assets/image/eye-slash.png",
                                      color: ColorConstants.grey.shade300,
                                      scale: 2,
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                  //  ref.read(authProvider).forgetPassword(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0,bottom: 20,top: 6),
                        child: Text(""
                            "Forgot Password?",style: AppConstants.heading2.copyWith(color: ColorConstants.white,fontSize: 10),),
                      ),
                    ],
                  ),
                ),
                Consumer(
                  builder: (context, ref, _) {
                    bool loading = ref.watch(
                        authProvider.select((provider) => provider.loading));
                    var provider = ref.read(authProvider);
                    return CustomButton(
                      loader: loading,
                      isWhite: true,
                      onPress: () {
                        navigatorKey.currentState?.pushNamed(DashboardScreen.routeName);
                      },
                      title: 'Sign-in',
                      height: 45,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("I Don't have an account?  ",style: AppConstants.heading2.copyWith(color: Colors.white,fontSize: 14),),
              GestureDetector(
                  onTap: (){
                    navigatorKey.currentState?.pushNamed(SignUpScreen.routeName);
                  },
                  child: Text("Sign Up",style: AppConstants.heading2.copyWith(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset("assets/image/men_login_bottom.png"),
          )
        ],
      ),
    );
  }
}
