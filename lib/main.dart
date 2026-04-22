import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const QuizMasterApp());

// ─── Models ──────────────────────────────────────────────────────────────────

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class Category {
  final String name;
  final IconData icon;
  final Color color;
  final List<QuizQuestion> questions;

  const Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.questions,
  });
}

// ─── Question Bank (10 per category) ─────────────────────────────────────────

final List<Category> categories = [
  Category(
    name: 'Technology',
    icon: Icons.computer_rounded,
    color: const Color(0xFF6C63FF),
    questions: [
      QuizQuestion(
        question: 'What does HTML stand for?',
        options: ['HyperText Markup Language', 'High Tech Modern Language', 'Hyperlink Text Making Language', 'HyperText Making Links'],
        correctIndex: 0,
        explanation: 'HTML (HyperText Markup Language) is the standard language for creating web pages.',
      ),
      QuizQuestion(
        question: 'What does CSS stand for?',
        options: ['Computer Style Sheets', 'Creative Style System', 'Cascading Style Sheets', 'Colorful Style Syntax'],
        correctIndex: 2,
        explanation: 'CSS (Cascading Style Sheets) describes how HTML elements are displayed on screen.',
      ),
      QuizQuestion(
        question: 'Which language is primarily used for Flutter development?',
        options: ['Kotlin', 'Swift', 'Dart', 'Python'],
        correctIndex: 2,
        explanation: 'Flutter uses the Dart programming language, developed by Google.',
      ),
      QuizQuestion(
        question: 'What does API stand for?',
        options: ['Applied Program Integration', 'Application Programming Interface', 'Automated Process Instruction', 'App Process Interface'],
        correctIndex: 1,
        explanation: 'API (Application Programming Interface) is a bridge that lets software applications communicate.',
      ),
      QuizQuestion(
        question: 'What is the output of 2 + 2 * 2 in most programming languages?',
        options: ['8', '6', '4', '12'],
        correctIndex: 1,
        explanation: 'Multiplication has higher precedence: 2 + (2×2) = 2 + 4 = 6.',
      ),
      QuizQuestion(
        question: 'Which data structure uses LIFO order?',
        options: ['Queue', 'Array', 'LinkedList', 'Stack'],
        correctIndex: 3,
        explanation: 'Stack uses Last-In-First-Out (LIFO) — the last element pushed is the first popped.',
      ),
      QuizQuestion(
        question: 'Who created the World Wide Web?',
        options: ['Bill Gates', 'Linus Torvalds', 'Tim Berners-Lee', 'Steve Jobs'],
        correctIndex: 2,
        explanation: 'Tim Berners-Lee invented the World Wide Web in 1989 while working at CERN.',
      ),
      QuizQuestion(
        question: 'What does RAM stand for?',
        options: ['Read Access Memory', 'Random Access Memory', 'Rapid Application Module', 'Run Access Mode'],
        correctIndex: 1,
        explanation: 'RAM (Random Access Memory) is temporary storage that the CPU uses to hold running processes.',
      ),
      QuizQuestion(
        question: 'Which company developed the Android operating system?',
        options: ['Apple', 'Microsoft', 'Google', 'Samsung'],
        correctIndex: 2,
        explanation: 'Android was developed by Android Inc. and acquired by Google in 2005.',
      ),
      QuizQuestion(
        question: 'What is the correct file extension for a Python file?',
        options: ['.java', '.pt', '.py', '.pyt'],
        correctIndex: 2,
        explanation: 'Python source files use the .py extension, e.g., main.py.',
      ),
    ],
  ),
  Category(
    name: 'Science',
    icon: Icons.science_rounded,
    color: const Color(0xFF00B4D8),
    questions: [
      QuizQuestion(
        question: 'What planet is known as the Red Planet?',
        options: ['Venus', 'Jupiter', 'Mars', 'Saturn'],
        correctIndex: 2,
        explanation: 'Mars appears red due to iron oxide (rust) covering its surface.',
      ),
      QuizQuestion(
        question: 'What is the chemical symbol for water?',
        options: ['WO', 'H2O', 'HO2', 'W2O'],
        correctIndex: 1,
        explanation: 'Water is H2O — two hydrogen atoms bonded to one oxygen atom.',
      ),
      QuizQuestion(
        question: 'What is the powerhouse of the cell?',
        options: ['Nucleus', 'Ribosome', 'Mitochondria', 'Golgi body'],
        correctIndex: 2,
        explanation: 'Mitochondria generate most of the cell\'s ATP (energy) through cellular respiration.',
      ),
      QuizQuestion(
        question: 'How many bones are in the adult human body?',
        options: ['186', '206', '226', '246'],
        correctIndex: 1,
        explanation: 'The adult human body has 206 bones. Babies are born with around 270.',
      ),
      QuizQuestion(
        question: 'What is the approximate speed of light?',
        options: ['300,000 km/s', '150,000 km/s', '450,000 km/s', '100,000 km/s'],
        correctIndex: 0,
        explanation: 'Light travels at approximately 299,792 km/s in a vacuum.',
      ),
      QuizQuestion(
        question: 'Which gas do plants absorb during photosynthesis?',
        options: ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
        correctIndex: 2,
        explanation: 'Plants absorb CO2 and water, using sunlight to produce glucose and release oxygen.',
      ),
      QuizQuestion(
        question: 'What is the atomic number of Carbon?',
        options: ['4', '6', '8', '12'],
        correctIndex: 1,
        explanation: 'Carbon has atomic number 6, meaning it has 6 protons in its nucleus.',
      ),
      QuizQuestion(
        question: 'Which organ pumps blood throughout the human body?',
        options: ['Liver', 'Brain', 'Lungs', 'Heart'],
        correctIndex: 3,
        explanation: 'The heart is a muscular organ that pumps blood through the circulatory system.',
      ),
      QuizQuestion(
        question: 'What is the most abundant gas in Earth\'s atmosphere?',
        options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
        correctIndex: 2,
        explanation: 'Nitrogen makes up about 78% of Earth\'s atmosphere.',
      ),
      QuizQuestion(
        question: 'How many planets are in our Solar System?',
        options: ['7', '8', '9', '10'],
        correctIndex: 1,
        explanation: 'Our Solar System has 8 planets. Pluto was reclassified as a dwarf planet in 2006.',
      ),
    ],
  ),
  Category(
    name: 'General Knowledge',
    icon: Icons.public_rounded,
    color: const Color(0xFFFF6B6B),
    questions: [
      QuizQuestion(
        question: 'What is the capital of France?',
        options: ['Berlin', 'Madrid', 'Paris', 'Rome'],
        correctIndex: 2,
        explanation: 'Paris is the capital and most populous city of France.',
      ),
      QuizQuestion(
        question: 'How many continents are on Earth?',
        options: ['5', '6', '7', '8'],
        correctIndex: 2,
        explanation: 'Earth has 7 continents: Africa, Antarctica, Asia, Australia, Europe, North America, South America.',
      ),
      QuizQuestion(
        question: 'Which is the largest ocean on Earth?',
        options: ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
        correctIndex: 3,
        explanation: 'The Pacific Ocean is the largest, covering more than 30% of Earth\'s surface.',
      ),
      QuizQuestion(
        question: 'Who painted the Mona Lisa?',
        options: ['Michelangelo', 'Leonardo da Vinci', 'Raphael', 'Van Gogh'],
        correctIndex: 1,
        explanation: 'Leonardo da Vinci painted the Mona Lisa between approximately 1503 and 1519.',
      ),
      QuizQuestion(
        question: 'How many sides does a hexagon have?',
        options: ['5', '7', '6', '8'],
        correctIndex: 2,
        explanation: 'A hexagon has exactly 6 sides and 6 interior angles.',
      ),
      QuizQuestion(
        question: 'What is the tallest mountain in the world?',
        options: ['K2', 'Kangchenjunga', 'Mount Everest', 'Makalu'],
        correctIndex: 2,
        explanation: 'Mount Everest stands at 8,849 m, making it the highest peak above sea level.',
      ),
      QuizQuestion(
        question: 'In which year did World War II end?',
        options: ['1943', '1944', '1946', '1945'],
        correctIndex: 3,
        explanation: 'World War II ended in 1945 — V-E Day on May 8 and V-J Day on September 2.',
      ),
      QuizQuestion(
        question: 'Which country is the largest by area?',
        options: ['China', 'USA', 'Canada', 'Russia'],
        correctIndex: 3,
        explanation: 'Russia is the world\'s largest country by area, covering about 17.1 million km².',
      ),
      QuizQuestion(
        question: 'What is the currency of Japan?',
        options: ['Yuan', 'Won', 'Yen', 'Ringgit'],
        correctIndex: 2,
        explanation: 'The Japanese Yen (¥) is the official currency of Japan.',
      ),
      QuizQuestion(
        question: 'How many colors are in a rainbow?',
        options: ['5', '6', '7', '8'],
        correctIndex: 2,
        explanation: 'A rainbow has 7 colors: Red, Orange, Yellow, Green, Blue, Indigo, Violet (ROYGBIV).',
      ),
    ],
  ),
];

