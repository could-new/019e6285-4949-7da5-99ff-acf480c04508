import 'package:flutter/material.dart';

void main() {
  runApp(const EnglishModuleApp());
}

class EnglishModuleApp extends StatelessWidget {
  const EnglishModuleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modul Ajar Bahasa Inggris Kelas 5',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/material': (context) => const MaterialScreen(),
        '/strategy': (context) => const StrategyScreen(),
        '/lkpd': (context) => const LKPDScreen(),
        '/assessment': (context) => const AssessmentScreen(),
      },
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modul Ajar: Dates and Months'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Card(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Bahasa Inggris Kelas 5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Topik: Dates and Months',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
                  return GridView.count(
                    crossAxisCount: crossAxisCount,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: constraints.maxWidth > 600 ? 2 : 3,
                    children: [
                      _buildMenuCard(
                        context,
                        'Ringkasan Materi',
                        Icons.book,
                        Colors.orange,
                        '/material',
                      ),
                      _buildMenuCard(
                        context,
                        'Strategi Pembelajaran',
                        Icons.lightbulb,
                        Colors.green,
                        '/strategy',
                      ),
                      _buildMenuCard(
                        context,
                        'Lembar Kerja (LKPD)',
                        Icons.assignment,
                        Colors.purple,
                        '/lkpd',
                      ),
                      _buildMenuCard(
                        context,
                        'Soal Asesmen',
                        Icons.quiz,
                        Colors.red,
                        '/assessment',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String route,
  ) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: color, width: 6),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(icon, size: 48, color: color),
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ringkasan Materi')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _SectionTitle('1. Days of the Week (Nama-nama Hari)'),
          _SectionContent('''
• Sunday (Minggu)
• Monday (Senin)
• Tuesday (Selasa)
• Wednesday (Rabu)
• Thursday (Kamis)
• Friday (Jumat)
• Saturday (Sabtu)

Note: Penulisan nama hari selalu diawali dengan huruf kapital.'''),
          SizedBox(height: 16),
          _SectionTitle('2. Months of the Year (Nama-nama Bulan)'),
          _SectionContent('''
• January (Januari)
• February (Februari)
• March (Maret)
• April (April)
• May (Mei)
• June (Juni)
• July (Juli)
• August (Agustus)
• September (September)
• October (Oktober)
• November (November)
• December (Desember)'''),
          SizedBox(height: 16),
          _SectionTitle('3. Ordinal Numbers (Bilangan Bertingkat)'),
          _SectionContent('''
Digunakan untuk menyebutkan tanggal:
• 1st : First
• 2nd : Second
• 3rd : Third
• 4th : Fourth
• 5th : Fifth
...
• 21st : Twenty-first
• 22nd : Twenty-second
• 31st : Thirty-first'''),
          SizedBox(height: 16),
          _SectionTitle('4. How to Read Dates (Cara Membaca Tanggal)'),
          _SectionContent('''
Terdapat dua format umum:
A. British Style (Tanggal - Bulan - Tahun)
   Penulisan: 17th August 1945
   Dibaca: The seventeenth of August nineteen forty-five

B. American Style (Bulan - Tanggal - Tahun)
   Penulisan: August 17th, 1945
   Dibaca: August the seventeenth nineteen forty-five'''),
          SizedBox(height: 16),
          _SectionTitle('5. Useful Phrases (Ungkapan Penting)'),
          _SectionContent('''
• What day is today? (Hari apa ini?) -> Today is Monday.
• What date is it today? (Tanggal berapa ini?) -> It is the 2nd of May.
• When is your birthday? (Kapan ulang tahunmu?) -> My birthday is on August 17th.'''),
        ],
      ),
    );
  }
}

