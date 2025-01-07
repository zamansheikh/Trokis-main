import 'core/app_route/app_routes.dart';
import 'core/exports/exports.dart';
import 'core/utils/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: AppConstants.APP_NAME,
            debugShowCheckedModeBanner: false,

            // // theme: dark(),
            // theme: light(),
            // darkTheme: light(),
            color: AppColors.backgroundColor,
            defaultTransition: Transition.topLevel,
            transitionDuration: const Duration(milliseconds: 500),
            getPages: AppRoutes.page,
            initialRoute: AppRoutes.bottomNavBar,
          );
        });
  }
}