// ─── App Root with Theme Toggle ───────────────────────────────────────────────

class QuizMasterApp extends StatefulWidget {
  const QuizMasterApp({super.key});

  @override
  State<QuizMasterApp> createState() => _QuizMasterAppState();
}

class _QuizMasterAppState extends State<QuizMasterApp> {
  bool _isDark = true; // dark mode by default

  void toggleTheme() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _isDark ? _darkTheme : _lightTheme,
      duration: const Duration(milliseconds: 300),
      child: MaterialApp(
        title: 'Quiz Master',
        debugShowCheckedModeBanner: false,
        theme: _lightTheme,
        darkTheme: _darkTheme,
        themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
        home: HomeScreen(isDark: _isDark, onToggleTheme: toggleTheme),
      ),
    );
  }
}

// ─── Theme Definitions ────────────────────────────────────────────────────────

final ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF6C63FF),
    surface: Color(0xFF1E2A45),
    background: Color(0xFF1A1A2E),
  ),
  scaffoldBackgroundColor: const Color(0xFF1A1A2E),
  cardColor: const Color(0xFF1E2A45),
  useMaterial3: true,
);

final ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6C63FF),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFF4F6FF),
  ),
  scaffoldBackgroundColor: const Color(0xFFF4F6FF),
  cardColor: Colors.white,
  useMaterial3: true,
);

