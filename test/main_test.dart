import 'package:flutter_test/flutter_test.dart';
import 'package:sos_mascotas/vistamodelo/reportes/reporte_vm.dart';

void main() {
  group('📌 ReporteMascotaVM - pruebas unitarias', () {
    late ReporteMascotaVM vm;

    setUp(() {
      vm = ReporteMascotaVM();
    });

    // 1️⃣ PRUEBA: Cambiar paso manualmente
    test('✔ setPaso cambia correctamente el paso', () {
      vm.setPaso(1);
      expect(vm.paso, 1);

      vm.setPaso(2);
      expect(vm.paso, 2);
    });

    // 2️⃣ PRUEBA: Avanzar y retroceder pasos
    test('✔ siguientePaso y pasoAnterior funcionan correctamente', () {
      // Estado inicial
      expect(vm.paso, 0);

      vm.siguientePaso();
      expect(vm.paso, 1);

      vm.siguientePaso();
      expect(vm.paso, 2);

      vm.pasoAnterior();
      expect(vm.paso, 1);
    });

    // 3️⃣ PRUEBA: Agregar fotos y videos modifica el modelo
    test('✔ agregarFoto y agregarVideo actualizan las listas', () {
      vm.agregarFoto("https://example.com/foto1.jpg");
      vm.agregarFoto("https://example.com/foto2.jpg");

      expect(vm.fotos.length, 2);
      expect(vm.fotos.first, contains("foto1"));

      vm.agregarVideo("https://example.com/video1.mp4");
      expect(vm.videos.length, 1);
      expect(vm.videos.first, contains("video1"));
    });
  });
}
