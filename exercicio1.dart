void main() {
  
  var nomeEquipamento = "Impressora 3D";
  String local = "Lab de Protótipos";
  // Declarando como dynamic 
  dynamic patrimonio = 12345;

  // Imprimindo valores iniciais
  print("Equipamento: $nomeEquipamento, Tipo: ${nomeEquipamento is String}");
  print("Local: $local, Tipo: ${local is String}");
  print("Patrimônio: $patrimonio, Tipo: ${patrimonio is int}");

  // Alterando o valor de patrimonio para String
  patrimonio = "12345-A";

  // Imprimindo após alteração
  print("Patrimônio (alterado): $patrimonio, Tipo: ${patrimonio is String}");

  /*
  Explicação:
 A variável 'patrimonio' é do tipo dynamic, funcionando como um camaleão,
 pois pode mudar de tipo conforme o valor que é atribuído a ela.

 Já a variável 'local' não é dynamic.
 Ela foi declarada como String, então seu tipo é fixo
 e não pode mudar para outro tipo durante o programa. 
  */
}