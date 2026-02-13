import 'package:flutter_test/flutter_test.dart';
import 'package:blood_gas_app/core/utils/text_parser.dart';

void main() {
  final parser = TextParser();

  test('Parses standard key-value pairs', () {
    const input = '''
pH 7.35
pCO2 35.0
pO2 80
''';
    final result = parser.parse(input);
    expect(result['pH'], 7.35);
    expect(result['pCO2'], 35.0);
    expect(result['pO2'], 80.0);
  });

  test('Parses with units and symbols (lookahead logic)', () {
    const input = '''
cK+ mmol/L 4.0
cNa+ mmol/L 135
Glu mg/dL 90
''';
    final result = parser.parse(input);
    expect(result['cK'], 4.0);
    expect(result['cNa'], 135.0);
    expect(result['cGlu'], 90.0);
  });

  test('Parses Case Insensitive', () {
    const input = '''
ph 7.40
PCO2 40
''';
    final result = parser.parse(input);
    expect(result['pH'], 7.40);
    expect(result['pCO2'], 40.0);
  });

  test('Parses complex noise', () {
    const input = '''
     Report
     
     pH : 7.35
     cK+ = 5.2 mmol/L
     ''';
    final result = parser.parse(input);
    expect(result['pH'], 7.35);
    expect(result['cK'], 5.2);
  });

  test('Parses BE(Ecf) with negative value', () {
    const input = 'be(ecf) -2.0';
    final result = parser.parse(input);
    expect(result['cBaseEcf'], -2.0);
  });
}
