part of com.rick_morty_app.testing.robots;

class HomeRobot {
  const HomeRobot(this.tester);

  final WidgetTester tester;

  Future<void> checkViewport() async {
    Finder viewFinder = find.byKey(const Key('home_view_key'));

    expect(
      viewFinder,
      findsOneWidget,
      reason: 'Failed to verify home view is shown',
    );
  }

  Future<void> checkCharacterList() async {
    Finder viewFinder = find.byKey(const Key('character_list_key'));

    expect(
      viewFinder,
      findsOneWidget,
      reason: 'Failed to verify character list is shown',
    );
  }
}
