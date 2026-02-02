# Flutter Challenge Mobile

Proyecto Flutter estructurado siguiendo principios de **Clean Architecture** y gestionado con **Riverpod** para la inyección de dependencias y manejo de estado.

## 🏛 Arquitectura

El proyecto está organizado en capas para asegurar separación de responsabilidades, escalabilidad y testabilidad:

- **Presentation Layer (`presentation/`)**: Contiene la UI (Widgets, Pages) y la lógica de estado (Providers/Notifiers de Riverpod).
- **Domain Layer (`domain/`)**: Define las entidades (Modelos puros) y las interfaces de los repositorios (Contratos). Es independiente de cualquier librería externa o implementación de datos.
- **Data Layer (`data/`)**: Implementa los repositorios (Repositorios concretos) y las fuentes de datos (Data Sources: API, Base de datos local). Se encarga de la serialización de datos (JSON to Dart).

### Tecnologías Clave:

- **Flutter & Riverpod**: Framework y gestión de estado.
- **Dio**: Cliente HTTP para peticiones a la API.
- **Pigeon**: Comunicación segura y tipada entre Flutter y Nativo (iOS/Android) para funcionalidades específicas como notificaciones locales.
- **GoRouter**: Gestión de rutas y navegación.

## 🐦 configuración de Pigeon (Nativo)

Este proyecto utiliza **Pigeon** para generar el código de puente (binding) para notificaciones nativas en iOS y Android.

El archivo de definición se encuentra en: `pigeons/messages.dart`.

### Generar código nativo

Si modificas el archivo `pigeons/messages.dart`, debes ejecutar el siguiente comando para regenerar los archivos de Swift y Kotlin:

```bash
dart run pigeon --input pigeons/messages.dart
```

Esto actualizará automáticamente:

- `lib/src/native_bridge/notification_api.g.dart` (Dart)
- `android/app/src/main/kotlin/com/maga/flutter_challenge_model/NotificationApi.g.kt` (Kotlin)
- `ios/Runner/NotificationApi.g.swift` (Swift)

> **Nota:** Después de generar el código, asegúrate de compilar el proyecto nativo (`flutter build ios` / `flutter build apk`) para verificar que las implementaciones en `AppDelegate.swift` y `MainActivity.kt` sigan cumpliendo con el protocolo generado.

## 🚀 Setup General

### Prerrequisitos

- Flutter SDK (Latest Stable)
- Java 17 (Requerido para Android Builds recientes)
- Xcode (Para iOS) & CocoaPods

### Instalación

1. **Clonar el repositorio** y navegar a la carpeta raíz.
2. **Instalar dependencias**:
    ```bash
    flutter pub get
    ```
3. **Generación de código Dart** (para freezed, json_serializable, riverpod_generator, etc.):
    ```bash
    dart run build_runner build -d
    ```
    o para mantenerlo escuchando cambios:
    ```bash
    dart run build_runner watch -d
    ```

### Ejecutar la App

- **Android**:
    ```bash
    flutter run -d android
    ```
- **iOS**:
    ```bash
    flutter run -d ios
    ```

### Utilización de IA

Me apoye en la creación de este proyecto con Gemini 3 pro para apoyarme con errores que surgían durante la creación del codigo para ahorrar tiempo y mejorar la calidad del codigo.

Utilice Stitch para la creación del diseño de la app y el logo con Gemini 3 pro.

Para la aplicación de Pigeon me apoye con Gemini para poder solventar algunos errores en ios como lo era mostrar la notificación aun cuando esta el app en pantalla y para solucionar un error que me impedia compilar el proyecto al no estar cargado en el runner el archivo generado por pigeon. en la sección de Android me ayudo para hacer la solictud del permiso de notificaciones.

Tambien me apoye con Gemini para la creación del README del proyecto.
