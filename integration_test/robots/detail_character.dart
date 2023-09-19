part of com.rick_morty_app.testing.robots;

class DetailCharacterlRobot {
  const DetailCharacterlRobot(this.tester);

  final WidgetTester tester;

  Future<void> checkViewport() async {
    Finder viewFinder = find.byKey(const Key('detail_character_view_key'));

    expect(
      viewFinder,
      findsOneWidget,
      reason: 'Failed to verify detail character view is shown',
    );
  }
}
