import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jewellery/consts/route_const.dart';
import 'package:jewellery/ui/splash/splash_screen.dart';
import 'package:jewellery/ui/task/add_task_screen.dart';
import 'package:jewellery/ui/task/task_list_screen.dart';


class AppRouteManager {
  static final pages = [
    //App routes
    
    GetPage(
        name: RouteConst.taskListScreen, page: () => const TaskListScreen()),
    GetPage(
        name: RouteConst.splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: RouteConst.addTaskScreen, page: () => const AddTaskScreen()),
   
  ];
}
