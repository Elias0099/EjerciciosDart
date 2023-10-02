import 'dart:io';

void main() {
  String seguir = 'S';

  while (seguir == 'S' || seguir == 's') {
    stdout.write('\n\n\tPrograma que procesa factura de asesoría empleando vectores!');
    stdout.write('\n\t------------------------------------------------------------\n');
    sleep(Duration(milliseconds: 200));

    List<String> nom = List.filled(50, '');
    List<String> aseso = List.filled(50, '');
    String nome = '';
    String noma = '';
    int nusu, opc, men = 50000000, may = 0, sum = 0;
    List<int> nuse = List.filled(50, 0);
    List<int> cose = List.filled(50, 0);
    List<int> costo = List.filled(50, 0);
    double prom;

    stdout.write('\n\n\tDigite la cantidad de usuarios a procesar: ');
    sleep(Duration(milliseconds: 200));
    nusu = int.parse(stdin.readLineSync()!);

    while (nusu <= 0) {
      stdout.write('\n\n\tError. Digite la cantidad de usuarios a procesar: ');
      sleep(Duration(milliseconds: 200));
      nusu = int.parse(stdin.readLineSync()!);
    }

    stdout.write('\n\tProceso captura y procesamiento de datos');
    stdout.write('\n\t----------------------------------------');

    for (int j = 0; j < nusu; j++) {
      stdout.write('\n\tDigite el nombre del usuario: ${j + 1}\t');
      sleep(Duration(milliseconds: 200));
      nom[j] = stdin.readLineSync()!;
      stdout.write('\n\tIngrese el número de la asesoría del usuario\t${j + 1}');
      stdout.write('\n\t1.Financiera 2.Contable 3.Comercial 4:Inversión\t');
      sleep(Duration(milliseconds: 200));
      opc = int.parse(stdin.readLineSync()!);

      while (opc < 1 || opc > 4) {
        stdout.write('\n\tError. Ingrese el número de la asesoría del usuario ${j + 1}');
        stdout.write('\n\t1.Financiera 2.Contable 3.Comercial 4:Inversión\t');
        sleep(Duration(milliseconds: 500));
        opc = int.parse(stdin.readLineSync()!);
      }

      if (opc == 1) {
        aseso[j] = 'Financiera';
        cose[j] = 80000;
      } else if (opc == 2) {
        aseso[j] = 'Contable';
        cose[j] = 75000;
      } else if (opc == 3) {
        aseso[j] = 'Comercial';
        cose[j] = 50000;
      } else {
        aseso[j] = 'Inversión';
        cose[j] = 100000;
      }

      stdout.write('\n\tIngrese número de sesiones del usuario: ${j + 1}\t');
      sleep(Duration(milliseconds: 200));
      nuse[j] = int.parse(stdin.readLineSync()!);

      while (nuse[j] <= 0) {
        stdout.write('\n\tError. Ingrese número de sesiones del usuario: ${j + 1}\t');
        sleep(Duration(milliseconds: 200));
        nuse[j] = int.parse(stdin.readLineSync()!);
      }

      costo[j] = cose[j] * nuse[j];

      if (costo[j] < men) {
        men = costo[j];
        nome = nom[j];
      }
      if (costo[j] > may) {
        may = costo[j];
        noma = nom[j];
      }

      sum += costo[j];
    }

    prom = sum / nusu;
    stdout.write('\n\n\tPrograma que procesa factura de asesoría empleando vectores!');
    stdout.write('\n\t------------------------------------------------------------\n');
    sleep(Duration(milliseconds: 200));
    stdout.write('\n');
    stdout.write('\n\tImprimir datos de usuarios y resultados');
    stdout.write('\n\t---------------------------------------');
    stdout.write('\n\n');
    stdout.write('\n\tNo.\t Usuario \t Asesoría \t Sesiones\t Costo total');
    stdout.write('\n\t---\t-------------\t--------------\t--------\t-----------');

    for (int j = 0; j < nusu; j++) {
      stdout.write('\n\t${j + 1}\t ${nom[j]} \t\t ${aseso[j]}\t ${nuse[j]}\t\t${costo[j]}');
      sleep(Duration(milliseconds: 200));
    }

    stdout.write('\n\n');
    stdout.write('\n\tEstadísticas de costo sesiones');
    stdout.write('\n\t------------------------------');
    stdout.write('\n\tNúmero de usuarios procesados:\t$nusu');
    sleep(Duration(milliseconds: 500));
    stdout.write('\n\tUsuario con mayor costo total\t$noma con $may');
    sleep(Duration(milliseconds: 500));
    stdout.write('\n\tUsuario con menor costo total\t$nome con $men');
    sleep(Duration(milliseconds: 500));
    stdout.write('\n\tSumatoria del costo total \t$sum');
    sleep(Duration(milliseconds: 200));
    stdout.write('\n\tPromedio del costo total \t${prom.toStringAsFixed(2)}');

    stdout.write('\n\n');
    stdout.write('\n\tDesea procesar otro grupo de usuarios: S o N\t');
    sleep(Duration(milliseconds: 200));
    seguir = stdin.readLineSync()!;

    while (seguir != 'S' && seguir != 's' && seguir != 'N' && seguir != 'n') {
      stdout.write('\n\tError. Digite S o N\t');
      sleep(Duration(milliseconds: 200));
      seguir = stdin.readLineSync()!;
    }
  }

  stdout.write('\n\n\t');
  stdout.write('Presione Enter para salir...');
  stdin.readLineSync();
}
