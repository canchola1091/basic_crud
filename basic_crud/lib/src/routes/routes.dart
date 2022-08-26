




import 'package:basic_crud/src/pages/crud_page.dart';
import 'package:basic_crud/src/pages/employees_page.dart';
import 'package:basic_crud/src/pages/home_page.dart';
import 'package:basic_crud/src/pages/splash_page.dart';
import 'package:get/route_manager.dart';

class Routes {

  static List<GetPage> routes = [
    GetPage( name: '/splash_page',    page: () => const SplashPage() ),
    GetPage( name: '/home_page',      page: () => const HomePage() ),
    GetPage( name: '/crud_page',      page: () => const CrudPage() ),
    GetPage( name: '/employees_page', page: () => const EmployeesPage() )
  ];

}