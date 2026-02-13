import 'package:flutter_test/flutter_test.dart';
import 'package:blood_gas_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App starts without crashing', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const BloodGasApp());
    await tester.pumpAndSettle();
    expect(find.text('Anestezi Takip'), findsOneWidget);
  });
}
