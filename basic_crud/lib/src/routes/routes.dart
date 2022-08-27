
import 'package:basic_crud/src/pages/api/employees_page.dart';
import 'package:basic_crud/src/pages/crudFirestore/create_user_page.dart';
import 'package:basic_crud/src/pages/crudFirestore/users_page.dart';
import 'package:basic_crud/src/pages/home_page.dart';
import 'package:basic_crud/src/pages/splash_page.dart';
import 'package:get/route_manager.dart';

class Routes {

  static List<GetPage> routes = [
    GetPage( name: '/splash_page',      page: () => const SplashPage() ),
    GetPage( name: '/home_page',        page: () => const HomePage() ),
    GetPage( name: '/users_page',       page: () => const UsersPage() ),
    GetPage( name: '/create_user_page', page: () => const CreateUserPage() ),
    GetPage( name: '/employees_page',   page: () => const EmployeesPage() )
  ];

}