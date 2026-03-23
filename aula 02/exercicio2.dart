void main() {
  // Chamadas da função 
  cadastrarFuncionario(nome: "Nicoly", cargo: "Assistente");
  cadastrarFuncionario(nome: "Carlos");
  cadastrarFuncionario(nome: "Ana", cargo: "Analista");

}

// Função com parâmetros 
void cadastrarFuncionario({required String nome, String? cargo}) {

  // Verifica se o cargo foi informado
  if (cargo != null) {
    print("Bem-vinda(o), $nome! Seu cargo é $cargo.");
  } else {
    print("Bem-vinda(o), $nome!");
  }
}