// ─── Home Screen ──────────────────────────────────────────────────────────────

class HomeScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const HomeScreen({super.key, required this.isDark, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    final bg = isDark
        ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)])
        : const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFFF4F6FF), Color(0xFFEEEBFF), Color(0xFFE8F4FF)]);

    final textPrimary = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final textSecondary = isDark ? Colors.white54 : Colors.black45;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: bg),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      // Header row
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6C63FF).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.quiz_rounded, color: Color(0xFF6C63FF), size: 28),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Quiz Master', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimary)),
                                Text('Test your knowledge!', style: TextStyle(fontSize: 12, color: textSecondary)),
                              ],
                            ),
                          ),
                          // Dark/Light toggle
                          GestureDetector(
                            onTap: onToggleTheme,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: isDark ? Colors.white12 : const Color(0xFF6C63FF).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: isDark ? Colors.white24 : const Color(0xFF6C63FF).withOpacity(0.3)),
                              ),
                              child: Row(
                                children: [
                                  Icon(isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                                      color: isDark ? Colors.white70 : const Color(0xFF6C63FF), size: 16),
                                  const SizedBox(width: 6),
                                  Text(isDark ? 'Dark' : 'Light',
                                      style: TextStyle(color: isDark ? Colors.white70 : const Color(0xFF6C63FF),
                                          fontSize: 12, fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      Text('Choose a Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: textPrimary)),
                      const SizedBox(height: 4),
                      Text('Each quiz has 10 questions • 15 sec per question',
                          style: TextStyle(fontSize: 12, color: textSecondary)),
                      const SizedBox(height: 20),
                      // Category cards
                      ...categories.map((cat) => _CategoryCard(category: cat, isDark: isDark)),
                    ],
                  ),
                ),
              ),
              // Footer
              _Footer(isDark: isDark),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;
  final bool isDark;

  const _CategoryCard({required this.category, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => QuizScreen(category: category, isDark: isDark))),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E2A45) : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: category.color.withOpacity(0.25), width: 1.5),
            boxShadow: isDark
                ? []
                : [BoxShadow(color: category.color.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: category.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(category.icon, color: category.color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.name,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF1A1A2E))),
                    const SizedBox(height: 3),
                    Text('${category.questions.length} Questions',
                        style: TextStyle(fontSize: 12, color: isDark ? Colors.white38 : Colors.black38)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: category.color, size: 14),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Footer ───────────────────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  final bool isDark;
  const _Footer({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        'Made with ❤️ by Tanya Vaish',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: isDark ? Colors.white24 : Colors.black26,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

// ─── Quiz Screen ──────────────────────────────────────────────────────────────

class QuizScreen extends StatefulWidget {
  final Category category;
  final bool isDark;

  const QuizScreen({super.key, required this.category, required this.isDark});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOption;
  bool _answered = false;

  int _timeLeft = 15;
  Timer? _timer;

  int _currentStreak = 0;
  int _maxStreak = 0;

  // stores per-question result for detailed summary
  final List<Map<String, dynamic>> _questionLog = [];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timeLeft = 15;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() => _timeLeft--);
      if (_timeLeft <= 0) {
        t.cancel();
        _handleTimeout();
      }
    });
  }

  void _handleTimeout() {
    if (_answered) return;
    setState(() {
      _answered = true;
      _selectedOption = null;
      _currentStreak = 0;
      _questionLog.add({
        'correct': false,
        'timeout': true,
        'skipped': false,
        'selected': -1,
      });
    });
    _scheduleNext();
  }

  void _selectOption(int index) {
    if (_answered) return;
    _timer?.cancel();

    final correct = widget.category.questions[_currentIndex].correctIndex;
    final isCorrect = index == correct;

    if (isCorrect) {
      _score++;
      _currentStreak++;
      if (_currentStreak > _maxStreak) _maxStreak = _currentStreak;
    } else {
      _currentStreak = 0;
    }

    setState(() {
      _selectedOption = index;
      _answered = true;
      _questionLog.add({
        'correct': isCorrect,
        'timeout': false,
        'skipped': false,
        'selected': index,
      });
    });
    _scheduleNext();
  }

  void _skipQuestion() {
    if (_answered) return;
    _timer?.cancel();
    setState(() {
      _answered = true;
      _selectedOption = null;
      _currentStreak = 0; // break streak on skip
      _questionLog.add({
        'correct': false,
        'timeout': false,
        'skipped': true,
        'selected': -1,
      });
    });
    _scheduleNext();
  }

  void _scheduleNext() {
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (!mounted) return;
      if (_currentIndex < widget.category.questions.length - 1) {
        setState(() {
          _currentIndex++;
          _selectedOption = null;
          _answered = false;
        });
        _startTimer();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultScreen(
              category: widget.category,
              score: _score,
              total: widget.category.questions.length,
              maxStreak: _maxStreak,
              questionLog: _questionLog,
              isDark: widget.isDark,
            ),
          ),
        );
      }
    });
  }

  Color _optionBg(int index) {
    if (!_answered) return widget.isDark ? const Color(0xFF1E2A45) : Colors.white;
    final correct = widget.category.questions[_currentIndex].correctIndex;
    if (index == correct) return const Color(0xFF1B5E20);
    if (index == _selectedOption) return const Color(0xFFB71C1C);
    return widget.isDark ? const Color(0xFF1E2A45) : Colors.white;
  }

  Color _optionBorder(int index) {
    if (!_answered) return widget.isDark ? Colors.white12 : Colors.black12;
    final correct = widget.category.questions[_currentIndex].correctIndex;
    if (index == correct) return const Color(0xFF4CAF50);
    if (index == _selectedOption) return const Color(0xFFF44336);
    return widget.isDark ? Colors.white12 : Colors.black12;
  }

  IconData? _optionIcon(int index) {
    if (!_answered) return null;
    final correct = widget.category.questions[_currentIndex].correctIndex;
    if (index == correct) return Icons.check_circle_rounded;
    if (index == _selectedOption) return Icons.cancel_rounded;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.category.questions[_currentIndex];
    final total = widget.category.questions.length;
    final progress = (_currentIndex + 1) / total;
    final timerColor = _timeLeft > 8 ? const Color(0xFF4CAF50) : _timeLeft > 4 ? const Color(0xFFFF9800) : const Color(0xFFF44336);
    final textPrimary = widget.isDark ? Colors.white : const Color(0xFF1A1A2E);
    final textSecondary = widget.isDark ? Colors.white54 : Colors.black54;
    final bgGrad = widget.isDark
        ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)])
        : const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFFF4F6FF), Color(0xFFEEEBFF), Color(0xFFE8F4FF)]);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: bgGrad),
        child: SafeArea(
          child: Column(
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.close_rounded, color: textSecondary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Q ${_currentIndex + 1} of $total',
                                  style: TextStyle(color: textSecondary, fontSize: 13, fontWeight: FontWeight.w600)),
                              if (_currentStreak >= 2) ...[
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.orange.withOpacity(0.4)),
                                  ),
                                  child: Row(children: [
                                    const Icon(Icons.local_fire_department_rounded, color: Colors.orange, size: 12),
                                    Text(' $_currentStreak', style: const TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.bold)),
                                  ]),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 6),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: LinearProgressIndicator(
                              value: progress,
                              minHeight: 6,
                              backgroundColor: widget.isDark ? Colors.white10 : Colors.black.withOpacity(0.1),
                              valueColor: AlwaysStoppedAnimation<Color>(widget.category.color),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              // Timer + Score
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      decoration: BoxDecoration(
                        color: timerColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: timerColor.withOpacity(0.35)),
                      ),
                      child: Row(children: [
                        Icon(Icons.timer_rounded, color: timerColor, size: 15),
                        const SizedBox(width: 4),
                        Text('$_timeLeft s', style: TextStyle(color: timerColor, fontWeight: FontWeight.bold, fontSize: 13)),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      decoration: BoxDecoration(
                        color: widget.isDark ? Colors.white.withOpacity(0.07) : Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        const Icon(Icons.star_rounded, color: Color(0xFFFFD700), size: 15),
                        const SizedBox(width: 4),
                        Text('$_score pts', style: TextStyle(color: textSecondary, fontWeight: FontWeight.w600, fontSize: 13)),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Question card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: widget.isDark ? const Color(0xFF1E2A45) : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: widget.category.color.withOpacity(0.3), width: 1.5),
                    boxShadow: widget.isDark
                        ? []
                        : [BoxShadow(color: widget.category.color.withOpacity(0.07), blurRadius: 12, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                        decoration: BoxDecoration(
                          color: widget.category.color.withOpacity(0.13),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(widget.category.name,
                            style: TextStyle(color: widget.category.color, fontSize: 11, fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 10),
                      Text(question.question,
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: textPrimary, height: 1.4)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // Options list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: question.options.length,
                  itemBuilder: (_, i) {
                    final icon = _optionIcon(i);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: _answered ? null : () => _selectOption(i),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _optionBg(i),
                          disabledBackgroundColor: _optionBg(i),
                          elevation: _answered ? 0 : 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                            side: BorderSide(color: _optionBorder(i), width: 1.5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 30, height: 30,
                              decoration: BoxDecoration(
                                color: widget.isDark ? Colors.white.withOpacity(0.07) : Colors.black.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              alignment: Alignment.center,
                              child: Text(String.fromCharCode(65 + i),
                                  style: TextStyle(color: textSecondary, fontWeight: FontWeight.bold, fontSize: 12)),
                            ),
                            const SizedBox(width: 11),
                            Expanded(
                              child: Text(question.options[i],
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textPrimary)),
                            ),
                            if (icon != null)
                              Icon(icon,
                                  color: icon == Icons.check_circle_rounded ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
                                  size: 19),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Skip button — only shown before answering
              if (!_answered)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: OutlinedButton.icon(
                      onPressed: _skipQuestion,
                      icon: Icon(Icons.skip_next_rounded,
                          size: 17,
                          color: widget.isDark ? Colors.white38 : Colors.black38),
                      label: Text('Skip Question',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: widget.isDark ? Colors.white38 : Colors.black38)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: widget.isDark ? Colors.white12 : Colors.black12,
                            width: 1.2),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13)),
                      ),
                    ),
                  ),
                ),
              if (_answered)
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: (_questionLog.last['skipped'] == true
                            ? Colors.blueGrey
                            : _selectedOption == question.correctIndex
                                ? const Color(0xFF4CAF50)
                                : const Color(0xFFF44336))
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: (_questionLog.last['skipped'] == true
                              ? Colors.blueGrey
                              : _selectedOption == question.correctIndex
                                  ? const Color(0xFF4CAF50)
                                  : const Color(0xFFF44336))
                          .withOpacity(0.35),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        _questionLog.last['skipped'] == true
                            ? Icons.double_arrow_rounded
                            : _selectedOption == null
                                ? Icons.access_time_rounded
                                : _selectedOption == question.correctIndex
                                    ? Icons.lightbulb_rounded
                                    : Icons.info_rounded,
                        color: _questionLog.last['skipped'] == true
                            ? Colors.blueGrey
                            : _selectedOption == question.correctIndex
                                ? const Color(0xFF4CAF50)
                                : const Color(0xFFF44336),
                        size: 17,
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _questionLog.last['skipped'] == true
                                  ? 'Skipped!'
                                  : _selectedOption == null
                                      ? "Time's up!"
                                      : _selectedOption == question.correctIndex
                                          ? 'Correct! 🎉'
                                          : 'Incorrect!',
                              style: TextStyle(
                                color: _questionLog.last['skipped'] == true
                                    ? Colors.blueGrey
                                    : _selectedOption == question.correctIndex
                                        ? const Color(0xFF4CAF50)
                                        : const Color(0xFFF44336),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(question.explanation,
                                style: TextStyle(color: textSecondary, fontSize: 12, height: 1.4)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              _Footer(isDark: widget.isDark),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Result Screen ────────────────────────────────────────────────────────────

class ResultScreen extends StatelessWidget {
  final Category category;
  final int score;
  final int total;
  final int maxStreak;
  final List<Map<String, dynamic>> questionLog;
  final bool isDark;

  const ResultScreen({
    super.key,
    required this.category,
    required this.score,
    required this.total,
    required this.maxStreak,
    required this.questionLog,
    required this.isDark,
  });

  String get _grade {
    final p = score / total;
    if (p == 1.0) return '🏆 Perfect!';
    if (p >= 0.8) return '🌟 Excellent!';
    if (p >= 0.6) return '👍 Good Job!';
    if (p >= 0.4) return '📚 Keep Practicing';
    return '💪 Try Again';
  }

  Color get _gradeColor {
    final p = score / total;
    if (p >= 0.8) return const Color(0xFF4CAF50);
    if (p >= 0.6) return const Color(0xFF6C63FF);
    if (p >= 0.4) return const Color(0xFFFF9800);
    return const Color(0xFFF44336);
  }

  @override
  Widget build(BuildContext context) {
    final accuracy = (score / total * 100).round();
    final timeouts = questionLog.where((q) => q['timeout'] == true).length;
    final skipped = questionLog.where((q) => q['skipped'] == true).length;
    final textPrimary = isDark ? Colors.white : const Color(0xFF1A1A2E);
    final textSecondary = isDark ? Colors.white54 : Colors.black54;
    final cardBg = isDark ? const Color(0xFF1E2A45) : Colors.white;
    final bgGrad = isDark
        ? const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)])
        : const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFFF4F6FF), Color(0xFFEEEBFF), Color(0xFFE8F4FF)]);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: bgGrad),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Text('Quiz Complete!',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: category.color)),
                      const SizedBox(height: 4),
                      Text(category.name, style: TextStyle(color: textSecondary, fontSize: 13)),
                      const SizedBox(height: 14),

                      // Top quick-action buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => QuizScreen(category: category, isDark: isDark)),
                              ),
                              icon: Icon(Icons.refresh_rounded, size: 15, color: category.color),
                              label: Text('Retry', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: category.color)),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                side: BorderSide(color: category.color.withOpacity(0.5), width: 1.2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                              icon: Icon(Icons.home_rounded, size: 15, color: isDark ? Colors.white54 : Colors.black45),
                              label: Text('Home', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: isDark ? Colors.white54 : Colors.black45)),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                side: BorderSide(color: isDark ? Colors.white24 : Colors.black12, width: 1.2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Score summary card
                      Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: category.color.withOpacity(0.2)),
                          boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
                        ),
                        child: Column(
                          children: [
                            Text(_grade, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary)),
                            const SizedBox(height: 12),
                            Text('$score/$total',
                                style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: _gradeColor, height: 1)),
                            const SizedBox(height: 4),
                            Text('$accuracy% Accuracy', style: TextStyle(color: textSecondary, fontSize: 13)),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _StatChip(label: 'Correct', value: '$score', color: const Color(0xFF4CAF50), icon: Icons.check_rounded, isDark: isDark),
                                _StatChip(label: 'Wrong', value: '${total - score - timeouts - skipped}', color: const Color(0xFFF44336), icon: Icons.close_rounded, isDark: isDark),
                                _StatChip(label: 'Skipped', value: '$skipped', color: Colors.blueGrey, icon: Icons.skip_next_rounded, isDark: isDark),
                                _StatChip(label: 'Streak', value: '$maxStreak🔥', color: Colors.orange, icon: Icons.local_fire_department_rounded, isDark: isDark),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),

                      // Detailed question-by-question summary
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Detailed Summary',
                            style: TextStyle(color: textPrimary, fontSize: 15, fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(height: 10),

                      ...List.generate(total, (i) {
                        final log = i < questionLog.length ? questionLog[i] : {'correct': false, 'timeout': true, 'skipped': false, 'selected': -1};
                        final isCorrect = log['correct'] == true;
                        final isTimeout = log['timeout'] == true;
                        final isSkipped = log['skipped'] == true;
                        final selectedIdx = log['selected'] as int;
                        final q = category.questions[i];

                        // pick label/color for the status badge
                        final statusLabel = isSkipped ? 'Skipped' : isTimeout ? 'Timeout' : isCorrect ? 'Correct' : 'Wrong';
                        final statusColor = isSkipped ? Colors.blueGrey : isTimeout ? const Color(0xFFFF9800) : isCorrect ? const Color(0xFF4CAF50) : const Color(0xFFF44336);

                        final borderColor = isCorrect
                            ? const Color(0xFF4CAF50).withOpacity(0.3)
                            : statusColor.withOpacity(0.3);

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: cardBg,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: borderColor, width: 1.2),
                            boxShadow: isDark ? [] : [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Question header row
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    isCorrect ? Icons.check_circle_rounded : isSkipped ? Icons.skip_next_rounded : Icons.cancel_rounded,
                                    color: statusColor,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text('Q${i + 1}: ${q.question}',
                                        style: TextStyle(color: textPrimary, fontSize: 13, fontWeight: FontWeight.w600, height: 1.4)),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: statusColor.withOpacity(0.12),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Text(
                                      statusLabel,
                                      style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // User's answer row
                              if (isSkipped)
                                _SummaryRow(
                                  label: 'Your Answer',
                                  value: 'Skipped',
                                  color: Colors.blueGrey,
                                  icon: Icons.skip_next_rounded,
                                  isDark: isDark,
                                )
                              else if (isTimeout)
                                _SummaryRow(
                                  label: 'Your Answer',
                                  value: 'No answer (timed out)',
                                  color: const Color(0xFFFF9800),
                                  icon: Icons.timer_off_rounded,
                                  isDark: isDark,
                                )
                              else if (selectedIdx >= 0)
                                _SummaryRow(
                                  label: 'Your Answer',
                                  value: q.options[selectedIdx],
                                  color: isCorrect ? const Color(0xFF4CAF50) : const Color(0xFFF44336),
                                  icon: isCorrect ? Icons.check_rounded : Icons.close_rounded,
                                  isDark: isDark,
                                ),
                              const SizedBox(height: 6),
                              // Correct answer
                              _SummaryRow(
                                label: 'Correct Answer',
                                value: q.options[q.correctIndex],
                                color: const Color(0xFF4CAF50),
                                icon: Icons.lightbulb_rounded,
                                isDark: isDark,
                              ),
                              const SizedBox(height: 8),
                              // Explanation
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: isDark ? Colors.white.withOpacity(0.04) : Colors.black.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.info_outline_rounded, size: 14, color: textSecondary),
                                    const SizedBox(width: 7),
                                    Expanded(
                                      child: Text(q.explanation,
                                          style: TextStyle(color: textSecondary, fontSize: 12, height: 1.4)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                      const SizedBox(height: 20),

                      // Action buttons
                      SizedBox(
                        width: double.infinity, height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => QuizScreen(category: category, isDark: isDark)),
                          ),
                          icon: const Icon(Icons.refresh_rounded),
                          label: const Text('Retry This Category', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category.color,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                            elevation: 0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity, height: 50,
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                          icon: Icon(Icons.home_rounded, color: textSecondary),
                          label: Text('Back to Home', style: TextStyle(fontSize: 14, color: textSecondary)),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: isDark ? Colors.white24 : Colors.black12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _Footer(isDark: isDark),
            ],
          ),
        ),
      ),
    );
  }
}

// small labeled answer row in summary
class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;
  final bool isDark;

  const _SummaryRow({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 14),
        const SizedBox(width: 6),
        Text('$label: ', style: TextStyle(color: isDark ? Colors.white38 : Colors.black38, fontSize: 12)),
        Expanded(
          child: Text(value, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}

// stat chip widget for analytics row
class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;
  final bool isDark;

  const _StatChip({required this.label, required this.value, required this.color, required this.icon, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(9)),
          child: Icon(icon, color: color, size: 15),
        ),
        const SizedBox(height: 5),
        Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
        Text(label, style: TextStyle(color: isDark ? Colors.white38 : Colors.black38, fontSize: 10)),
      ],
    );
  }
}