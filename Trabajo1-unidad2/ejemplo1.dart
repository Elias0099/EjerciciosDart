import 'dart:io';
import 'dart:math';

void main() {
  int cantidadZonas = 4;
  int cantidadCandidatos = 5;

  // Crear una lista de listas para almacenar los votos por zona y candidato
  List<List<int>> votosPorZona = List.generate(cantidadZonas, (_) => List.filled(cantidadCandidatos, 0));

  // Generar datos sintéticos para las votaciones en cada zona
  for (int zona = 0; zona < cantidadZonas; zona++) {
    for (int candidato = 0; candidato < cantidadCandidatos; candidato++) {
      votosPorZona[zona][candidato] = Random().nextInt(1000); // Genera números aleatorios entre 0 y 999
    }
  }

  // Mostrar los resultados de las votaciones por zona
  for (int zona = 0; zona < cantidadZonas; zona++) {
    print('Zona ${zona + 1}:');
    for (int candidato = 0; candidato < cantidadCandidatos; candidato++) {
      print('Candidato ${candidato + 1}: ${votosPorZona[zona][candidato]} votos');
    }
    print('');
  }

  while (true) {
    stdout.write('Seleccione una zona para agregar votos (1 - $cantidadZonas) o 0 para salir: ');
    int zonaSeleccionada = int.parse(stdin.readLineSync() ?? '0');
    
    if (zonaSeleccionada == 0) {
      break;
    } else if (zonaSeleccionada >= 1 && zonaSeleccionada <= cantidadZonas) {
      for (int candidato = 0; candidato < cantidadCandidatos; candidato++) {
        stdout.write('Ingrese los votos para el candidato ${candidato + 1} en la zona $zonaSeleccionada: ');
        votosPorZona[zonaSeleccionada - 1][candidato] = int.parse(stdin.readLineSync() ?? '0');
      }
    } else {
      print('Zona no válida. Seleccione una zona entre 1 y $cantidadZonas.');
    }
  }

  // Calcular los resultados totales por candidato
  List<int> resultadosTotales = List.filled(cantidadCandidatos, 0);

  for (int zona = 0; zona < cantidadZonas; zona++) {
    for (int candidato = 0; candidato < cantidadCandidatos; candidato++) {
      resultadosTotales[candidato] += votosPorZona[zona][candidato];
    }
  }

  // Mostrar los resultados totales en una tabla más grande
  print('Resultados Totales');
  print('----------------------------');
  print('| Candidato |    Votos     |');
  print('----------------------------');
  for (int candidato = 0; candidato < cantidadCandidatos; candidato++) {
    print('|   ${candidato + 1}       | ${resultadosTotales[candidato].toString().padLeft(10)}   |');
  }
  print('----------------------------');
}