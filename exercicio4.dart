class Laptop {
  int id;
  String nome;
  int ram;
  double clockCpu;

  // Construtor padrão
  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  // Named constructor - para navegação na internet
  Laptop.internet(this.id)
      : nome = "Laptop Básico",
        ram = 4,
        clockCpu = 2.0;

  // Named constructor - para escritório
  Laptop.escritorio(this.id)
      : nome = "Laptop Escritório",
        ram = 8,
        clockCpu = 2.5;

  // Named constructor - para programação
  Laptop.programacao(this.id)
      : nome = "Laptop Programador",
        ram = 16,
        clockCpu = 3.2;

  String info() {
    return "Id: $id\nNome: $nome\nRAM: $ram GB\nClock CPU: $clockCpu GHz";
  }
}

void main() {
  // objetos usando named constructors
  Laptop laptopInternet = Laptop.internet(1);
  Laptop laptopEscritorio = Laptop.escritorio(2);
  Laptop laptopProgramacao = Laptop.programacao(3);

  // Imprimindo
  print("${laptopInternet.info()}\n");
  print("${laptopEscritorio.info()}\n");
  print("${laptopProgramacao.info()}\n");
}