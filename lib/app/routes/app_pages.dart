import 'package:flower/app/modules/all_cultivate/cultivate/cultivate_view.dart';
import 'package:flower/app/modules/all_entry/intro.dart';
import 'package:flower/app/modules/all_entry/login/login_binding.dart';
import 'package:flower/app/modules/all_entry/login/login_view.dart';
import 'package:flower/app/modules/all_entry/private.dart';
import 'package:flower/app/modules/all_entry/register/register_binding.dart';
import 'package:flower/app/modules/all_entry/register/register_view.dart';
import 'package:flower/app/modules/all_entry/use.dart';
import 'package:flower/app/modules/all_mine/mine/mine_view.dart';
import 'package:flower/app/modules/all_mine/setting/setting_binding.dart';
import 'package:flower/app/modules/all_mine/setting/setting_view.dart';
import 'package:flower/app/modules/all_rain/all_workbench/buy/buy_binding.dart';
import 'package:flower/app/modules/all_rain/all_workbench/buy/buy_view.dart';
import 'package:flower/app/modules/all_rain/all_workbench/online_teach/online_teach_binding.dart';
import 'package:flower/app/modules/all_rain/all_workbench/online_teach/online_teach_view.dart';
import 'package:flower/app/modules/all_rain/all_workbench/work_bench/work_bench_binding.dart';
import 'package:flower/app/modules/all_rain/all_workbench/work_bench/work_bench_view.dart';
import 'package:flower/app/modules/all_rain/all_workbench/works/works_binding.dart';
import 'package:flower/app/modules/all_rain/all_workbench/works/works_view.dart';
import 'package:flower/app/modules/all_rain/live/live_binding.dart';
import 'package:flower/app/modules/all_rain/live/live_view.dart';
import 'package:flower/app/modules/all_rain/point_exchange/point_exchange_binding.dart';
import 'package:flower/app/modules/all_rain/point_exchange/point_exchange_view.dart';
import 'package:flower/app/modules/all_rain/rain/rain_view.dart';
import 'package:flower/app/modules/all_rain/teach/teach_binding.dart';
import 'package:flower/app/modules/all_rain/teach/teach_view.dart';
import 'package:flower/app/modules/all_rain/travel/travel_binding.dart';
import 'package:flower/app/modules/all_rain/video/video_binding.dart';
import 'package:flower/app/modules/all_rain/video/video_view.dart';
import 'package:flower/app/modules/all_tribe/tribe/tribe_view.dart';
import 'package:flower/app/modules/all_village/village/village_view.dart';
import 'package:flower/app/modules/all_village/village_detail/village_detail_binding.dart';
import 'package:flower/app/modules/all_village/village_detail/village_detail_view.dart';
import 'package:flower/app/modules/home/home_view.dart';
import 'package:flower/app/modules/route/route_binding.dart';
import 'package:flower/app/modules/route/route_view.dart';
import 'package:get/get.dart';

import '../modules/all_rain/travel/travel_view.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.intro, page: () => const IntroPage()),
    GetPage(name: Routes.privacy, page: () => const PrivacyPage()),
    GetPage(name: Routes.useClause, page: () => const UsePage()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.register,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.routePage,
        page: () => RoutePage(),
        binding: RouteBinding()),
    GetPage(name: Routes.home, page: () => const HomePage()
        // , binding: HomeBinding()
        ),
    GetPage(name: Routes.mine, page: () => const MinePage()
        // , binding: MineBinding()
        ),
    // GetPage(
    //     name: Routes.changeInfo,
    //     page: () => ChangeInfoPage(),
    //     binding: ChangeInfoBinding()),
    GetPage(name: Routes.rain, page: () => const RainPage()
        // , binding: RainBinding()
        ),
    GetPage(
        name: Routes.workBench,
        page: () => WorkBenchPage(),
        binding: WorkBenchBinding()),
    GetPage(name: Routes.buy, page: () => BuyPage(), binding: BuyBinding()),
    GetPage(
        name: Routes.onlineTeach,
        page: () => OnlineTeachPage(),
        binding: OnlineTeachBinding()),
    GetPage(
        name: Routes.works, page: () => WorksPage(), binding: WorksBinding()),
    GetPage(name: Routes.live, page: () => LivePage(), binding: LiveBinding()),
    GetPage(
        name: Routes.teach, page: () => TeachPage(), binding: TeachBinding()),
    GetPage(
        name: Routes.video, page: () => VideoPage(), binding: VideoBinding()),
    GetPage(
        name: Routes.travel,
        page: () => const TravelPage(),
        binding: TravelBinding()),
    GetPage(
        name: Routes.pointExchange,
        page: () => PointExchangePage(),
        binding: PointExchangeBinding()),
    GetPage(
      name: Routes.cultivate,
      page: () => CultivatePage(),
      // binding: CultivateBinding()
    ),
    GetPage(
      name: Routes.village,
      page: () => VillagePage(),
      // binding: VillageBinding()
    ),
    GetPage(
        name: Routes.villageDetail,
        page: () => VillageDetailPage(),
        binding: VillageDetailBinding()),
    GetPage(name: Routes.tribe, page: () => TribePage()),
    GetPage(
        name: Routes.settings,
        page: () => SettingPage(),
        binding: SettingBinding())
  ];
}
