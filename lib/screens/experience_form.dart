import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Nilai di sebelah kiri mengikuti choices pada model Django.
  static const _categories = {
    'internship': 'Internship',
    'research': 'Research',
    'volunteer': 'Volunteer',
    'part-time': 'Part-Time',
    'full-time': 'Full-Time',
    'freelance': 'Freelance',
  };

  String _posisi = '';
  String _kategori = 'full-time';
  String _deskripsi = '';
  String _urlGambar = '';
  DateTime? _tanggalMulai;
  DateTime? _tanggalSelesai;

  String _formatTanggal(DateTime tanggal) {
    final hari = tanggal.day.toString().padLeft(2, '0');
    final bulan = tanggal.month.toString().padLeft(2, '0');
    return '$hari/$bulan/${tanggal.year}';
  }

  Widget _kolomTanggal({required bool untukMulai}) {
    final label = untukMulai ? 'Tanggal mulai' : 'Tanggal selesai (opsional)';

    return FormField<DateTime>(
      validator: (tanggal) {
        if (untukMulai && tanggal == null) {
          return 'Tanggal mulai wajib diisi.';
        }

        final mulai = _tanggalMulai;
        if (!untukMulai &&
            tanggal != null &&
            mulai != null &&
            tanggal.isBefore(mulai)) {
          return 'Tanggal selesai tidak boleh sebelum tanggal mulai.';
        }

        return null;
      },
      builder: (field) {
        final tanggal = field.value;

        return InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            errorText: field.errorText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  icon: const Icon(Icons.calendar_today),
                  label: Text(
                    tanggal == null ? 'Pilih tanggal' : _formatTanggal(tanggal),
                  ),
                  onPressed: () async {
                    final pilihan = await showDatePicker(
                      context: context,
                      initialDate: tanggal ?? _tanggalMulai ?? DateTime.now(),
                      firstDate: DateTime(1),
                      lastDate: DateTime(9999, 12, 31),
                    );

                    if (pilihan == null || !field.mounted) return;

                    field.didChange(pilihan);
                    if (untukMulai) {
                      _tanggalMulai = pilihan;
                    } else {
                      _tanggalSelesai = pilihan;
                    }
                  },
                ),
              ),
              if (!untukMulai && tanggal != null)
                IconButton(
                  tooltip: 'Kosongkan tanggal selesai',
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    field.didChange(null);
                    _tanggalSelesai = null;
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _simpan() {
    final form = _formKey.currentState!;
    if (!form.validate()) return;

    form.save();
    FocusScope.of(context).unfocus();

    final selesai = _tanggalSelesai;
    final ringkasan = [
      'Posisi: $_posisi',
      'Kategori: ${_categories[_kategori]}',
      'Deskripsi: $_deskripsi',
      'Tanggal mulai: ${_formatTanggal(_tanggalMulai!)}',
      'Tanggal selesai: ${selesai == null ? "Masih berlangsung" : _formatTanggal(selesai)}',
      'URL gambar: ${_urlGambar.isEmpty ? "Tidak diisi" : _urlGambar}',
    ].join('\n\n');

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Ringkasan pengalaman'),
        scrollable: true,
        content: Text(ringkasan),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pengalaman'),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
      ),
      drawer: const LeftDrawer(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Posisi',
                    hintText: 'Contoh: Asisten Dosen PBP',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _posisi = (value ?? '').trim(),
                  validator: (value) {
                    final posisi = (value ?? '').trim();

                    if (posisi.isEmpty) {
                      return 'Posisi wajib diisi.';
                    }
                    if (posisi.runes.length > 255) {
                      return 'Posisi maksimal 255 karakter.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: 'full-time',
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Kategori',
                    border: OutlineInputBorder(),
                  ),
                  items: _categories.entries.map((entry) {
                    return DropdownMenuItem<String>(
                      value: entry.key,
                      child: Text(entry.value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                  onSaved: (value) => _kategori = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi',
                    hintText: 'Ceritakan peran dan kegiatanmu',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 3,
                  maxLines: 5,
                  onSaved: (value) => _deskripsi = (value ?? '').trim(),
                  validator: (value) {
                    if ((value ?? '').trim().isEmpty) {
                      return 'Deskripsi wajib diisi.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _kolomTanggal(untukMulai: true),
                const SizedBox(height: 16),
                _kolomTanggal(untukMulai: false),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'URL gambar (opsional)',
                    hintText: 'https://contoh.com/logo.png',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.url,
                  autocorrect: false,
                  onSaved: (value) => _urlGambar = (value ?? '').trim(),
                  validator: (value) {
                    final teks = (value ?? '').trim();
                    if (teks.isEmpty) return null;

                    if (teks.runes.length > 200) {
                      return 'URL maksimal 200 karakter.';
                    }

                    final uri = Uri.tryParse(teks);
                    if (uri == null ||
                        !['http', 'https'].contains(uri.scheme) ||
                        uri.host.isEmpty ||
                        RegExp(r'\s').hasMatch(teks)) {
                      return 'Masukkan URL gambar lengkap dengan http:// atau https://.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 24),
                FilledButton(onPressed: _simpan, child: const Text('Simpan')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
