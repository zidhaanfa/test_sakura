import 'package:get/get.dart';

import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_day_view.dart';
import '../modules/calendar/views/calendar_month_view.dart';
import '../modules/calendar/views/calendar_week_view.dart';
import '../modules/formData/bindings/form_data_binding.dart';
import '../modules/formData/views/form_data_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CALENDARDAY,
      page: () => CalendarDayView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.CALENDARDAY,
      page: () => CalendarDayView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.CALENDARWEEK,
      page: () => CalendarWeekView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.FORM_DATA,
      page: () => const FormDataView(),
      binding: FormDataBinding(),
    ),
  ];
}
