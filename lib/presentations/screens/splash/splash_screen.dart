import 'package:flutter_animate/flutter_animate.dart';
import 'package:trokis/core/app_route/app_routes.dart';
import 'package:trokis/core/exports/exports.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.onboardScreen);
      });
    });

    TextStyle titleFont = TextStyle(
      fontSize: 80,
      fontWeight: FontWeight.w900,
      color: AppColors.textColor,
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Hero(
          tag: "logo",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 0,
            children: [
              Text(
                "T",
                style: titleFont,
              )
                  .animate()
                  .fadeIn(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(
                      milliseconds: 600,
                    ),
                  )
                  .move(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(
                      milliseconds: 600,
                    ),
                    begin: Offset(
                      100,
                      0,
                    ),
                  ),
              Text(
                "R",
                style: titleFont,
              )
                  .animate()
                  .fadeIn(
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                  )
                  .move(
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    begin: Offset(
                      50,
                      0,
                    ),
                  ),
              SizedBox(
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.textColor,
                        border: Border.all(
                          width: 12,
                          color: AppColors.textColor,
                        ),
                      ),
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                        .animate()
                        .fade(
                          delay: const Duration(
                            milliseconds: 300,
                          ),
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          begin: 0,
                        )
                        .scale(
                          delay: const Duration(
                            milliseconds: 300,
                          ),
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          begin: Offset(0.8, 0.8),
                          end: Offset(1, 1),
                        ),
                    Container(
                      height: 22,
                      width: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.textColor,
                      ),
                    ).animate().scale(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          begin: Offset(0, 0),
                          end: Offset(1, 1),
                        ),
                  ],
                ),
              ),
              Text(
                "K",
                style: titleFont,
              )
                  .animate()
                  .fadeIn(
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                  )
                  .move(
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    begin: Offset(
                      -50,
                      0,
                    ),
                  ),
              Text(
                "I",
                style: titleFont,
              )
                  .animate()
                  .fadeIn(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(
                      milliseconds: 400,
                    ),
                  )
                  .move(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(
                      milliseconds: 400,
                    ),
                    begin: Offset(
                      -70,
                      0,
                    ),
                  ),
              Text(
                "S",
                style: titleFont,
              )
                  .animate()
                  .fadeIn(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(
                      milliseconds: 600,
                    ),
                  )
                  .move(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(
                      milliseconds: 600,
                    ),
                    begin: Offset(
                      -120,
                      0,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
