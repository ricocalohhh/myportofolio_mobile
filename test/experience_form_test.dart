import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';

void main() {
  Future<void> tapVisible(WidgetTester tester, Finder target) async {
    await tester.ensureVisible(target);
    await tester.pumpAndSettle();
    await tester.tap(target);
    await tester.pumpAndSettle();
  }

  Future<void> pilihMenuDrawer(WidgetTester tester, String label) async {
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Cari di dalam drawer karena kartu beranda memakai label yang sama.
    final menu = find.descendant(
      of: find.byType(Drawer),
      matching: find.text(label),
    );
    await tapVisible(tester, menu);
  }

  testWidgets('Add Experience card opens the form and Back returns home', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tapVisible(tester, find.text('Tambah Pengalaman'));
    expect(find.byType(ExperienceFormPage), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.byType(ExperienceFormPage), findsNothing);
    expect(find.text('MyPortfolio'), findsOneWidget);
  });

  testWidgets('Drawer opens Add Experience and Home', (tester) async {
    await tester.pumpWidget(const MyApp());

    await pilihMenuDrawer(tester, 'Tambah Pengalaman');
    expect(find.byType(ExperienceFormPage), findsOneWidget);

    await pilihMenuDrawer(tester, 'Home');
    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.byType(ExperienceFormPage), findsNothing);
  });

  testWidgets('Invalid input shows errors and valid input shows a summary', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(360, 640));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    // Buka form langsung agar tes ini khusus memeriksa validasi dan dialog.
    await tester.pumpWidget(const MaterialApp(home: ExperienceFormPage()));

    Finder input(String label) => find.byWidgetPredicate(
      (widget) => widget is TextField && widget.decoration?.labelText == label,
    );

    Future<void> isi(String label, String value) async {
      final field = input(label);
      await tester.ensureVisible(field);
      await tester.enterText(field, value);
      await tester.pumpAndSettle();
    }

    await isi('Posisi', '   ');
    await isi('URL gambar (opsional)', 'bukan-url');
    await tapVisible(tester, find.text('Simpan'));

    expect(find.text('Posisi wajib diisi.'), findsOneWidget);
    expect(find.text('Deskripsi wajib diisi.'), findsOneWidget);
    expect(find.text('Tanggal mulai wajib diisi.'), findsOneWidget);
    expect(find.textContaining('Masukkan URL gambar'), findsOneWidget);
    expect(find.byType(AlertDialog), findsNothing);

    await isi('Posisi', 'Asisten Dosen');
    await isi('Deskripsi', 'Mendampingi praktikum Flutter');
    await isi('URL gambar (opsional)', 'https://example.com/logo.png');

    // Pemilih pertama adalah tanggal mulai. Tanggal selesai boleh kosong.
    await tapVisible(tester, find.text('Pilih tanggal').first);
    await tapVisible(tester, find.text('OK'));
    await tapVisible(tester, find.text('Simpan'));

    final dialog = find.byType(AlertDialog);
    expect(dialog, findsOneWidget);

    final ringkasan = tester
        .widget<Text>(
          find.descendant(of: dialog, matching: find.textContaining('Posisi:')),
        )
        .data!;

    expect(ringkasan, contains('Posisi: Asisten Dosen'));
    expect(ringkasan, contains('Kategori: Full-Time'));
    expect(ringkasan, contains('Deskripsi: Mendampingi praktikum Flutter'));
    expect(ringkasan, matches(RegExp(r'Tanggal mulai: \d{2}/\d{2}/\d{4}')));
    expect(ringkasan, contains('Tanggal selesai: Masih berlangsung'));
    expect(ringkasan, contains('URL gambar: https://example.com/logo.png'));

    await tapVisible(tester, find.text('Tutup'));
    expect(dialog, findsNothing);
    expect(find.byType(ExperienceFormPage), findsOneWidget);
    expect(find.text('Asisten Dosen'), findsOneWidget);
  });
}
