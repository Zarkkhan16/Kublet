import 'package:equatable/equatable.dart';
import '/core/app_export.dart';
import '../models/dynamicviewlist_item_model.dart';
import 'package:kublet/presentation/home_page/models/home_model.dart';
part 'home_state.dart';

final homeNotifier = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(HomeState(
    homeModelObj: HomeModel(dynamicviewlistItemList: [
      DynamicviewlistItemModel(
          openApiText: "Open API",
          openApiText1: "Open API",
          sendDataText: "Send data to HTTP endpoint",
          sendDataText1: "Send data to HTTP endpoint"),
      DynamicviewlistItemModel(
          openApiText: "Stocks",
          openApiText1: "Stocks",
          sendDataText: "US stock data powered by Polygon.io",
          sendDataText1: "US stock data powered by Polygon.io"),
      DynamicviewlistItemModel(
          openApiText: "Crypto",
          openApiText1: "Crypto",
          sendDataText: "Crypto data powered by Coingecko",
          sendDataText1: "Crypto data powered by Coingecko"),
      DynamicviewlistItemModel(
          openApiText: "Forex",
          openApiText1: "Forex",
          sendDataText: "Forex data powered by Polygon.io",
          sendDataText1: "Forex data powered by Polygon.io")
    ]),
  )),
);

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(HomeState state) : super(state) {}
}
