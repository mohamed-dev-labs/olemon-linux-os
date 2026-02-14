# 🍋 Olemon Linux OS

![Olemon Logo](logo.jpg)

**Olemon Linux OS** هو نظام تشغيل مبسط ومفتوح المصدر مبني على **Ubuntu**، مصمم خصيصاً لشركة **Olemon Incorporation**. يهدف النظام إلى توفير بيئة **Sandbox** معزولة، خفيفة جداً، وسريعة الأداء (CPU/GPU) للعمل عبر **WSL (Windows Subsystem for Linux)**.

## 🚀 المميزات
- **شعار أحمر مميز:** يظهر الشعار الرسمي باللون الأحمر عند تشغيل التيرمينال.
- **خفيف جداً:** تم تجريد النظام من الإضافات غير الضرورية لضمان أقصى سرعة.
- **بيئة Sandbox:** معزول تماماً لاختبار الأدوات والأنظمة بأمان.
- **تكامل مع PowerShell:** يمكن تثبيته وتشغيله بضغطة واحدة من خلال Windows PowerShell.
- **أداء محسن:** تحسينات في استهلاك الموارد للعمل بكفاءة على WSL.

## 🛠️ التثبيت السريع (PowerShell)

لفتح النظام وتثبيته مباشرة على جهازك، افتح **PowerShell** كمسؤول وقم بتشغيل الأمر التالي:

```powershell
irm https://raw.githubusercontent.com/mohamed-dev-labs/olemon-linux-os/master/install.ps1 | iex
```

*ملاحظة: سيقوم هذا الأمر بتفعيل ميزات WSL وتثبيت نسخة Olemon المبنية على أوبنتو.*

## 💻 الإعداد الداخلي (داخل WSL)
بعد الدخول إلى النظام لأول مرة، قم بتشغيل الأمر التالي لتفعيل الشعار والتحسينات:
```bash
curl -s https://raw.githubusercontent.com/mohamed-dev-labs/olemon-linux-os/master/setup.sh | bash
```

## 📂 هيكلة المشروع
- `install.ps1`: سكريبت التثبيت الخاص بـ Windows PowerShell.
- `setup.sh`: سكريبت تحسين الأداء والإعداد الداخلي لنظام لينكس.
- `logo_red.txt`: شعار ASCII الملون باللون الأحمر.
- `LICENSE`: رخصة المشروع (MIT).

---
© 2026 Olemon Incorporation. All rights reserved.
