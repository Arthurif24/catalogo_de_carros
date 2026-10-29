import '../../data/repositories/carro_repository.dart';
import '../models/carro.dart';

class ListarCarros {
  final CarroRepository repository;

  const ListarCarros({this.repository = const CarroRepository()});

  List<Carro> call() => List<Carro>.unmodifiable(repository.buscarTodos());
}
