import 'package:gerenciamento_financas_pessoais/models/conta.dart';
import 'package:gerenciamento_financas_pessoais/utils/utils_db.dart';

class ContaService {
  List<Conta> _contaList = [];

  void adicionarConta(Conta conta) {
    DbUtil.insereDados('conta', conta.toMap());
  }

  Future<List> listaTodasContas() async {
    final dataList = await DbUtil.pegaDados('conta');
    _contaList = dataList.map((contas) => Conta.fromMap(contas)).toList();
    return _contaList;
  }
}
