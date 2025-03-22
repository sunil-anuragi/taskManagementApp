import 'package:jewellery/common/widgets/text/custom_text.dart';
import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/utils/validate_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class AppTextField1 extends StatefulWidget {
  const AppTextField1({
    super.key,
    this.applyValidation = true,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.suffix,
    this.prefix,
    this.obscure,
    this.keyboardType,
    this.maxLength,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.isEnable,
    this.maxLines = 1,
    this.minLines,
    this.fillColor,
    this.filled,
    this.onEditingComplete,
    this.height,
    this.onSuffixTap,
    this.onTap,
    this.borderRadius,
    this.inputFormatters,
    this.textFieldKey,
    this.isRequired = true,
    this.canMatchString,
    this.isInRow = false,
    this.isTimeTextField = false,
    this.labelText,
    this.labelTextStyle,
    this.borderColor,
    this.hoverColor,
    this.bottom = 15,
    this.sizedBx,
    this.isDense = false,
    this.isVisible = true,
    this.isAutoFocus = false,
    this.fontSize,
    this.focusNode,
    this.readOnly = false,
    this.showCounterLength = true,
    this.isshadow = false,
    this.titleAlign = CrossAxisAlignment.start,
  });

  final bool applyValidation;
  final bool isshadow;
  final CrossAxisAlignment titleAlign;

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final dynamic suffix;
  final dynamic prefix;
  final bool? obscure;
  final bool readOnly;
  final dynamic keyboardType;
  final Color? fillColor;
  final Color? borderColor;
  final bool? filled;
  final int? maxLength;
  final Function(String? value)? onSaved;
  final Function(String? value)? onFieldSubmitted;
  final dynamic onChanged;
  final bool? isEnable;
  final int? minLines;
  final int? maxLines;
  final double? height;
  final dynamic onSuffixTap;
  final dynamic onTap;
  final BorderRadius? borderRadius;
  final Function()? onEditingComplete;
  final String? textFieldKey;
  final bool isRequired;
  final bool isTimeTextField;
  final String? canMatchString;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool isInRow;
  final double? sizedBx;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final Color? hoverColor;
  final double bottom;
  final bool isDense;
  final bool isVisible;
  final bool isAutoFocus;
  final double? fontSize;
  final FocusNode? focusNode;
  final bool showCounterLength;

  @override
  State<AppTextField1> createState() => _AppTextField1State();
}

