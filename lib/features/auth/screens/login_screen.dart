import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_planner_app/common/utils/constants.dart';
import 'package:task_planner_app/common/widgets/app_style.dart';
import 'package:task_planner_app/common/widgets/custom_button.dart';
import 'package:task_planner_app/common/widgets/height_spacer.dart';
import 'package:task_planner_app/common/widgets/reusable_text.dart';
import 'package:task_planner_app/common/widgets/show_dialog.dart';
import 'package:task_planner_app/features/auth/controllers/auth_controller.dart';

import '../../../common/widgets/custom_text_field.dart';
import '../../todo/controllers/code_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  Country country = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'USA',
    example: "USA",
    displayName: "United States",
    displayNameNoCountryCode: 'US',
    e164Key: '',
  );

  sendCodeToUser() {
    if (_phoneController.text.isEmpty) {
      return showAlertDialog(
          context: context, message: 'Please enter your phone number');
    } else if (_phoneController.text.length < 8) {
      return showAlertDialog(
          context: context, message: 'Your phone number is too short');
    } else {
      ref.read(authControllerProvider).sendSMS(
          context: context,
          phoneNumber:
              '+${country.phoneCode}${_phoneController.text}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset('assets/images/todo.png', width: 300),
              ),
              const HeightSpacer(heightSpacing: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: 'Please provide your phone number',
                  style: appStyle(
                    17,
                    AppConstant.kLight,
                    FontWeight.w500,
                  ),
                ),
              ),
              const HeightSpacer(heightSpacing: 20),
              Center(
                child: CustomTextField(
                  controller: _phoneController,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          countryListTheme: CountryListThemeData(
                              backgroundColor: AppConstant.kGreyLight,
                              bottomSheetHeight: AppConstant.kHeight * 0.6,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConstant.kRadius),
                                topRight: Radius.circular(AppConstant.kRadius),
                              )),
                          context: context,
                          onSelect: (code) {
                            setState(() {
                              country = code;
                            });
                            
                          },
                        );
                      },
                      child: ReusableText(
                        text: '${country.flagEmoji} + ${country.phoneCode}',
                        style: appStyle(
                          18,
                          AppConstant.kBkDark,
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  hintText: 'Enter phone number',
                  hintStyle: appStyle(
                    16,
                    AppConstant.kBkDark,
                    FontWeight.w600,
                  ),
                ),
              ),
              const HeightSpacer(heightSpacing: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomButton(
                  ontap: () {
                    sendCodeToUser();
                  },
                  width: AppConstant.kWidth * 0.9,
                  height: AppConstant.kHeight * 0.075,
                  textButtonColor: AppConstant.kBkDark,
                  buttonColor: AppConstant.kLight,
                  text: 'Send code',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
