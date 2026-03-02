import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grad/core/colors/app_colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _main;
  late final AnimationController _stripes;

  late final Animation<Alignment> _alignment;
  late final Animation<double> _progress;

  final List<String> _messages = const [
    "Booting A-MSSP core",
    "Loading threat signatures",
    "Calibrating sensors",
    "Encrypting channel",
    "Starting secure session",
  ];
  int _msgIndex = 0;
  Timer? _msgTimer;

  @override
  void initState() {
    super.initState();

    _main = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    );

    _stripes = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _alignment = AlignmentTween(
      begin: Alignment.center,
      end: const Alignment(0.05, -0.89),
    ).animate(
      CurvedAnimation(
        parent: _main,
        curve: const Interval(0.0, 0.55, curve: Curves.easeInOut),
      ),
    );

    _progress = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _main,
        curve: const Interval(0.15, 1.0, curve: Curves.easeInOut),
      ),
    );

    _msgTimer = Timer.periodic(const Duration(milliseconds: 650), (_) {
      if (!mounted) return;
      setState(() => _msgIndex = (_msgIndex + 1) % _messages.length);
    });

    Timer(const Duration(milliseconds: 650), () {
      if (!mounted) return;
      _main.forward();
    });

    Timer(const Duration(milliseconds: 3600), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  void dispose() {
    _msgTimer?.cancel();
    _main.dispose();
    _stripes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDarker,
      body: AnimatedBuilder(
        animation: Listenable.merge([_main, _stripes]),
        builder: (context, _) {
          final p = _progress.value.clamp(0.0, 1.0);
          return Align(
            alignment: _alignment.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.logo.withOpacity(0.75),
                            AppColors.logo.withOpacity(0.35),
                            Colors.transparent,
                          ],
                          stops: const [0.2, 0.6, 1],
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/app.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                const Text(
                  'A-MSSP',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 25,
                    fontFamily: 'Silom',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _messages[_msgIndex],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 12,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${(p * 100).round()}%",
                            style: TextStyle(
                              color: AppColors.textSecondary.withOpacity(0.9),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _CyberLoaderBar(
                        value: p,
                        stripePhase: _stripes.value,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CyberLoaderBar extends StatelessWidget {
  final double value;
  final double stripePhase;

  const _CyberLoaderBar({
    required this.value,
    required this.stripePhase,
  });

  @override
  Widget build(BuildContext context) {
    final v = value.clamp(0.0, 1.0);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CustomPaint(
        painter: _CyberBarPainter(
          value: v,
          stripePhase: stripePhase,
        ),
        child: const SizedBox(height: 16),
      ),
    );
  }
}

class _CyberBarPainter extends CustomPainter {
  final double value;
  final double stripePhase;

  _CyberBarPainter({
    required this.value,
    required this.stripePhase,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final r = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(10),
    );

    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.backgroundDarker.withOpacity(0.85),
          AppColors.backgroundDark.withOpacity(0.65),
        ],
      ).createShader(Offset.zero & size);

    canvas.drawRRect(r, bgPaint);

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.accentPurple.withOpacity(0.55);

    canvas.drawRRect(r, borderPaint);

    final fillW = size.width * value;
    if (fillW <= 0) return;

    final fillRect = Rect.fromLTWH(0, 0, fillW, size.height);
    final fillR = RRect.fromRectAndRadius(
      fillRect,
      const Radius.circular(10),
    );

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColors.logo.withOpacity(0.95),
          Colors.white.withOpacity(0.90),
        ],
      ).createShader(fillRect);

    canvas.save();
    canvas.clipRRect(r);
    canvas.drawRRect(fillR, fillPaint);

    final stripePaint = Paint()
      ..color = Colors.black.withOpacity(0.10)
      ..strokeWidth = 2;

    final shift = stripePhase * 12.0;
    const gap = 10.0;
    for (double x = -size.height * 2; x < fillW + size.height * 2; x += gap) {
      final x0 = x + shift;
      canvas.drawLine(
        Offset(x0, size.height),
        Offset(x0 + size.height, 0),
        stripePaint,
      );
    }

    final scanX = fillW.clamp(0.0, size.width);
    final scanGlow = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.transparent,
          Colors.white.withOpacity(0.75),
          Colors.transparent,
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Rect.fromLTWH(scanX - 12, 0, 24, size.height));

    canvas.drawRect(Rect.fromLTWH(scanX - 12, 0, 24, size.height), scanGlow);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _CyberBarPainter oldDelegate) {
    return oldDelegate.value != value || oldDelegate.stripePhase != stripePhase;
  }
}