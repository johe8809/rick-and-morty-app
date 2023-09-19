import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'scenarios/steps.dart';

void main() {
  late IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late AuthScenario authScenario = AuthScenario(binding);

  group('Auth', authScenario.body);
}

// flutter test integration_test/test.dart
