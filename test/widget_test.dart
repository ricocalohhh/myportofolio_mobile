import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';

void main() {
  testWidgets('Halaman menampilkan profil dan tiga menu', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('2506539990'), findsOneWidget);
    expect(find.text('Enrico Oscar Harits Caloh'), findsOneWidget);
    expect(find.text('PBP A'), findsOneWidget);

    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  for (final label in ['Lihat Proyek', 'Logout']) {
    testWidgets('$label menampilkan SnackBar yang sesuai', (tester) async {
      await tester.pumpWidget(const MyApp());

      final button = find.text(label);
      await tester.ensureVisible(button);
      await tester.tap(button);
      await tester.pump();

      expect(find.text('Kamu telah menekan tombol $label!'), findsOneWidget);

      // Selesaikan durasi SnackBar sebelum tes berakhir.
      await tester.pump(const Duration(seconds: 5));
      await tester.pumpAndSettle();
    });
  }

  testWidgets('Tambah Proyek membuka form dan Back kembali ke menu', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final button = find.text('Tambah Proyek');
    await tester.ensureVisible(button);
    await tester.tap(button);
    await tester.pumpAndSettle();

    expect(find.byType(ProjectFormPage), findsOneWidget);
    expect(find.text('Add Project Form'), findsOneWidget);

    // Mensimulasikan kembali melalui Navigator.
    final context = tester.element(find.byType(ProjectFormPage));
    Navigator.of(context).pop();
    await tester.pumpAndSettle();

    expect(find.byType(ProjectFormPage), findsNothing);
    expect(find.text('Tambah Proyek'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
