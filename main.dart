import 'package:flutter/material.dart';

void main() {
  runApp(PlantWatererApp());
}

class PlantWatererApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'نظام الري الذكي الشامل',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFF4F9F4),
      ),
      home: LoginScreen(),
    );
  }
}

// 1. شاشة تسجيل الدخول
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.eco_rounded, size: 90, color: Colors.green.shade700),
              SizedBox(height: 10),
              Text('نظام الري الذكي', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green.shade900)),
              Text('تحكم محلي وعن بُعد بنباتاتك', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
              SizedBox(height: 30),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 52),
                  backgroundColor: Colors.green.shade700,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => ModeSelectionScreen()),
                  );
                },
                child: Text('تسجيل الدخول', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RegisterScreen()),
                  );
                },
                child: Text('ليس لديك حساب؟ أنشئ حساباً جديداً', style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. شاشة إنشاء حساب جديد
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('إنشاء حساب جديد'), backgroundColor: Colors.green.shade700),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'اسم المستخدم',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'كلمة المرور الجديدة',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 52),
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم إنشاء الحساب بنجاح! سجل دخولك الآن.')),
                );
              },
              child: Text('حفظ وتسجيل', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. شاشة اختيار وضع الاتصال (محلي أو سحابي)
class ModeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر وضع الاتصال بالنظام'),
        backgroundColor: Colors.green.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.settings_input_antenna, size: 80, color: Colors.green.shade700),
            SizedBox(height: 20),
            Text('كيف تريد التحكم بالنباتات الآن؟', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.teal.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: Icon(Icons.bluetooth_connected, size: 28, color: Colors.white),
              label: Text('الوضع المحلي (Bluetooth / Wi-Fi مباشر)', style: TextStyle(fontSize: 16, color: Colors.white)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardScreen(modeName: 'الوضع المحلي (مباشر)')));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: Icon(Icons.cloud, size: 28, color: Colors.white),
              label: Text('الوضع السحابي (عن بُعد عبر الإنترنت)', style: TextStyle(fontSize: 16, color: Colors.white)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DashboardScreen(modeName: 'الوضع السحابي (عن بُعد)')));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 4. لوحة التحكم الرئيسية (تدعم الوضعين مع زر تشغيل/إيقاف وتنبيه فيضان)
class DashboardScreen extends StatefulWidget {
  final String modeName;
  DashboardScreen({required this.modeName});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isPumpRunning = false;
  int currentHumidity = 48;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لوحة التحكم - ${widget.modeName}'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة مؤشر الرطوبة وتنبيه الفيضان
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: currentHumidity > 80 
                      ? [Colors.red.shade600, Colors.orange.shade400] 
                      : [Colors.green.shade600, Colors.green.shade400],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: Offset(0, 5))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('رطوبة التربة الحالية', style: TextStyle(color: Colors.white70, fontSize: 16)),
                          SizedBox(height: 8),
                          Text('$currentHumidity%', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Icon(Icons.water_drop, size: 60, color: Colors.white.withOpacity(0.8)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    currentHumidity > 80 
                        ? '⚠️ تنبيه: الرطوبة مرتفعة جداً، أوقف المضخة فوراً لتلافي الفيضان!' 
                        : 'الحالة عبر ${widget.modeName}: ممتازة ومتوازنة 🌿',
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // رسم بياني مبسط
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('معدل الرطوبة خلال الأيام الأخيرة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildBarChartColumn('السبت', 0.4),
                        _buildBarChartColumn('الأحد', 0.6),
                        _buildBarChartColumn('الإثنين', 0.3),
                        _buildBarChartColumn('الثلاثاء', 0.8),
                        _buildBarChartColumn('الأربعاء', 0.5),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // زر تشغيل وإيقاف المضخة الديناميكي
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55),
                backgroundColor: isPumpRunning ? Colors.red.shade700 : Colors.orange.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: Icon(isPumpRunning ? Icons.stop_circle : Icons.power_settings_new, color: Colors.white),
              label: Text(
                isPumpRunning ? 'إيقاف المضخة فوراً 🛑' : 'تشغيل المضخة الآن 💧',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() {
                  isPumpRunning = !isPumpRunning;
                  if (isPumpRunning) {
                    currentHumidity += 10;
                  }
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isPumpRunning 
                          ? 'تم إرسال أمر التشغيل عبر ${widget.modeName} بنجاح!' 
                          : 'تم إيقاف المضخة وحماية النبتة من الفيضان.',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarChartColumn(String day, double heightFactor) {
    return Column(
      children: [
        Container(
          width: 25,
          height: 100 * heightFactor,
          decoration: BoxDecoration(
            color: Colors.green.shade400,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        SizedBox(height: 8),
        Text(day, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
      ],
    );
  }
}
