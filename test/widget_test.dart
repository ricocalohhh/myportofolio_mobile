import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('Halaman menampilkan profil dan tiga menu', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('2506539990'), findsOneWidget);
    expect(find.text('Enrico Oscar Harits Caloh'), findsOneWidget);
    expect(find.text('PBP A'), findsOneWidget);

    expect(find.text('Lihat Experience'), findsOneWidget);
    expect(find.text('Tambah Experience'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  for (final label in ['Lihat Experience', 'Tambah Experience', 'Logout']) {
    testWidgets('$label menampilkan SnackBar yang sesuai', (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.ensureVisible(find.text(label));
      await tester.tap(find.text(label));
      await tester.pumpAndSettle();

      expect(find.text('Kamu telah menekan tombol $label!'), findsOneWidget);
    });
  }
}
