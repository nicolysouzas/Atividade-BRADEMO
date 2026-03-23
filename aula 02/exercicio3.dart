class Laptop {
  int id;
  String nome;
  int ram;
  double clockCpu;

  // Construtor
  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  String info() {
    return "Id: $id\nNome: $nome\nRAM: $ram GB\nClock CPU: $clockCpu GHz";
  }
}

void main() {
  Laptop macbook = Laptop(1, "MacBook Pro", 16, 3.2);
  Laptop asus = Laptop(2, "Asus VivoBook", 8, 2.8);
  Laptop samsung = Laptop(3, "Samsung Book", 12, 3.0);

  print("${macbook.info()}\n");
  print("${asus.info()}\n");
  print("${samsung.info()}\n");
}