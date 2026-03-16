class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);
}

void main() {
  List<House> casas = [];

  casas.add(House(1, "Casa Verde", 250000));
  casas.add(House(2, "Casa Azul", 320000));
  casas.add(House(3, "Casa Branca", 410000));

  // Cascade notation
  for (var casa in casas) {
    casa..name = "${casa.name} (Cadastrada)";
  }

  for (var casa in casas) {
    print("ID: ${casa.id}");
    print("Nome: ${casa.name}");
    print("Preço: ${casa.price}\n");
  }
}

/*
Obs: O exercício foi adaptado porque o DartPad não suporta a leitura
de dados pelo teclado usando stdin.readLineSync() (dart:io).
Como não foi possível instalar o VS Code no momento, os dados das casas
foram inseridos diretamente no código apenas para demonstrar o
funcionamento da classe, da lista e da cascade notation.
*/