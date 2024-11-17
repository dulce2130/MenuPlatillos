import 'dart:io';

void main() {
  var platillos = {
    "Mole": 100.00,
    "Hamburguesa": 50.00,
    "Hotdog": 30.00,
    "Enchiladas": 40.00,
    "Chilaquiles": 40.00,
    "Empanada": 25.00,
    "Sopes": 25.00,
    "Tortas": 30.00
  };

  var choose = true;

  while (choose) {
    print("======== MENU DEL DIA ========");
    platillos.forEach((key, value) => print("Platillo: $key, Precio: $value"));

    print("\n------- OPCIONES ------");
    print("""
1. Buscar platillo.
2. Actualizar precio de un producto.
3. Salir.
Elige una opcion: 
 """);
    String? opcion = stdin.readLineSync();
    int? op = int.tryParse(opcion ?? '');

    switch (op) {
      case 1:
        print("Escribe el nombre de un platillo: ");
        String? platillo = stdin.readLineSync();
        List resultado = buscarPlatillo(platillos, platillo);

        if (resultado[0] != "null") {
          print("El platillo ${resultado[0]} existe y su precio es \$${resultado[1]} \n");
        } else {
          print("Lo sentimos, no tenemos ese platillo.\n");
        }
        break;

      case 2:
        print("Escribe el nombre de un platillo: ");
        String? platillo = stdin.readLineSync();

        print("Escribe el precio a actualizar: ");
        String? pre = stdin.readLineSync();
        double? precio = double.tryParse(pre ?? '');

        actualizarPrecio(platillos, platillo, precio);
        break;

      case 3:
        print("Vuelve pronto :)");
        choose = false;
      default:
        print("Opción no válida. Busca un platillo: ");
    }
  }
}

List buscarPlatillo(Map platillos, String? platillo) {
  for (var entry in platillos.entries) {
    if (entry.key.toLowerCase() == platillo?.toLowerCase()) {
      return [
        entry.key,
        entry.value
      ];
    }
  }
  return [
    "null",
    0.0
  ];
}

void actualizarPrecio(Map platillos, String? platillo, double? precio) {
  var platilloBuscado = buscarPlatillo(platillos, platillo);

  if (platilloBuscado[0] != "null") {
    platillos[platilloBuscado[0]] = precio;
    print("Platillo actualizado con éxito");
  } else {
    print("Platillo no encontrado");
  }
}
