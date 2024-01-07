import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idoc/utils/color_constants.dart';
import 'package:idoc/views/auth/login_screen.dart';
import 'package:idoc/views/dashboard/dashboard_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../common/providers/providers.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_textfield.dart';
import '../../main.dart';
import '../../utils/app_constants.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  static const routeName = "/SignUpScreen";

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final ValueNotifier<bool> _password = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneTextFieldController = TextEditingController();
  String? selectedCountryShortName;
  String? selectedCountryCode;

  bool isCheckedOne = false;
  bool isCheckedTwo = false;

  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  String? selectedValue;

  final _formKe = GlobalKey<FormState>();


  void toggle1Checkbox(bool value) {
    setState(() {
      isCheckedOne = value;
    });
  }

  void toggle2Checkbox(bool value) {
    setState(() {
      isCheckedTwo = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Background color of the status bar
      statusBarIconBrightness: Brightness.dark, // Icon color of the status bar
    ));
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset("assets/image/signup_icon.png",scale: 2,),
            const SizedBox(height: 8,),
            Text("Sign Up",style: AppConstants.heading2.copyWith(color: ColorConstants.primary,fontSize: 26),),
            const SizedBox(height: 12,),
             Expanded(
               child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: AppTextFormField(
                            hintText: 'First Name',
                            textInputType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: AppTextFormField(
                            hintText: 'Last Name',
                            textInputType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    AppTextFormField(

                      prefixIcon: Image.asset("assets/image/date.png",scale: 2,color:ColorConstants.grey,),
                      hintText: 'Date of Birth MM/DD/YYYY',
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        border: Border.all(color:ColorConstants.grey,),
                      ),
                      height: 46,
                      alignment: Alignment.center,
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          prefixIcon: Image.asset("assets/image/gender.png",scale: 2,color:ColorConstants.grey,),
                          contentPadding: const EdgeInsets.only(top: 7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          hintText: "Select Your Gender",
                          hintStyle: AppConstants.heading2.copyWith(color:Colors.black.withOpacity(0.4),fontSize: 13),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          // Add more decoration..
                        ),
                        // hint: Text(
                        //   'Select Your Gender',
                        //   style: AppConstants.heading2.copyWith(color:Colors.black.withOpacity(0.4),fontSize: 13),
                        // ),

                        items: genderItems.map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: AppConstants.heading2.copyWith(color:Colors.black,fontSize: 12),
                          ),
                        )).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select gender.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          //Do something when selected item is changed.
                        },
                        onSaved: (value) {
                          selectedValue = value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 10),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Image.asset("assets/image/arrow_down.png",scale: 2,color:ColorConstants.grey,),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ),
                    // AppTextFormField(
                    //   onClick: () {
                    //
                    //   },
                    //   prefixIcon: Image.asset("assets/image/gender.png",scale: 2,color:ColorConstants.grey,),
                    //   //suffixIcon: Image.asset("assets/image/dropdown_arrow.png",scale: 2,color:ColorConstants.grey,),
                    //   hintText: 'Select your gender',
                    //   suffixIcon: Image.asset(
                    //     "assets/image/arrow_down.png",
                    //     color: ColorConstants.grey,
                    //     scale: 2,
                    //   ),
                    //   textInputType: TextInputType.emailAddress,
                    // ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          //margin: EdgeInsets.symmetric(vertical:3),
                          width: 105,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(color:ColorConstants.grey,),

                          ),
                          height: 46,
                          padding:const  EdgeInsets.only(left: 6),
                          alignment: Alignment.center,
                          child: IntlPhoneField(
                            showDropdownIcon: false,
                            autovalidateMode: AutovalidateMode.disabled,
                            disableLengthCheck: true,
                            style: Theme.of(context).textTheme.bodyLarge,
                            readOnly: true,
                            cursorHeight: 0,
                            decoration: InputDecoration(

                              isDense: false,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                            initialCountryCode: selectedCountryShortName,
                            onCountryChanged: (country) {
                              selectedCountryShortName =
                                  country.code;
                              selectedCountryCode =
                                  country.dialCode;
                            },
                            onChanged: (phone) {
                              phoneTextFieldController.text =
                                  phone.number;
                              selectedCountryCode =
                                  phone.countryCode;

                              if (phone.number.length == 1 &&
                                  phone.number == '0') {
                                phoneTextFieldController.text =
                                '';
                              }

                              phoneTextFieldController
                                  .selection = TextSelection.fromPosition(
                                TextPosition(
                                  offset: phoneTextFieldController.text.length,
                                ),
                              );

                              /*   print(phone.completeNumber);
                              print(phone.countryCode);
                              print(phone.number);*/
                            },
                          ),
                        ),
                        const SizedBox(width: 10,),
                        const Expanded(
                          child: AppTextFormField(
                            hintText: 'Mobile No.',
                            textInputType: TextInputType.phone,
                            titleSpacing: 5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    const AppTextFormField(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color:ColorConstants.grey,
                      ),
                      //controller: emailController,
                      hintText: 'Email address',
                      textInputType: TextInputType.emailAddress,
                      titleSpacing: 5,
                    ),
                    const SizedBox(height: 5,),
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
                    const SizedBox(height: 5,),
                    ValueListenableBuilder<bool>(
                      valueListenable: _password,
                      builder: (context, password, _) {
                        return AppTextFormField(
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color:ColorConstants.grey,
                          ),
                          //controller: passwordController,
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
                              color: ColorConstants.grey,
                              scale: 2,
                            )
                                : Image.asset(
                              "assets/image/eye-slash.png",
                              color: ColorConstants.grey,
                              scale: 2,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            toggle1Checkbox(!isCheckedOne);
                          },
                          child: SizedBox(
                            height: 30,
                            width: 20,
                            child: Checkbox(
                              side:  BorderSide(
                                  color: Colors.grey
                              ),
                              checkColor: ColorConstants.white.withOpacity(0.9),
                              //fillColor: MaterialStateProperty.all(Colors.white),
                              value: isCheckedOne,
                              onChanged: (value) {
                                toggle1Checkbox(value!);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          'Agree to Terms and Conditions',
                          style: AppConstants.heading2.copyWith(fontSize: 11,color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            toggle2Checkbox(!isCheckedTwo);
                          },
                          child: SizedBox(
                            height: 30,
                            width: 20,
                            child: Checkbox(
                              side: BorderSide(
                                color: Colors.grey
                              ),
                              checkColor: ColorConstants.white.withOpacity(0.9),
                             // fillColor: MaterialStateProperty.all(ColorConstants.primary),
                              value: isCheckedTwo,
                              onChanged: (value) {
                                toggle2Checkbox(value!);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          'Email me health tips',
                          style: AppConstants.heading2.copyWith(fontSize: 11,color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                    CustomButton(
                      onPress: () {
                        navigatorKey.currentState?.pushNamed(DashboardScreen.routeName);
                      },
                      title: 'Sign Up',
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?  ",style: AppConstants.heading2.copyWith(color: ColorConstants.black,fontSize: 14),),
                        GestureDetector(
                            onTap: (){
                               navigatorKey.currentState?.pushNamed(LoginScreen.routeName);
                            },
                            child: Text("Sign in",style: AppConstants.heading2.copyWith(color: ColorConstants.primary,fontSize: 15,fontWeight: FontWeight.bold),)),
                      ],
                    ),
                    const SizedBox(height: 90,),
                    Image.asset("assets/image/girl_signup_bottom.png")
                  ],
                ),
            ),
             )
          ],
        ),
      ),
    );
  }
}
