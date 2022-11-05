import 'package:get/get.dart';
import 'package:opexq/pages/chat/chat_view.dart';
import 'package:opexq/pages/dashboard/dashboard_view.dart';
import 'package:opexq/pages/form/form_view.dart';
import 'package:opexq/pages/help/help_view.dart';
import 'package:opexq/pages/home/home_view.dart';
import 'package:opexq/pages/image/image_list_view.dart';
import 'package:opexq/pages/list/list_view.dart';
import 'package:opexq/pages/login/login_view.dart';
import 'package:opexq/pages/login/logout_view.dart';
import 'package:opexq/pages/login/sign_up.dart';
import 'package:opexq/pages/profile/profile_view.dart';
import 'package:opexq/pages/reservation/reservation_edit_view.dart';
import 'package:opexq/pages/reservation/reservation_home_view.dart';
import 'package:opexq/pages/reservation/reservation_list_view.dart';
import 'package:opexq/pages/roomrack/roomrack_edit_view.dart';
import 'package:opexq/pages/settings/settings_view.dart';
import 'package:opexq/pages/tableReservation/table_reservation_edit_view.dart';
import 'package:opexq/pages/tableReservation/table_reservation_home_view.dart';
import 'package:opexq/pages/tableReservation/table_reservation_list_view.dart';
import 'package:opexq/utils/app_routes.dart';

routes() => [
      GetPage(name: AppRoutes.home, page: () => HomeView()),
      GetPage(name: AppRoutes.login, page: () => LoginView()),
      GetPage(name: AppRoutes.signUp, page: () => SignUpView()),
      GetPage(name: AppRoutes.logout, page: () => const LogoutView()),
      GetPage(name: AppRoutes.settings, page: () => const SettingsWiew()),
      GetPage(name: AppRoutes.help, page: () => const HelpView()),
      GetPage(
        name: "${AppRoutes.list}/:page/:tab",
        page: () => ListPageView(),
      ),
      GetPage(
        name: "${AppRoutes.form}/:page/:id",
        page: () => FormView(),
      ),
      GetPage(
          name: AppRoutes.roomrackEdit, page: () => const RoomrackEditView()),
      GetPage(name: AppRoutes.dashBoard, page: () => DashboardView()),
      GetPage(
          name: AppRoutes.reservationList, page: () => ReservationListView()),
      GetPage(
          name: AppRoutes.reservationHome, page: () => ReservationHomeView()),
      GetPage(
          name: AppRoutes.reservationEdit,
          page: () => const ReservationEditView()),
      GetPage(
          name: AppRoutes.tableReservationList,
          page: () => TableReservationListView()),
      GetPage(
          name: AppRoutes.tableReservationHome,
          page: () => TableReservationHomeView()),
      GetPage(
          name: AppRoutes.tableReservationEdit,
          page: () => const TableReservationEditView()),
      GetPage(name: AppRoutes.profile, page: () => ProfileView()),
      GetPage(name: AppRoutes.imageList, page: () => ImageListView()),
      GetPage(name: AppRoutes.chat, page: () => ChatView()),
    ];