class StrategyScreen extends StatelessWidget {
  const StrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Strategi Pembelajaran')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _SectionTitle('Informasi Umum'),
          _SectionContent('''
• Mata Pelajaran: Bahasa Inggris
• Kelas/Fase: V / Fase C
• Topik: Dates and Months
• Alokasi Waktu: 2 x 35 menit'''),
          SizedBox(height: 16),
          _SectionTitle('Tujuan Pembelajaran'),
          _SectionContent('''
1. Peserta didik dapat melafalkan nama-nama hari dan bulan dalam Bahasa Inggris dengan benar.
2. Peserta didik dapat menuliskan tanggal menggunakan ordinal numbers dengan tepat.
3. Peserta didik dapat bertanya dan menjawab tentang tanggal lahir atau hari besar.'''),
          SizedBox(height: 16),
          _SectionTitle('Model & Metode Pembelajaran'),
          _SectionContent('''
• Model: Project-Based Learning (PjBL) & Role Play
• Metode: Tanya jawab, diskusi, games (bermain peran), penugasan.'''),
          SizedBox(height: 16),
          _SectionTitle('Langkah Pembelajaran'),
          _SectionContent('''
A. Kegiatan Pendahuluan (10 Menit)
• Guru menyapa siswa (Greetings) dan berdoa.
• Apersepsi: Guru bertanya "What day is it today?" dan "What month is it?"
• Menyampaikan tujuan pembelajaran.

B. Kegiatan Inti (45 Menit)
• Eksplorasi: Guru menggunakan lagu "Months of the Year" untuk mengenalkan nama bulan.
• Elaborasi: Guru menjelaskan perbedaan cardinal dan ordinal numbers.
• Praktik: Siswa berpasangan melakukan dialog menanyakan tanggal lahir (Role Play).
• Proyek Mini: Siswa membuat "Birthday Calendar" kelas di atas kertas karton.

C. Kegiatan Penutup (15 Menit)
• Guru dan siswa menyimpulkan materi bersama.
• Refleksi: Apa yang menyenangkan dari pelajaran hari ini?
• Penilaian (Asesmen) dan pemberian PR.'''),
        ],
      ),
    );
  }
}

class LKPDScreen extends StatelessWidget {
  const LKPDScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lembar Kerja Peserta Didik (LKPD)')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.purple.shade50,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ......................', style: TextStyle(fontSize: 16)),
                  Text('Class: ......................', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          _SectionTitle('Task 1: Arrange the jumbled letters!'),
          _SectionContent('''
1. A - N - U - J - R - A - Y   = ______________
2. C - H - M - A - R           = ______________
3. G - U - S - T - U - A       = ______________
4. B - E - M - R - O - E - V - N = ______________'''),
          SizedBox(height: 16),
          _SectionTitle('Task 2: Match the ordinal numbers!'),
          _SectionContent('''
Tarik garis atau pasangkan angka dengan tulisan yang tepat:
1. 1st        a. Third
2. 2nd        b. Fifth
3. 3rd        c. First
4. 5th        d. Second'''),
          SizedBox(height: 16),
          _SectionTitle('Task 3: Write the dates in English!'),
          _SectionContent('''
1. 17 Agustus = ___________________________
2. 2 Mei = ___________________________
3. 21 April = ___________________________'''),
          SizedBox(height: 16),
          _SectionTitle('Task 4: Let\'s Interview!'),
          _SectionContent('''
Tanyakan tanggal lahir 3 teman sekelasmu dan tuliskan hasilnya di bawah ini!
Friend 1: "My birthday is on _________________"
Friend 2: "My birthday is on _________________"
Friend 3: "My birthday is on _________________"'''),
        ],
      ),
    );
  }
}

class AssessmentScreen extends StatelessWidget {
  const AssessmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Soal Asesmen')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _SectionTitle('A. Multiple Choice (Pilihan Ganda)'),
          _SectionContent('''
1. The month after July is...
   a) June
   b) August
   c) September
   d) May

2. "Hari Pendidikan Nasional" is celebrated on...
   a) May 2nd
   b) April 21st
   c) August 17th
   d) October 28th

3. How do you say "1st" in English?
   a) One
   b) Onest
   c) First
   d) Fiveth

4. Today is Monday. Tomorrow is...
   a) Sunday
   b) Tuesday
   c) Wednesday
   d) Thursday

5. Which one is the correct spelling?
   a) Febuary
   b) Februari
   c) February
   d) Fabruary'''),
          SizedBox(height: 16),
          _SectionTitle('B. Essay (Uraian)'),
          _SectionContent('''
1. Write the names of the days in a week!
   Answer: _________________________________________

2. Translate to English: "Hari ini adalah tanggal 10 November"
   Answer: _________________________________________

3. Read this date in English: "25th December"
   Answer: _________________________________________'''),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _SectionContent extends StatelessWidget {
  final String content;

  const _SectionContent(this.content);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
        height: 1.5,
      ),
    );
  }
}
