import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_adam_asmaca/oyun_adam_asmaca.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(yaprakConfig.title.length, 33);
    expect(yaprakConfig.tagline.length, 33);
    for (final s in yaprakConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(yaprakConfig.gameId, yaprakId);
    expect(yaprakRules.gameId, yaprakId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(yaprakRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: yaprakId, optionalMechanics: yaprakRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      yaprakRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(yaprakRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
