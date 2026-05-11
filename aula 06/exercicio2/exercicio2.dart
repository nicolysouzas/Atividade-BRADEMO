Exercício: Pratique lidar com erros
#
O exercício a seguir oferece prática no tratamento de erros em código assíncrono, utilizando a abordagem descrita na seção anterior. Para simular operações assíncronas, seu código chamará a seguinte função, que já está fornecida:

Função	Assinatura de tipo	Descrição
buscarNovoNomeDeUsuário()	Future<String> fetchNewUsername()	Retorna o novo nome de usuário que você pode usar para substituir o antigo.
Utilize `async` asynce ` awaitasync` para implementar uma changeUsername() função assíncrona que faça o seguinte:

Chama a função assíncrona fornecida fetchNewUsername() e retorna o resultado.
Exemplo de valor de retorno de changeUsername():"jane_smith_92"
Captura qualquer erro que ocorra e retorna o valor da string correspondente ao erro.
Você pode usar o método toString() para converter tanto exceções quanto erros em strings.

// TODO: Implement changeUsername here.
changeUsername() {}

// The following function is provided to you to simulate
// an asynchronous operation that could take a while and
// potentially throw an exception.

Future<String> fetchNewUsername() =>
    Future.delayed(const Duration(milliseconds: 500), () => throw UserError());

class UserError implements Exception {
  @override
  String toString() => 'New username is invalid';
}

// The following code is used to test and provide feedback on your solution.
// There is no need to read or modify it.

void main() async {
  final List<String> messages = [];
  const typoMessage = 'Test failed! Check for typos in your return value';

  print('Testing...');
  try {
    messages
      ..add(_makeReadable(
          testLabel: '',
          testResult: await _asyncDidCatchException(changeUsername),
          readableErrors: {
            typoMessage: typoMessage,
            _noCatch:
                'Did you remember to call fetchNewUsername within a try/catch block?',
          }))
      ..add(_makeReadable(
          testLabel: '',
          testResult: await _asyncErrorEquals(changeUsername),
          readableErrors: {
            typoMessage: typoMessage,
            _noCatch:
                'Did you remember to call fetchNewUsername within a try/catch block?',
          }))
      ..removeWhere((m) => m.contains(_passed))
      ..toList();

    if (messages.isEmpty) {
      print('Success. All tests passed!');
    } else {
      messages.forEach(print);
    }
  } catch (e) {
    print('Tried to run solution, but received an exception: $e');
  }
}

// Test helpers.
String _makeReadable({
  required String testResult,
  required Map<String, String> readableErrors,
  required String testLabel,
}) {
  if (readableErrors.containsKey(testResult)) {
    final readable = readableErrors[testResult];
    return '$testLabel $readable';
  } else {
    return '$testLabel $testResult';
  }
}

Future<String> _asyncErrorEquals(Function fn) async {
  final result = await fn();
  if (result == UserError().toString()) {
    return _passed;
  } else {
    return 'Test failed! Did you stringify and return the caught error?';
  }
}

Future<String> _asyncDidCatchException(Function fn) async {
  var caught = true;
  try {
    await fn();
  } on UserError catch (_) {
    caught = false;
  }

  if (caught == false) {
    return _noCatch;
  } else {
    return _passed;
  }
}

const _passed = 'PASSED';
const _noCatch = 'NO_CATCH';




dica:Implemente a função changeUsernamepara retornar a string fetchNewUsernameou, caso isso falhe, o valor da string de qualquer erro que ocorra.

Lembre-se: você pode usar uma instrução try-catch para capturar e tratar erros.





Solução:

Future<String> changeUsername() async {
  try {
    return await fetchNewUsername();
  } catch (err) {
    return err.toString();
  }
}






adicione a solução ao código e me fale como deve ser a saída 