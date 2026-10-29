import '../../domain/models/carro.dart';

/// Fonte dos dados do catálogo.
/// Os valores abaixo são ilustrativos (didáticos), não preços oficiais.
class CarroRepository {
  const CarroRepository();

  List<Carro> buscarTodos() => _carros;

  static const List<Carro> _carros = [
    Carro(
      id: 1,
      marca: 'Fiat',
      modelo: 'Mobi',
      ano: 2025,
      preco: 72000,
      categoria: 'Hatch compacto',
      combustivel: 'Flex',
      potenciaCv: 75,
      imagemAsset: 'images/carros/fiat_mobi.jpg',
      descricao:
          'Compacto pensado para a cidade: fácil de estacionar, econômico e com custo de manutenção baixo. Boa opção para quem busca o primeiro carro.',
    ),
    Carro(
      id: 2,
      marca: 'Chevrolet',
      modelo: 'Onix',
      ano: 2025,
      preco: 98000,
      categoria: 'Hatch',
      combustivel: 'Flex',
      potenciaCv: 116,
      imagemAsset: 'images/carros/chevrolet_onix.jpg',
      descricao:
          'Hatch equilibrado entre preço, conforto e tecnologia. Costuma estar entre os modelos mais vendidos do país.',
    ),
    Carro(
      id: 3,
      marca: 'Hyundai',
      modelo: 'HB20',
      ano: 2025,
      preco: 99000,
      categoria: 'Hatch',
      combustivel: 'Flex',
      potenciaCv: 120,
      imagemAsset: 'images/carros/hyundai_hb20.jpg',
      descricao:
          'Hatch com visual moderno e bom pacote de equipamentos, indicado para uso urbano e para viagens curtas.',
    ),
    Carro(
      id: 4,
      marca: 'Volkswagen',
      modelo: 'Polo',
      ano: 2025,
      preco: 105000,
      categoria: 'Hatch',
      combustivel: 'Flex',
      potenciaCv: 128,
      imagemAsset: 'images/carros/volkswagen_polo.jpg',
      descricao:
          'Acabamento caprichado e boa estabilidade na estrada. Motor turbo entrega retomadas rápidas com consumo moderado.',
    ),
    Carro(
      id: 5,
      marca: 'Toyota',
      modelo: 'Corolla',
      ano: 2025,
      preco: 170000,
      categoria: 'Sedã médio',
      combustivel: 'Híbrido',
      potenciaCv: 122,
      imagemAsset: 'images/carros/toyota_corolla.jpg',
      descricao:
          'Sedã confortável e conhecido pela durabilidade. A versão híbrida combina motor a combustão e elétrico para gastar menos.',
    ),
    Carro(
      id: 6,
      marca: 'Honda',
      modelo: 'Civic',
      ano: 2025,
      preco: 175000,
      categoria: 'Sedã médio',
      combustivel: 'Flex',
      potenciaCv: 155,
      imagemAsset: 'images/carros/honda_civic.jpg',
      descricao:
          'Sedã esportivo no visual e no comportamento, com cabine espaçosa e bom nível de segurança.',
    ),
    Carro(
      id: 7,
      marca: 'Jeep',
      modelo: 'Compass',
      ano: 2025,
      preco: 190000,
      categoria: 'SUV',
      combustivel: 'Flex',
      potenciaCv: 185,
      imagemAsset: 'images/carros/jeep_compass.jpg',
      descricao:
          'SUV médio com posição de dirigir elevada, bom espaço interno e porte ideal para família e viagens.',
    ),
    Carro(
      id: 8,
      marca: 'BYD',
      modelo: 'Dolphin',
      ano: 2025,
      preco: 150000,
      categoria: 'Hatch elétrico',
      combustivel: 'Elétrico',
      potenciaCv: 130,
      imagemAsset: 'images/carros/byd_dolphin.jpg',
      descricao:
          'Hatch 100% elétrico: silencioso, sem gastos com combustível e com recarga em tomada ou carregador dedicado.',
    ),
  ];
}
