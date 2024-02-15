import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';

import '../utils/app_border_radius.dart';
import '../utils/app_paddings.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    Key? key,
    this.loading = false,
    this.enabled = true,
    this.hasShadow = false,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.spinnerColor,
    this.boxShadow,
    this.padding,
    this.buttonHeight = 48,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? spinnerColor;
  final List<BoxShadow>? boxShadow;
  final bool loading;
  final bool enabled;
  final bool hasShadow;
  final double buttonHeight;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:  context.button,
      child: ClipRRect(
        borderRadius:  widget.borderRadius ?? AppBorderRadius.button,
        child: SizedBox(
          height: widget.buttonHeight,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              if (widget.hasShadow)
                DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: widget.boxShadow ??
                        <BoxShadow>[
                          BoxShadow(
                            blurRadius: 20,
                            spreadRadius: 4,
                            color: context.colors.primary.shade200,
                          )
                        ],
                  ),
                  child: const SizedBox(
                    height: 10,
                    width: 200,
                  ),
                ),
              SizedBox.expand(
                child: CupertinoButton(
                  padding: widget.padding,
                  // borderRadius: widget.borderRadius ?? AppBorderRadius.button,
                  onPressed: widget.loading ? null : widget.onPressed,
                  color: widget.backgroundColor ?? context.colors.primary,
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: context.button.copyWith(
                      color: widget.foregroundColor ?? Colors.white,
                    ),
                    child: Center(child: widget.child),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: widget.enabled,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  height: kToolbarHeight,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    // borderRadius: widget.borderRadius ?? AppBorderRadius.button,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft.add(const Alignment(.4, 0)),
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        context.colors.background
                            .withOpacity(widget.enabled ? 0.0 : 0.6),
                        context.colors.background
                            .withOpacity(widget.enabled ? 0.0 : 0.6),
                        context.colors.background
                            .withOpacity(widget.enabled ? 0.0 : 0.6),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: widget.borderRadius ?? AppBorderRadius.button,
                    child: const SizedBox.expand(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppConstrainedButton extends StatelessWidget {
  const AppConstrainedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.constraints,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          constraints ?? const BoxConstraints(maxHeight: 25, minWidth: 80),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: AppPaddings.sV,
          backgroundColor: color ?? Colors.white,
          // shape: RoundedRectangleBorder(
          //   borderRadius: AppBorderRadius.smallAll,
          // ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textScaler: TextScaler.noScaling,
          style: context.overline.copyWith(
            fontSize: fontSize ?? AppFontSizes.overline,
            color: textColor ?? context.colors.textDark,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
