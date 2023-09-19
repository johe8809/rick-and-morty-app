part of com.rick_and_morty.dashboard.core.state;

StateNotifierProvider<HomeViewModel, HomeState> homeViewModel =
    StateNotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
  name: 'HomeViewModel',
);
