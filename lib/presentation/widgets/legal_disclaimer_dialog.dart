import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LegalDisclaimerDialog extends StatefulWidget {
  const LegalDisclaimerDialog({super.key});

  static Future<void> show(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final accepted = prefs.getBool('legal_disclaimer_accepted') ?? false;

    if (!accepted && context.mounted) {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const LegalDisclaimerDialog(),
      );
    }
  }

  @override
  State<LegalDisclaimerDialog> createState() => _LegalDisclaimerDialogState();
}

class _LegalDisclaimerDialogState extends State<LegalDisclaimerDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
          SizedBox(width: 10),
          Text('Yasal Uyarı'),
        ],
      ),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bu uygulama yalnızca anestezi asistanları için eğitim ve takip amaçlı '
              'bir yardımcı araç olarak tasarlanmıştır.\n',
            ),
            Text('1. Tıbbi cihaz DEĞİLDİR.'),
            SizedBox(height: 4),
            Text('2. Tanı veya tıbbi tavsiye VERMEZ.'),
            SizedBox(height: 4),
            Text('3. Değerleri her zaman orijinal basılı kan gazı raporuyla doğrulayın.'),
            SizedBox(height: 4),
            Text('4. Veriler cihazda yerel olarak saklanır ve 14 gün sonra otomatik silinir.'),
            SizedBox(height: 16),
            Text(
              'Devam ederek bu koşulları kabul etmiş olursunuz.',
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('legal_disclaimer_accepted', true);
            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('Anladım ve Kabul Ediyorum'),
        ),
      ],
    );
  }
}
