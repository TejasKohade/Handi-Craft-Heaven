import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/controllers/auth_controller.dart';
import 'package:e_mart_app/views/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfield.dart';
import '../../widgets_common/our_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Welcome to $appName".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                      hint: nameHint,
                      title: name,
                      controller: nameController,
                      isPass: false,
                    ),
                    customTextField(
                      hint: emailHint,
                      title: email,
                      controller: emailController,
                      isPass: false,
                    ),
                    customTextField(
                      hint: passwordHint,
                      title: password,
                      controller: passwordController,
                      isPass: true,
                    ),
                    customTextField(
                      hint: passwordHint,
                      title: retypePass,
                      controller: passwordRetypeController,
                      isPass: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPass.text.make()),
                    ),
                    5.heightBox,
                    // ourButton().box.width(context.screenWidth-50).make(),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: redColor,
                          checkColor: whiteColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          },
                        ),
                        10.widthBox,
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: termsAndCond,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "&",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color: isCheck == true ? redColor : lightGrey,
                            title: signup,
                            textColor: isCheck == true ? whiteColor : redColor,
                            onPress: () async {
                              if (isCheck != false) {
                                controller.isLoading(true);
                                try {

                                  await controller
                                      .signupMethod(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    return controller.storeUserData(
                                        email: emailController.text,
                                        name: nameController.text,
                                        password: passwordController.text);
                                  }).then((value) {
                                    VxToast.show(context, msg: loggedin);
                                    Get.offAll(() => Home());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isLoading(false);
                                }
                              }
                            },
                          ).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: alreadyHaveAccount,
                            style: TextStyle(
                              fontFamily: bold,
                              color: fontGrey,
                            ),
                          ),
                          TextSpan(
                            text: login,
                            style: TextStyle(
                              fontFamily: bold,
                              color: redColor,
                            ),
                          ),
                        ],
                      ),
                    ).onTap(() {
                      Get.back();
                    }),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
