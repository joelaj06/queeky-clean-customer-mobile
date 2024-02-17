
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/presentation/theme/primary_color.dart';
import 'package:queeky_clean/core/presentation/utils/string_utils.dart';

import '../theme/theme_color.dart';
import '../utils/app_border_radius.dart';

class AppTextInput extends StatefulWidget {
    AppTextInput({
    Key? key,
    this.onTap,
    this.inputFormatters,
    this.labelText,
    this.readOnly,
    this.hintText,
    this.errorStyle,
    this.initialValue,
    this.autoFocus = false,
    this.controller,
     this.onChanged,
    required this.validator,
    this.maxLines = 1,
    this.maxLength,
    this.minLines,
    this.lableStyle,
    this.disabled = false,
    this.hideLabel = false,
    this.textInputType,
    this.obscureText = false,
    this.showObscureTextToggle = false,
    this.focusNode,
    this.padding,
    this.textInputAction,
    this.onFieldSubmitted,
    this.backgroundColor,
    this.textColor,
    this.hintColor,
    this.prefixIcon,
    this.suffixIcon,
    this.infoText,
    this.textAlign,
    this.textAlignVertical,
    this.colors,
    this.borderRadius,
    this.borderRadiusOutline,
    this.labelTextPadding,
    this.capitalizeLabel,
      this.fontWeight,
      this.autofillHints,
      this.onEditingComplete,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final bool? readOnly;
  final int maxLines;
  final int? maxLength;
  final int? minLines;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final bool autoFocus;
  final bool obscureText;
  final EdgeInsets? padding;
  final bool disabled;
  final bool hideLabel;
  final TextStyle? lableStyle;
  final TextStyle? errorStyle;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool showObscureTextToggle;
  final String? Function(String) validator;
  final String? infoText;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? hintColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final BorderRadius? borderRadiusOutline;
  final EdgeInsets? labelTextPadding;
  final FontWeight? fontWeight;
  bool? capitalizeLabel = false;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final ThemeColor? colors;

  @override
  _AppTextInputState createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput>
    with TickerProviderStateMixin {
  FocusNode? focusNode;
  TextEditingController? controller;
  late ValueNotifier<bool> obscureTextValueListenable;
  ValueNotifier<bool> dirtyValueListenable = ValueNotifier<bool>(false);

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    obscureTextValueListenable = ValueNotifier<bool>(widget.obscureText);
    controller = widget.controller ?? TextEditingController();

    if (widget.initialValue != null) {
      controller!.text = widget.initialValue!;
    }

    controller!.addListener(() {
      if (controller!.value.text.isNotEmpty) {
        dirtyValueListenable.value = true;
      } else {}
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode!.dispose();
    if (widget.controller == null) {
      controller!.dispose();
    }
    dirtyValueListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // final bool capsLabel = widget.capitalizeLabel == null || false ? false : true;
    return IgnorePointer(
      ignoring: widget.disabled,
      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.labelText != null && !widget.hideLabel)
              Padding(
                padding: widget.labelTextPadding ?? const EdgeInsets.symmetric(vertical:5,horizontal: 10),
                child: Text(
                  widget.labelText!.toTitleCase(),
                  textAlign: TextAlign.left,
                  style: widget.lableStyle ??
                      context.overline.copyWith(
                        color: context.colors.text,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            Container(
          //    constraints: BoxConstraints(minHeight: max(50.h.toDouble(), 50)),
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ?? AppBorderRadius.smallAll,
                color: widget.backgroundColor ?? PrimaryColor.color.shade100.withOpacity(0.2),
              ),
              child: AnimatedOpacity(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 300),
                opacity: widget.disabled ? .4 : 1.0,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 800),
                      transform: Matrix4.identity()
                        ..translate(
                            0.0,
                            widget.hideLabel
                                ? 0.0
                                : focusNode!.hasFocus ||
                                        controller!.text.isNotEmpty
                                    ? .0
                                    : 0.0),
                      child: ValueListenableBuilder<bool>(
                        valueListenable: obscureTextValueListenable,
                        builder: (BuildContext context, bool obscuringText,
                            Widget? child) {
                          return TextFormField(
                            onTap: widget.onTap,
                            readOnly: widget.readOnly ?? false,
                            focusNode: focusNode,
                            autofillHints: widget.autofillHints,
                            autovalidateMode:
                                focusNode!.hasFocus && dirtyValueListenable.value
                                    ? AutovalidateMode.always
                                    : AutovalidateMode.onUserInteraction,
                            obscuringCharacter: '*',
                            obscureText: obscuringText,
                            controller: controller,
                            cursorColor: widget.textColor,
                            textInputAction: widget.textInputAction,
                            maxLength: widget.maxLength,
                            maxLines: widget.maxLines,
                            autofocus: widget.autoFocus,
                            textAlignVertical: widget.textAlignVertical,
                            minLines: widget.minLines,
                            keyboardType: widget.textInputType,
                            style: context.body1.copyWith(
                              height: 1.4,
                              fontWeight: widget.fontWeight ?? FontWeight.w500,
                              color: widget.textColor ?? context.colors.textDark,
                            ),
                            onEditingComplete : widget.onEditingComplete,
                            onChanged: widget.onChanged,
                            textAlign: widget.textAlign ?? TextAlign.start,
                            inputFormatters: widget.inputFormatters,
                            onFieldSubmitted: widget.onFieldSubmitted,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius:  widget.borderRadiusOutline ?? AppBorderRadius.smallAll,
                                borderSide: BorderSide(
                                  color:  context.colors.primary.shade100,
                                  width: 2,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder(
                                  borderRadius: widget.borderRadiusOutline ?? AppBorderRadius.smallAll,
                                  borderSide: BorderSide(
                                    color: context.colors.hint.shade400,
                                  )),
                              disabledBorder: OutlineInputBorder(
                                borderRadius:widget.borderRadiusOutline ?? AppBorderRadius.smallAll,
                                borderSide: BorderSide(
                                  color: context.colors.hintLight,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: context.colors.hint.shade400,
                                  width: 0.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:widget.borderRadiusOutline ?? AppBorderRadius.smallAll,
                                borderSide: BorderSide(
                                  color: context.colors.hint.shade400,
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              //fillColor: Colors.transparent,
                              errorStyle: TextStyle(
                                color: context.colors.error,
                                fontSize: 12,
                              ),
                              //floatingLabelBehavior: FloatingLabelBehavior.always,
                              alignLabelWithHint: true,
                             /* hintStyle: context.body1.copyWith(
                                color: context.colors.hint,
                                height: 1.2,
                              ),*/
                              focusColor: context.colors.text,
                              labelStyle: context.body1.copyWith(
                                height: 1.8,
                                fontWeight: FontWeight.w800,
                              ),
                              contentPadding:
                                  widget.padding ?? const EdgeInsets.all(15),
                              fillColor: Colors.transparent,//context.colors.background,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              prefixIcon: widget.prefixIcon,
                              suffixIcon: widget.suffixIcon,
                              hintStyle: context.body1.copyWith(
                                fontWeight: FontWeight.w400,
                                color: widget.hintColor ?? context.colors.hint.withOpacity(0.5),
                                height: 1.4,
                              ),
                              hintText: widget.hintText,

                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: obscureTextValueListenable,
                        builder: (BuildContext context, bool obscuringText,
                            Widget? child) {
                          if (!widget.showObscureTextToggle ||
                              !focusNode!.hasFocus && !widget.obscureText) {
                            return const SizedBox(height: 20);
                          }

                          return AnimatedSwitcher(
                            reverseDuration: Duration.zero,
                            transitionBuilder:
                                (Widget? child, Animation<double> animation) {
                              final Animation<double> offset =
                                  Tween<double>(begin: 0, end: 1.0)
                                      .animate(animation);
                              return ScaleTransition(scale: offset, child: child);
                            },
                            switchInCurve: Curves.elasticOut,
                            duration: const Duration(milliseconds: 700),
                            child: IconButton(
                              key: ValueKey<bool>(obscuringText),
                              onPressed: () {
                                obscureTextValueListenable.value = !obscuringText;
                              },
                              icon: obscuringText
                                  ? Icon(
                                      Ionicons.eye_outline,
                                      color: widget.textColor?.withOpacity(0.5),
                                      size: 20,
                                    )
                                  : Icon(
                                      Ionicons.eye_off_outline,
                                      color: widget.textColor?.withOpacity(0.5),
                                      size: 20,
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller!,
              builder:
                  (BuildContext context, TextEditingValue textEditingValue, _) {
                return ValueListenableBuilder<bool>(
                  valueListenable: dirtyValueListenable,
                  builder: (BuildContext context, bool dirty, _) {
                    final bool showError =
                        (widget.validator(textEditingValue.text) is String) &&
                            dirty;
                    return AnimatedSize(
                      curve: Curves.elasticOut,
                      duration: const Duration(milliseconds: 900),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Builder(
                            key: ValueKey<bool>(
                                showError || widget.infoText == null),
                            builder: (_) {
                              if (showError) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(
                                    widget.validator(controller!.value.text)!,
                                    style: widget.errorStyle ??
                                        context.captionError.copyWith(
                                          color: context.colors.error,
                                        ),
                                  ),
                                );
                              }
                              return widget.infoText != null
                                  ? Text(
                                      widget.infoText!,
                                      style: context.caption,
                                    )
                                  : const SizedBox();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