class _AppTextField1State extends State<AppTextField1> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottom),
      child: widget.isVisible == false
          ? Container()
          : Column(
              crossAxisAlignment: widget.titleAlign ?? CrossAxisAlignment.start,
              children: [
                if (widget.labelText != null)
                  CustomText(
                    widget.labelText ?? '-',
                    style: widget.labelTextStyle,
                  ),
                if (widget.labelText != null)
                  SizedBox(
                    height: widget.sizedBx ?? 10,
                  ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: widget.isshadow
                        ? [
                            BoxShadow(
                              color: AppColorConsts.primaryColor
                                  .withOpacity(0.1), // Shadow color
                              blurRadius: 10, // Softness of the shadow
                              offset:
                                  const Offset(0, 0), // Shadow position (x, y)
                            ),
                          ]
                        : [],
                  ),
                  height: widget.height,
                  child: TextFormField(
                    focusNode: widget.focusNode,
                    cursorColor: AppColorConsts.darkBlueColor,
                    autocorrect: true,
                    enabled: widget.isEnable,
                    onTap: widget.onTap,
                    autofocus: widget.isAutoFocus,
                    readOnly: widget.readOnly,
                    onSaved: widget.onSaved,
                    style: (!(widget.isEnable ?? true)) &&
                            !(widget.isTimeTextField)
                        ? AppTextStyle.regular14TextStyle.copyWith(
                            color: AppColorConsts.primaryColor,
                            fontSize: widget.fontSize)
                        : AppTextStyle.regular14TextStyle.copyWith(
                            color: AppColorConsts.primaryColor,
                            fontSize: widget.fontSize),
                    keyboardType: widget.keyboardType,
                    maxLength: widget.maxLength,
                    maxLines: widget.obscure == true ? 1 : widget.maxLines,
                    controller: widget.controller,
                    validator: widget.validator ??
                        (textValue) {
                          return validateTextFieldByKey(
                              textKey: widget.textFieldKey ?? "",
                              isRequired: widget.isRequired,
                              textFieldValue: textValue,
                              matchValue: widget.canMatchString);
                        },
                    obscureText: widget.obscure ?? false,
                    textInputAction:
                        widget.textInputAction ?? TextInputAction.next,
                    onChanged: widget.onChanged,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    onEditingComplete: widget.onEditingComplete,
                    inputFormatters: widget.inputFormatters,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      counter: widget.showCounterLength
                          ? null
                          : const SizedBox.shrink(),
                      counterText: "",
                      isDense: widget.isDense,
                      filled: widget.filled ?? true,
                      fillColor: widget.fillColor ??
                          (widget.isEnable == false
                              ? AppColorConsts.greyColor
                              : widget.fillColor ?? AppColorConsts.whiteColor),
                      helperText: widget.isInRow ? "" : null,
                      suffixIconConstraints: const BoxConstraints(),
                      prefixIconConstraints: const BoxConstraints(),
                      errorStyle: const TextStyle(
                        fontWeight: FontWeight.w100,
                        overflow: TextOverflow.visible,
                        fontSize: 10,
                      ),
                      hintStyle: AppTextStyle.regular14TextStyle.copyWith(
                        color: AppColorConsts.hintStyleColor,
                        fontSize: screenSize > 600 ? 18 : 14,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      suffixIcon: widget.obscure != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: widget.onSuffixTap,
                                  child: widget.obscure!
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: AppColorConsts.darkBlueColor,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: AppColorConsts.darkBlueColor,
                                        )),
                            )
                          : widget.suffix,
                      prefixIcon: widget.prefix,
                      labelText: widget.label,
                      hintText: widget.hint,
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            widget.borderRadius ?? BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            widget.borderRadius ?? BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            widget.borderRadius ?? BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: widget.isEnable == false
                                ? AppColorConsts.borderColor1
                                : AppColorConsts.primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            widget.borderRadius ?? BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: widget.borderColor ??
                                AppColorConsts.borderColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius:
                            widget.borderRadius ?? BorderRadius.circular(7),
                        borderSide: BorderSide(
                            color: widget.borderColor ??
                                AppColorConsts.borderColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

String? validateTextFieldByKey({
  required String textKey,
  required String? textFieldValue,
  required bool isRequired,
  String? matchValue,
}) {
  String? validationError;
  //Regular Expression
  RegExp emailExpression = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  // RegExp mobileExpression =
  //     RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)');

  RegExp gstNumberPattern = RegExp(
      "^([0-9]{2}[a-zA-Z]{4}([a-zA-Z]{1}|[0-9]{1})[0-9]{4}[a-zA-Z]{1}([a-zA-Z]|[0-9]){3}){0,15}\$");

  // RegExp adharCardExpression =
  //     RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$');

  RegExp panCardExpression = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');

  RegExp drivingLicense = RegExp(
      r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$');

  RegExp fullName = RegExp('[a-zA-Z]');
  RegExp passportNumber = RegExp('^(?!^0+)[a-zA-Z0-9]{3,20}');

  // RegExp pinCodeExpression = RegExp("^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}\$");

  RegExp passwordExpression =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  RegExp ifscCodeExpression = RegExp("^[A-Z]{4}[0][A-Z0-9]{6}");

  // RegExp validLinkExpression = RegExp(
  //     r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌,.;]*)?");

  debugPrint("value key ==== $textKey");
  if (textFieldValue == null || textFieldValue.isEmpty) {
    if (isRequired) {
      validationError = "$textKey Can't be Empty";
    } else {
      validationError = null;
    }
  } else if (textKey == ValidationKey.emailKey) {
    if (emailExpression.hasMatch(textFieldValue)) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid Email";
    }
  } else if (textKey == ValidationKey.passportNumber) {
    if (passportNumber.hasMatch(textFieldValue)) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid Passport Number";
    }
  } else if (textKey == ValidationKey.mobileNumberKey) {
    if (textFieldValue.length == 10) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid Mobile Number";
    }
  }

  // else if (textKey == ValidationKey.dateKey) {
  //   if (getValidDateFromString(dateText: textFieldValue) != null) {
  //     validationError = null;
  //   } else {
  //     validationError = "Please Enter Valid Date";
  //   }
  // }
  else if (textKey == ValidationKey.gstKey) {
    if (gstNumberPattern.hasMatch(textFieldValue)) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid GST Number";
    }
  } else if (textKey == ValidationKey.adharCardKey) {
    if (textFieldValue.length == 12) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid Aadhar Card Number";
    }
  } else if (textKey == ValidationKey.panCardKey) {
    if (panCardExpression.hasMatch(textFieldValue)) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid Pan Card Number";
    }
  } else if (textKey == ValidationKey.drivingLicenseKey) {
    if (drivingLicense.hasMatch(textFieldValue)) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid Driving License Number";
    }
  } else if (textKey == ValidationKey.pinCodeKey) {
    if (textFieldValue.length <= 10 && textFieldValue.length >= 6) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid Pin Code";
    }
  } else if (textKey == ValidationKey.passwordKey) {
    if (passwordExpression.hasMatch(textFieldValue)) {
      validationError = null;
    } else {
      validationError = "Please Enter Valid Password";
    }
  } else if (textKey == ValidationKey.reEnteredPassword) {
    if (textFieldValue == matchValue) {
      validationError = null;
    } else {
      validationError = "Password Must Be Match";
    }
  } else if (textKey == ValidationKey.ifscCodeValueKey) {
    if (ifscCodeExpression.hasMatch(textFieldValue)) {
      validationError = null;
    } else {
      validationError = "Enter Valid IFSC Code";
    }
  } else if (textKey == ValidationKey.fullName) {
    if (fullName.hasMatch(textFieldValue)) {
      validationError = null;
    } else {
      validationError = "Enter Valid Full Name";
    }
  } else if (textKey == ValidationKey.firstName) {
    if (textFieldValue.isNotEmpty) {
      validationError = null;
    } else {
      validationError = "Enter First Name";
    }
  } else if (textKey == ValidationKey.lastName) {
    if (textFieldValue.isNotEmpty) {
      validationError = null;
    } else {
      validationError = "Enter Last Name";
    }
  } else {
    validationError = null;
  }

  return validationError;
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter({this.decimalRange = 2});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final RegExp regExp = RegExp(r'^\d{0,3}(\.\d{0,2})?$');
    if (regExp.hasMatch(newValue.text)) {
      return newValue;
    }

    return oldValue;
  }
}
