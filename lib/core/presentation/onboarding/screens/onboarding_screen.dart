import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/presentation/utils/app_asset_images.dart';
import 'package:queeky_clean/core/presentation/utils/app_paddings.dart';
import 'package:queeky_clean/core/presentation/utils/app_spacing.dart';
import 'package:queeky_clean/core/presentation/widgets/app_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildImageBackground(context),
          Padding(
            padding: AppPaddings.bodyH.add(AppPaddings.lV.add(AppPaddings.sV)),
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(children: <InlineSpan>[
                    const TextSpan(
                      text: 'Experience the Difference: ',
                    ),
                    const TextSpan(
                      text: 'Your ',
                    ),
                    TextSpan(
                        text: 'Trusted Professional Cleaning ',
                        style: TextStyle(
                          color: context.colors.primary,
                        )),
                    const TextSpan(
                      text: 'Service',
                    ),
                  ]),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                AppPaddings.bodyH.subtract(AppPaddings.lH).add(AppPaddings.mV),
            child: Column(
              children: [
                const Text(
                  'Welcome to a new era of cleanliness and comfort – '
                  'where every garment is treated with the care it deserves.',
                  textAlign: TextAlign.center,
                ),
                const AppSpacing(v: 20,),
                AppButton(
                  onPressed: () {},
                  child: const Text('Let\'s Get Started'),
                ),
                const AppSpacing(v: 20),
                Text.rich(
                     TextSpan(children: <InlineSpan>[
                      TextSpan(
                          text: 'Already have an account? ',
                          style: context.overline.copyWith(fontSize: 13)),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Login',
                            style: context.body2.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: context.colors.primary,
                                decorationThickness: 2,
                                color: context.colors.primary,
                              //  fontSize: 13,
                            ),
                          ),
                        ),
                      )
                    ]))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageBackground(BuildContext context) {
    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        height: context.height * 0.6,
        decoration: BoxDecoration(
            color: context.colors.primary.shade100.withOpacity(0.2),
            image: const DecorationImage(
              opacity: 0.1,
              fit: BoxFit.cover,
              image: AssetImage(
                AppAssetImages.laundryLineArt,
              ),
            )),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.8,
          child: Image.asset(
            AppAssetImages.womanHoldingCloth,
            fit: BoxFit.fill,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const int curveHeight = 40;
    final Offset controlPoint =
        Offset(size.width / 2, size.height + curveHeight);
    final Offset endPoint = Offset(size.width, size.height - curveHeight);

    final Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
