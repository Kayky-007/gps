import 'package:geolocator/geolocator.dart';
import 'package:gps_oncoto/model/localizacao_model.dart';

class HomeController {
  Position? localizacao;
String resultado = "";
double latitude = 0, longitude = 0;
bool mapa_visivel = false;
bool carregando = false;

  Future<Position> obterlocalizacao() async{
    return await LocalizacaoModel.determinePosition();
  }
}