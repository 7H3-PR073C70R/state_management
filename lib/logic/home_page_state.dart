class HomePageState {
  final ViewState viewState;
  final String dropdown1Value;
  final bool checkbox1Value;
  final String dropdown2Value;
  final bool checkbox2Value;

  const HomePageState._({
    required this.viewState,
    required this.dropdown1Value,
    required this.checkbox1Value,
    required this.dropdown2Value,
    required this.checkbox2Value,
  });

  factory HomePageState.initial() => const HomePageState._(
        dropdown1Value: 'One',
        checkbox1Value: false,
        dropdown2Value: 'Four',
        checkbox2Value: false,
        viewState: ViewState.idle,
      );

  HomePageState updateState({
    String? dropdown1Value,
    bool? checkbox1Value,
    String? dropdown2Value,
    bool? checkbox2Value,
    ViewState? viewState,
  }) {
    return HomePageState._(
      dropdown1Value: dropdown1Value ?? this.dropdown1Value,
      checkbox1Value: checkbox1Value ?? this.checkbox1Value,
      dropdown2Value: dropdown2Value ?? this.dropdown2Value,
      checkbox2Value: checkbox2Value ?? this.checkbox2Value,
      viewState: viewState ?? this.viewState,
    );
  }
}

enum ViewState {
  idle,
  loading,
  error,
}

extension ViewStateExtension on ViewState {
  bool get isIdle => this == ViewState.idle;
  bool get isLoading => this == ViewState.loading;
  bool get isError => this == ViewState.error;
}
