import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/text_field/formatter.dart';
import 'package:abg/res/loading/loading_overlay_widget.dart';
import 'package:flutter/services.dart';

import '../validator.dart';

enum FelidType { phone, email, none }

class CustomTextField {
  static Widget selectDropDown(
    String Function(dynamic value) onChange, {
    String hint = '',
    String? label,
    String? Function(String?)? validator,
    TextEditingController? controller,
    bool? enabled,
    List<dynamic> allData = const [],
    required String Function(dynamic) getValue,
  }) {
    String? data;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
      child: SizedBox(
        // height: 50,
        child: TextFormField(
          enabled: enabled,
          validator: validator ??
              ((value) => TValidator.normalValidator(data?.trim(), hint: hint)),
          decoration: _defaultDecoration(
            suffixIcon: DropdownButtonFormField<dynamic>(
              value: data,
              onChanged: (newValue) {
                data = onChange(newValue);
              },
              decoration: _defaultDecoration(),
              dropdownColor: Colors.white,
              items: allData.map<DropdownMenuItem<dynamic>>((dynamic value) {
                return DropdownMenuItem<dynamic>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(getValue(value)),
                  ),
                );
              }).toList(),
            ),
            hintText: hint,
          ),
        ),
      ),
    );
  }

  static Widget dynamicTextField(
    Function(String value) onChange, {
    String hint = '',
    Widget? suffixIcon,  TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      validator: (value) => TValidator.normalValidator(value?.trim()),
      onChanged: (x) => onChange(replaceArabicNumber(x.trim())),
      decoration: _defaultDecoration(
        removeHintWrite: true,
        prefixIcon: suffixIcon,
        hintText: hint,
      ),
    );
  }

  static Widget numberTextField(
    Function(String value) onChange, {
    String hint = '',
    Widget? prefixIcon,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            // height: 50,
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              inputFormatters: [CustomFormatter.onlyDouble()],
              validator: (value) => TValidator.normalValidator(value?.trim()),
              onChanged: (x) => onChange(replaceArabicNumber(x.trim())),
              decoration: _defaultDecoration(
                prefixIcon: const SizedBox(),
                hintText: hint,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget phoneTextField(
    Function(String value) onChange, {
    String? hint,
    Widget? prefixIcon,
    TextEditingController? controller,
    bool readOnly = false,
  }) {
    return addTitle(
      title: CustomTrans.phone.tr,
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(signed: true),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) => TValidator.normalValidator(value?.trim()),
        onChanged: (x) => onChange(x),
        decoration: _defaultDecoration(
            prefixIcon: prefixIcon ?? const Icon(Icons.phone_android),
            hintText: hint ?? CustomTrans.phone.tr,
            removeHintWrite: true),
      ),
    );
  }

  static _defaultDecoration({
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? hintText = "",
    bool removeHintWrite = false,
  }) {
    double radius = 20.r;
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
            color: CustomColors.accent, width: 2.w, style: BorderStyle.solid),
      ),
      suffixIconConstraints: const BoxConstraints(
        maxHeight: 35,
      ),
      suffixIcon: suffixIcon,
      counter: const Offstage(),
      //  prefixIcon: prefixIcon,
      hintText: "${removeHintWrite ? '' : CustomTrans.write.tr} $hintText",
      hintStyle: TFonts.inter(
          color: CustomColors.black,
          fontSize: 16,
          fontWeight: TFontWights.regular),
      labelStyle: TFonts.inter(
          color: CustomColors.textFieldColor,
          fontSize: 16,
          fontWeight: TFontWights.bold),
      errorStyle: TFonts.inter(
        color: CustomColors.red,
        fontSize: 16,
        fontWeight: TFontWights.bold,
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: CustomColors.accent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Color(0xffCED7DE))),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: CustomColors.primary)),
      fillColor: CustomColors.fillTextField,
      hoverColor: CustomColors.primary,
      focusColor: CustomColors.primary,
      iconColor: CustomColors.primary,
      filled: true,
    );
  }

  static Widget passwordTextField(
    Function(String value) onChange, {
    String? hint,
    required bool isVisible,
    required Function() changeVisible,
    String? Function(String?)? validator,
    TextEditingController? controller,
    List<String>? autoFillHints,
    TextInputAction? textInputAction,
  }) {
    return addTitle(
      title: CustomTrans.password.tr,
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        onEditingComplete: () => TextInput.finishAutofillContext(),
        autofillHints: autoFillHints,
        onChanged: (x) => onChange(x.trim()),
        obscureText: isVisible,
        validator: validator ?? (x) => TValidator.normalValidator(x?.trim()),
        decoration: _defaultDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 15.0),
            child: InkWell(
                onTap: changeVisible,
                child: Text(
                    !isVisible ? CustomTrans.hide.tr : CustomTrans.show.tr)),
          ),
          hintText: hint ?? CustomTrans.password.tr,
          removeHintWrite: true,
        ),
      ),
    );
  }

  static Widget nameTextField(
    Function(String value) onChange, {
    String? hint,
    String? Function(String?)? validator,
    TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      onChanged: (x) => onChange(x.trim()),
      validator:
          validator ?? ((value) => TValidator.normalValidator(value?.trim())),
      decoration: _defaultDecoration(
        hintText: hint ?? CustomTrans.name.tr,
        removeHintWrite: true,
      ),
    );
  }

  static Widget paragraphTextField(
    Function(String value) onChange, {
    String hint = '',
    bool isRequired = false,
    TextEditingController? controller,
    // String? Function(String?)? validator,
  }) {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: controller,
      validator: isRequired
          ? (value) => TValidator.normalValidator(value?.trim())
          : null,
      onChanged: (x) => onChange(x.trim()),
      maxLines: null,
      minLines: 6,
      decoration: _defaultDecoration(
        hintText: hint,
        removeHintWrite: true,
      ),
    );
  }

  static Widget websiteTextField(
    Function(String value) onChange, {
    String hint = '',
    // String? chosenText,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        child: TextFormField(
          // controller: TextEditingController(text: chosenText),
          validator: (x) => TValidator.website(x?.trim().toLowerCase()),
          onChanged: (x) => onChange(x.trim()),
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            prefixIcon: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 16.w, top: 12.h, bottom: 12.h, end: 16.w),
              child: SvgPicture.asset(
                "icoPersonalWebsite",
                height: 17.61.h,
                width: 14.w,
                fit: BoxFit.fill,
                color: CustomColors.icoTextField,
              ),
            ),
            hintText: "www.example.com",
            hintStyle: TFonts.inter(
              color: CustomColors.hintTextField,
              fontSize: TFontSizes.f14,
              fontWeight: TFontWights.regular,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.r),
              borderSide: BorderSide(
                  color: CustomColors.borderTextField,
                  width: 2.w,
                  style: BorderStyle.solid),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.r),
              borderSide: BorderSide(
                  color: CustomColors.borderTextField,
                  width: 2.w,
                  style: BorderStyle.solid),
            ),
            fillColor: CustomColors.fillTextField,
            filled: true,
          ),
        ),
      ),
    );
  }

  static Widget dropDownTextField({
    String hint = '',
    Widget? prefixIcon,
    required Function() onDropDownPress,
    String? chosenText,
    bool isRequired = false,
    bool faelid = false,
    TextEditingController? controller,
  }) {
    return InkWell(
      onTap: onDropDownPress,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          IgnorePointer(
            ignoring: true,
            child: SizedBox(
              //height: 50,
              child: TextFormField(
                enabled: true,
                style: TFonts.inter(
                    color: CustomColors.primary,
                    fontSize: 14,
                    fontWeight: TFontWights.bold),
                controller:
                    controller ?? TextEditingController(text: chosenText),
                validator: isRequired
                    ? (value) => TValidator.normalValidator(value)
                    : null,
                decoration: _defaultDecoration(
                  removeHintWrite: true,
                  prefixIcon: prefixIcon,
                  hintText: hint,
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: 5.h,
            child: chosenText?.isEmpty ?? true
                ? InkWell(
                    onTap: onDropDownPress,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: SizedBox(
                        // height: 50,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: SvgPicture.asset(
                            "assets/svg/down.svg",
                            height: 6,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }

  static Widget datePickerTextField({
    String? hint,
    required String prefixIconPath,
    required Function() onDatePickerPress,
    TextEditingController? controller,
    bool isRequired = false,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onDatePickerPress,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          IgnorePointer(
            ignoring: true,
            child: SizedBox(
              //height: 50,
              child: TextFormField(
                enabled: true,
                controller: controller,
                validator: (value) {
                  if (isRequired) {
                    return TValidator.normalValidator(value);
                  } else {
                    return null;
                  }
                },
                decoration: _defaultDecoration(
                  removeHintWrite: true,
                  hintText: hint ?? CustomTrans.date.tr,
                ),
              ),
            ),
          ),
          PositionedDirectional(
            top: 5.h,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onDatePickerPress,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    end: 12, top: 10, bottom: 10),
                child: SizedBox(
                  child: SvgPicture.asset(
                    prefixIconPath,
                    height: 25.h,
                    width: 25.w,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget emailTextField(
    Function(String value) onChange, {
    TextEditingController? controller,
    List<String>? autoFillHints,
    bool readOnly = false,
  }) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      textInputAction: TextInputAction.next,
      autofillHints: autoFillHints,
      keyboardType: TextInputType.emailAddress,
      onChanged: (x) => onChange(x.trim()),
      validator: ((value) => TValidator.email(value?.trim())),
      decoration: _defaultDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            "assets/svg/icons.svg",
            color: Colors.grey,
          ),
        ),
        removeHintWrite: true,
        hintText: CustomTrans.email.tr,
      ),
    );
  }

  static Widget addTitle(
      {String title = "",
      bool showTitle = true,
      required TextFormField child}) {
    return child;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            if (showTitle)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  title,
                  style: TFonts.textTitleStyle(
                    color: CustomColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            if (showTitle)
              const SizedBox(
                height: 10,
              ),
          ],
        ),
        child,
      ],
    );
  }

  static Widget searchAppBarField() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: 16.h,
        start: 16.w,
        end: 16.w,
        top: 140.h,
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
            fillColor: CustomColors.white,
            hintText: "عن أي شيء تبحث؟",
            hintStyle: TFonts.inter(
              fontSize: TFontSizes.f12,
              fontWeight: TFontWights.regular,
              color: CustomColors.hintTextField,
            ),
            suffixIcon: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(Icons.search),
              ),
            ),
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(35),
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            )),
      ),
    );
  }

  static Widget searchField(
    Function(String value) onChange, {
    String hint = "",
    TextEditingController? controller,
    List<String>? autoFillHints,
    void Function()? searchTap,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        // height: 50,
        child: TextFormField(
          controller: controller,
          autofillHints: autoFillHints,
          keyboardType: const TextInputType.numberWithOptions(signed: true),
          style: TFonts.inter(
              color: CustomColors.primary,
              fontSize: 14.sp,
              fontWeight: TFontWights.bold),
          onChanged: (x) => onChange(x.trim()),
          decoration: _defaultDecoration(
            suffixIcon: InkWell(
              onTap: searchTap,
              child: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            removeHintWrite: true,
            hintText: hint,
          ),
        ),
      ),
    );
  }

  static chat(
    Function(String value) onChange, {
    String hint = "",
    TextEditingController? controller,
    List<String>? autoFillHints,
    void Function()? onTap,
    EdgeInsetsGeometry? padding,
  }) {
    final button = Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(
          width: 50,
          height: 50,
          child: LoadingOverLay(
            id: loadingIconID,
            showLoadingOnly: true,
            child: GestureDetector(
                onTap: onTap, child: SvgPicture.asset("assets/svg/send.svg")),
          ),
        ));
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
      child: SizedBox(
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                autofillHints: autoFillHints,
                style: TFonts.inter(
                    color: CustomColors.primary,
                    fontSize: 14.sp,
                    fontWeight: TFontWights.bold),
                onChanged: (x) => onChange(x.trim()),
                decoration: InputDecoration(
                  filled: true,
                  hintText: CustomTrans.message.tr,
                  hintStyle: TFonts.cardBody(color: Colors.grey),
                  fillColor: const Color(0xffF2F2F2),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            button,
          ],
        ),
      ),
    );
  }
}

String replaceArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(arabic[i], english[i]);
  }
  //Print.info(input);
  return input;
}
