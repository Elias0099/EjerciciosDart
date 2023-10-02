import 'dart:io';

void main() {
  stdout.write('\n\nPrograma que registra el inventario de n artículos');
  stdout.write('\n-------------------------------------------------\n');
  stdout.write('\nElija una opción:');
  stdout.write('\n1. Ingresar datos manualmente');
  stdout.write('\n2. Usar datos estáticos');
  stdout.write('\nIngrese el número de la opción deseada (1 o 2): ');

  var opcion = stdin.readLineSync() ?? '';
  while (opcion != '1' && opcion != '2') {
    stdout.write('Error. Ingrese 1 o 2: ');
    opcion = stdin.readLineSync() ?? '';
  }

  if (opcion == '1') {
    ingresarManualmente();
  } else {
    usarDatosEstaticos();
  }
}

void ingresarManualmente() {
  var seguir = 'S';

  while (seguir == 'S' || seguir == 's') {
    stdout.write('\n\nPrograma que registra el inventario de n artículos');
    stdout.write('\n-------------------------------------------------\n');
    stdout.write('\nDigite la cantidad de artículos a procesar: ');

    var nArticulos = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    while (nArticulos <= 0) {
      stdout.write('Error. Ingrese una cantidad válida: ');
      nArticulos = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    }

    var inventario = List.generate(nArticulos, (_) => List<int>.filled(7, 0));

    captura(inventario);
    calculaSaldoYValorVenta(inventario);
    imprime(inventario);

    stdout.write('\n¿Desea ingresar otro grupo de artículos? (S/N): ');
    seguir = stdin.readLineSync() ?? '';
    while (seguir != 'S' && seguir != 's' && seguir != 'N' && seguir != 'n') {
      stdout.write('Error. Digite S o N: ');
      seguir = stdin.readLineSync() ?? '';
    }
  }
}

void usarDatosEstaticos() {
  var seguir = 'S';

  while (seguir == 'S' || seguir == 's') {
    stdout.write('\n\nPrograma que registra el inventario de n artículos');
    stdout.write('\n-------------------------------------------------\n');
    var inventario = [
      [100, 50, 120000, 200900, 30, 20, 6000000],
      [110, 80, 45000, 90000, 50, 30, 4500000],
      [120, 100, 75000, 120000, 60, 40, 7200000],
      [130, 49, 250000, 420000, 25, 15, 10500000],
      [140, 50, 25000, 45000, 30, 20, 1350000],
      [150, 60, 35000, 55000, 30, 30, 1650000],
      [160, 90, 50000, 85000, 50, 40, 4250000],
      [170, 45, 150000, 240000, 30, 15, 7200000],
      [180, 40, 100000, 180000, 20, 20, 3600000],
      [190, 89, 140000, 250000, 50, 30, 12500000],
      [200, 70, 40000, 75000, 40, 30, 3000000],
      [210, 65, 115000, 200000, 35, 30, 4000000],
      [220, 25, 40000, 75000, 40, 35, 7000000],
      [230, 50, 200000, 350000, 20, 30, 2000000],
      [240, 30, 120000, 200090, 10, 20, 200000]
    ];

    calculaSaldoYValorVenta(inventario);
    imprime(inventario);

    stdout.write('\n¿Desea procesar otro grupo de artículos? (S/N): ');
    seguir = stdin.readLineSync() ?? '';
    while (seguir != 'S' && seguir != 's' && seguir != 'N' && seguir != 'n') {
      stdout.write('Error. Digite S o N: ');
      seguir = stdin.readLineSync() ?? '';
    }
  }
}

void captura(List<List<int>> inventario) {
  print('\nCaptura e ingreso de datos');
  for (var i = 0; i < inventario.length; i++) {
    stdout.write('\nIngrese los datos del artículo ${i + 1}');
    for (var j = 0; j < 5; j++) {
      var para = '';
      switch (j) {
        case 0:
          para = 'Código';
          break;
        case 1:
          para = 'Existencias';
          break;
        case 2:
          para = 'Costo';
          break;
        case 3:
          para = 'Precio';
          break;
        case 4:
          para = 'Unidades Vendidas';
          break;
      }
      stdout.write('\nIngrese $para: ');
      inventario[i][j] = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
      while (inventario[i][j] <= 0) {
        stdout.write('Error. Ingrese $para: ');
        inventario[i][j] = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
      }
    }
  }
}

void calculaSaldoYValorVenta(List<List<int>> inventario) {
  for (var i = 0; i < inventario.length; i++) {
    inventario[i][5] = inventario[i][1] * inventario[i][2]; // Saldo
    inventario[i][6] = inventario[i][4] * inventario[i][3]; // Valor de Venta
  }
}

void imprime(List<List<int>> inventario) {
  print('\nImprimir datos de registro, resultados y estadísticas');
  print('------\t------\t-----\t------\t------\t------\t---------------');
  print('Código\t|Stock\t|Costo\t|Precio\t|Ventas\t|Saldo\t|Valor venta|');
  print('------\t------\t-----\t------\t------\t------\t---------------');
  for (var i = 0; i < inventario.length; i++) {
    for (var j = 0; j < 7; j++) {
      stdout.write('${inventario[i][j]}\t');
    }
    print('');
  }

  // Calcular sumas y promedio
  var sumSaldo = 0;
  var sumValorVenta = 0;
  var promedio = 0.0;
  for (var i = 0; i < inventario.length; i++) {
    sumSaldo += inventario[i][5];
    sumValorVenta += inventario[i][6];
  }
  if (inventario.length > 0) {
    promedio = sumSaldo / inventario.length;
  }

  // Imprimir estadísticas
  print('\nSumas:');
  print('Saldo total: $sumSaldo');
  print('Valor de venta total: $sumValorVenta');
  print('Promedio de Saldo: $promedio');
}
