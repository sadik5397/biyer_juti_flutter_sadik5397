import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../theme/colors.dart';
import '../util/global_function.dart';

class ThemeTextField {
  static Padding primary(
      {required String labelText,
      required TextEditingController controller,
      EdgeInsetsGeometry? padding,
      int maxLines = 1,
      bool required = false,
      bool transparent = false,
      bool isPassword = false,
      bool hasSubmitButton = false,
      bool isDate = false,
      bool isFile = false,
      bool showLabel = true,
      bool showIcon = true,
      bool floatLabel = true,
      bool readOnly = false,
      bool autoFocus = false,
      bool centerAlign = false,
      bool showPassword = false,
      bool isDisable = false,
      bool showClearButton = false,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      String? errorText,
      TextStyle? labelStyle,
      String autofillHints = "",
      FocusNode? focusNode,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      VoidCallback? showPasswordPressed,
      VoidCallback? onFieldSubmittedAlternate,
      VoidCallback? onTap,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      List<TextInputFormatter>? textInputFormatter}) {
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: TextFormField(
            inputFormatters: textInputFormatter,
            readOnly: (isDate || isFile || readOnly),
            showCursor: !(isDate || isFile || readOnly),
            onTap: onTap,
            onChanged: onChanged,
            maxLines: maxLines,
            autofillHints: [autofillHints],
            focusNode: focusNode,
            textAlign: centerAlign ? TextAlign.center : TextAlign.start,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            obscureText: (isPassword) ? !showPassword : false,
            controller: controller,
            style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w500),
            autofocus: autoFocus,
            enabled: !isDisable,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r4, borderSide: BorderSide(color: ThemeColor.secondary)),
                errorBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r4, borderSide: BorderSide(color: Colors.redAccent.shade100)),
                focusedErrorBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r4, borderSide: const BorderSide(color: Colors.redAccent)),
                enabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r4, borderSide: BorderSide(color: ThemeColor.primary)),
                disabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r4, borderSide: BorderSide.none),
                labelText: showLabel ? "$labelText ${required ? '*' : ''}" : null,
                isDense: false,
                errorText: (errorText == "null" || errorText == null) ? null : cleanedString(errorText),
                alignLabelWithHint: false,
                filled: !transparent,
                fillColor: isDisable ? Colors.black12 : Colors.white,
                floatingLabelBehavior: floatLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.always,
                contentPadding: ThemePadding.p3 * 1.2,
                labelStyle: labelStyle ?? TextStyle(color: ThemeColor.primary.withOpacity(.5), fontSize: 14, fontWeight: FontWeight.normal),
                hintText: showLabel ? hintText : "$labelText ${required ? '*' : ''}",
                hintStyle: showLabel ? TextStyle(color: ThemeColor.jetBlack.withOpacity(.25), fontSize: 14, fontWeight: FontWeight.normal) : null,
                floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold),
                suffixIconColor: ThemeColor.jetBlack,
                suffixIcon: showIcon
                    ? Padding(
                        padding: ThemePadding.pr2,
                        child: isPassword
                            ? IconButton(
                                onPressed: showPasswordPressed, icon: Icon((!showPassword) ? Icons.visibility_outlined : Icons.visibility_off_outlined), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                            : isDate
                                ? IconButton(onPressed: onTap, icon: const Icon(Icons.calendar_month_sharp), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                                : isFile
                                    ? IconButton(onPressed: onTap, icon: const Icon(Icons.attach_file_rounded), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                                    : hasSubmitButton
                                        ? IconButton(onPressed: onFieldSubmittedAlternate, icon: const Icon(Icons.arrow_downward_sharp), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                                        : maxLines == 1 && showClearButton
                                            ? IconButton(onPressed: () => controller.clear(), icon: const Icon(Icons.cancel_outlined), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                                            : null)
                    : null)));
  }

  static Padding pill(
      {required String labelText,
      required TextEditingController controller,
      EdgeInsetsGeometry? padding,
      int maxLines = 1,
      double? fontSize,
      bool required = false,
      bool boldStyle = false,
      bool isPassword = false,
      bool hasSubmitButton = false,
      bool isDate = false,
      bool isFile = false,
      bool smallSize = false,
      bool showLabel = true,
      bool showIcon = true,
      bool floatLabel = true,
      bool readOnly = false,
      bool autoFocus = false,
      bool centerAlign = false,
      bool showPassword = false,
      bool isDisable = false,
      BorderRadius? borderRadius,
      bool showClearButton = false,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      String? errorText,
      Color? hintColor,
      String autofillHints = "",
      FocusNode? focusNode,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      VoidCallback? showPasswordPressed,
      VoidCallback? onFieldSubmittedAlternate,
      VoidCallback? onTap,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      List<TextInputFormatter>? textInputFormatter}) {
    return Padding(
        padding: padding ?? ThemePadding.pb4,
        child: TextFormField(
            inputFormatters: textInputFormatter,
            readOnly: (isDate || isFile || readOnly),
            showCursor: !(isDate || isFile || readOnly),
            onTap: onTap,
            onChanged: onChanged,
            maxLines: maxLines,
            autofillHints: [autofillHints],
            focusNode: focusNode,
            textAlign: centerAlign ? TextAlign.center : TextAlign.start,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization,
            obscureText: (isPassword) ? !showPassword : false,
            controller: controller,
            style: boldStyle
                ? TextStyle(color: ThemeColor.secondary, fontSize: fontSize ?? 14, fontWeight: FontWeight.bold, letterSpacing: 6)
                : TextStyle(color: ThemeColor.jetBlack, fontSize: fontSize ?? 14, fontWeight: FontWeight.w500),
            autofocus: autoFocus,
            enabled: !isDisable,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(borderRadius: borderRadius ?? ThemeBorderRadius.r6, borderSide: const BorderSide(color: Colors.transparent)),
                errorBorder: OutlineInputBorder(borderRadius: borderRadius ?? ThemeBorderRadius.r6, borderSide: const BorderSide(color: Colors.transparent)),
                focusedErrorBorder: OutlineInputBorder(borderRadius: borderRadius ?? ThemeBorderRadius.r6, borderSide: const BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(borderRadius: borderRadius ?? ThemeBorderRadius.r6, borderSide: const BorderSide(color: Colors.transparent)),
                disabledBorder: OutlineInputBorder(borderRadius: borderRadius ?? ThemeBorderRadius.r6, borderSide: BorderSide.none),
                labelText: showLabel ? "$labelText ${required ? '*' : ''}" : null,
                isDense: true,
                errorText: (errorText == "null" || errorText == null) ? null : cleanedString(errorText),
                alignLabelWithHint: false,
                filled: true,
                fillColor: isDisable ? Colors.black12 : Colors.white,
                floatingLabelBehavior: floatLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.always,
                contentPadding: smallSize ? EdgeInsets.symmetric(horizontal: ThemePadding.value * 3, vertical: ThemePadding.value * 1.5) : ThemePadding.p2 * 1.25,
                labelStyle: TextStyle(fontSize: fontSize ?? 14, color: ThemeColor.primary, fontWeight: FontWeight.bold),
                hintText: showLabel ? hintText : "$labelText ${required ? '*' : ''}",
                hintStyle: (showLabel || hintColor != null) ? TextStyle(fontSize: fontSize ?? 14, color: hintColor ?? ThemeColor.jetBlack.withOpacity(.5), fontWeight: FontWeight.normal) : null,
                floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold),
                suffixIconColor: ThemeColor.jetBlack)));
  }

  static TextFormField inline(
      {required String labelText,
      required TextEditingController controller,
      EdgeInsetsGeometry? padding,
      int maxLines = 1,
      bool required = false,
      bool isPassword = false,
      bool hasSubmitButton = false,
      bool isDate = false,
      bool isFile = false,
      bool showLabel = true,
      bool showIcon = true,
      bool floatLabel = true,
      bool readOnly = false,
      bool autoFocus = false,
      bool centerAlign = false,
      bool showPassword = false,
      bool isDisable = false,
      bool showClearButton = false,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      String? errorText,
      String autofillHints = "",
      FocusNode? focusNode,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      VoidCallback? showPasswordPressed,
      VoidCallback? onFieldSubmittedAlternate,
      VoidCallback? onTap,
      Function(String value)? onChanged,
      Function(String value)? onFieldSubmitted,
      List<TextInputFormatter>? textInputFormatter}) {
    return TextFormField(
        inputFormatters: textInputFormatter,
        readOnly: (isDate || isFile || readOnly),
        showCursor: !(isDate || isFile || readOnly),
        onTap: onTap,
        onChanged: onChanged,
        maxLines: maxLines,
        autofillHints: [autofillHints],
        focusNode: focusNode,
        textAlign: centerAlign ? TextAlign.center : TextAlign.start,
        onFieldSubmitted: onFieldSubmitted,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        obscureText: (isPassword) ? !showPassword : false,
        controller: controller,
        style: TextStyle(color: HexColor("#091E42"), fontSize: 14, fontWeight: FontWeight.w500),
        autofocus: autoFocus,
        enabled: !isDisable,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r2, borderSide: BorderSide(color: ThemeColor.primary)),
            errorBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r2, borderSide: BorderSide(color: Colors.redAccent.shade100)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r2, borderSide: const BorderSide(color: Colors.redAccent)),
            enabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r2, borderSide: BorderSide(color: ThemeColor.primary.withOpacity(.25))),
            disabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r2, borderSide: BorderSide.none),
            isDense: true,
            errorText: (errorText == "null" || errorText == null) ? null : cleanedString(errorText),
            alignLabelWithHint: false,
            filled: true,
            fillColor: isDisable ? Colors.black12 : Colors.white,
            floatingLabelBehavior: floatLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.always,
            contentPadding: ThemePadding.p3,
            labelStyle: TextStyle(color: ThemeColor.primary.withOpacity(.5), fontSize: 14, fontWeight: FontWeight.normal),
            hintText: showLabel ? hintText : "$labelText ${required ? '*' : ''}",
            hintStyle: showLabel ? TextStyle(color: ThemeColor.jetBlack.withOpacity(.25), fontSize: 14, fontWeight: FontWeight.normal) : null,
            floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.bold),
            suffixIconColor: ThemeColor.jetBlack,
            suffixIcon: showIcon
                ? Padding(
                    padding: ThemePadding.pr2,
                    child: isPassword
                        ? IconButton(
                            onPressed: showPasswordPressed, icon: Icon((!showPassword) ? Icons.visibility_outlined : Icons.visibility_off_outlined), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                        : isDate
                            ? IconButton(onPressed: onTap, icon: const Icon(Icons.calendar_month_sharp), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                            : isFile
                                ? IconButton(onPressed: onTap, icon: const Icon(Icons.attach_file_rounded), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                                : hasSubmitButton
                                    ? IconButton(onPressed: onFieldSubmittedAlternate, icon: const Icon(Icons.arrow_downward_sharp), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                                    : maxLines == 1 && showClearButton
                                        ? IconButton(onPressed: () => controller.clear(), icon: const Icon(Icons.cancel_outlined), iconSize: 18, color: ThemeColor.jetBlack.withOpacity(.5))
                                        : null)
                : null));
  }
}
