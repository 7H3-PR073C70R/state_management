import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_page_state.dart';

class HomePageNotifiers extends StateNotifier<HomePageState> {
  HomePageNotifiers() : super(HomePageState.initial()) {

    state = state.updateState(
      viewState: ViewState.loading,
    );

    Future.delayed(const Duration(seconds: 1)).then(
      (value) => state = state.updateState(
        viewState: ViewState.error,
      ),
    );
    
  }

  void updateDropDown1Value(String? value) {
    state = state.updateState(dropdown1Value: value);
  }

  void updateCheckbox1Value(bool? value) {
    state = state.updateState(checkbox1Value: value);
  }

  void updateDropDown2Value(String? value) {
    state = state.updateState(dropdown2Value: value);
  }

  void updateCheckbox2Value(bool? value) {
    state = state.updateState(checkbox2Value: value);
  }
}

final homePageProvider =
    StateNotifierProvider<HomePageNotifiers, HomePageState>(
        (_) => HomePageNotifiers());
