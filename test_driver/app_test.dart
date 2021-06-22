import 'dart:io';

import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  group(
    'Test happy case',
    () {
      FlutterDriver driver;
      setUpAll(() async {
        driver = await FlutterDriver.connect();
      });

      tearDownAll(() async {
        driver?.close();
      });

      test('Verify health of Flutter driver', () async {
        final health = await driver.checkHealth();
        expect(health.status, equals(HealthStatus.ok));
      });

      test('Verify like feature', () async {
        final element = find.byType('LikeButton');
        await driver.waitFor(element);
        await driver.tap(element);
      });

      test('take a screenshot', () async {
        final element = find.text('Trending');
        await driver.waitFor(element);

        await Directory('screenshots').create();
        final screenshot = await driver.screenshot();
        final fileDescriptor = File('screenshots/assignment.png');
        fileDescriptor.writeAsBytes(screenshot);
      });
    },
  );
}
