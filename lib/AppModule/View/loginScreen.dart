import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stchealth/AppModule/View/bottomNavigationBar.dart';
import 'package:stchealth/AppModule/customWidgets/customButton.dart';
import 'package:stchealth/AppModule/customWidgets/customToast.dart';
import 'package:stchealth/AppModule/customWidgets/myText.dart';
import '../Controller/AllController.dart';
import '../customWidgets/customTexField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    return null;
  }

  bool readOnly = true;
  String? _email;
  bool _isValid = false;
  var _formKey = GlobalKey<FormState>();
  var controller = Get.put(AllController());

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.h,
                width: 100.w,
                // color: Colors.red,
                padding: EdgeInsets.all(20.sp),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff188095),
                    Color(0xff2AB3C6),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: myText(
                          text: "STC\nhealth".toUpperCase(),
                          fontweight: FontWeight.w400,
                          size: 22.sp,
                          color: Colors.white),
                    ),
                    SizedBox(height: 12.h),
                    myText(
                        text: "Login",
                        fontweight: FontWeight.w700,
                        size: 22.sp,
                        color: Colors.white)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.sp),
                child: Column(
                  children: [
                    customLoginTextField(
                      controller: emailcontroller,
                      label: 'Email',
                      validator: _emailValidator,
                      onChange: (value) {
                        setState(() {
                          _email = value;
                          _isValid = _emailValidator(value) == null;
                        });
                      },
                      sufixIcon: _isValid
                          ? Image.asset(
                              'assets/Checkmark.png',
                              height: 1,
                            )
                          : null,
                    ),
                    customLoginTextField(
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an password';
                          }
                          return null;
                        },
                        obscure: readOnly,
                        label: 'Password',
                        sufixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                readOnly = !readOnly;
                              });
                            },
                            icon: Icon(readOnly
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined))),
                    SizedBox(height: 3.h),
                    Obx(() => customContainerButton(
                        radius: 50.sp,
                        loading: controller.loginLoading.value,
                        text: "Continue",
                        onpress: () async {
                          if (_formKey.currentState!.validate()) {
                            bool res = await controller.loginFun(data: {
                              "username": emailcontroller.text.trim(),
                              "password": passwordcontroller.text.trim()
                            });
                            print("================  val is $res");
                            res
                                ? Get.offAll(BottomBarScreen1(),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(milliseconds: 600))
                                : showMsgToast(
                                    message: 'Incorrect email or password');
                          } else {}
                        })),
                    SizedBox(height: 3.h),
                    myText(text: "NEED HELP?")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
