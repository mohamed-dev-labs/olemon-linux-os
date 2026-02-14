# 🍋 Olemon Linux OS

![Olemon Logo](logo.jpg)

**Olemon Linux OS** هو نظام تشغيل مبسط ومفتوح المصدر مبني على **Ubuntu**، مصمم خصيصاً لشركة **Olemon Incorporation**. يهدف النظام إلى توفير بيئة **Sandbox** معزولة، خفيفة جداً، وسريعة الأداء (CPU/GPU) للعمل عبر **WSL (Windows Subsystem for Linux)**.

---

### 🌐 الروابط الرسمية
- **الموقع الرسمي:** [https://olemon.lovable.app/](https://olemon.lovable.app/)
- **التواصل (X):** [x.com/OlemonCLI](https://x.com/OlemonCLI)

---

### 🤖 Deep Inspire AI Agent
تم دمج معمارية **Deep Inspire AI Agent** (المبنية على Deep-Inspire-Robots-v2) بشكل كامل في نظام **Olemon Linux OS**. تتيح هذه الخاصية للمستخدمين الوصول إلى وكلاء ذكاء اصطناعي متطورين مباشرة من التيرمينال، مما يجعل Olemon OS أول نظام لينكس مخصص للاختبار مدعوم بذكاء اصطناعي متكامل.

---

## 🚀 المميزات
- **Deep Inspire AI:** وكيل ذكاء اصطناعي مدمج للتحليل والأتمتة.
- **شعار أحمر مميز:** يظهر الشعار الرسمي باللون الأحمر عند تشغيل التيرمينال.
- **خفيف جداً:** تم تجريد النظام من الإضافات غير الضرورية لضمان أقصى سرعة.
- **بيئة Sandbox:** معزول تماماً لاختبار الأدوات والأنظمة بأمان.
- **تكامل مع PowerShell:** يمكن تثبيته وتشغيله بضغطة واحدة من خلال Windows PowerShell.

## 🛠️ التثبيت السريع (PowerShell)

لفتح النظام وتثبيته مباشرة على جهازك، افتح **PowerShell** كمسؤول وقم بتشغيل الأمر التالي:

```powershell
irm https://raw.githubusercontent.com/mohamed-dev-labs/olemon-linux-os/master/install.ps1 | iex
```

## 💻 الإعداد الداخلي (داخل WSL)
بعد الدخول إلى النظام لأول مرة، قم بتشغيل الأمر التالي لتفعيل الشعار، الروابط، وخاصية Deep Inspire AI:
```bash
curl -s https://raw.githubusercontent.com/mohamed-dev-labs/olemon-linux-os/master/setup.sh | bash
```

## 📂 هيكلة المشروع
- `install.ps1`: سكريبت التثبيت الخاص بـ Windows PowerShell.
- `setup.sh`: سكريبت تحسين الأداء ودمج Deep Inspire AI.
- `logo_red.txt`: شعار ASCII الملون باللون الأحمر.
- `LICENSE`: رخصة المشروع (MIT).

---
© 2026 Olemon Incorporation. All rights reserved.
