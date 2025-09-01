# TV Browser Example (Flutter)

Proyecto demo minimalista orientado a Android TV (compatible con Android 14/15). 
Incluye configuración básica de Android para que el APK pueda instalarse en dispositivos TV (incluye LAUNCHER + LEANBACK_LAUNCHER).

Pasos para compilar localmente:
1. Instala Flutter y Android SDK.
2. Desde la raíz del proyecto:
   ```bash
   flutter pub get
   flutter clean
   flutter build apk --release --target-platform=android-arm,android-arm64
   ```

Para Codemagic: incluye un `codemagic.yaml` ejemplo en la raíz que muestra un workflow simple.