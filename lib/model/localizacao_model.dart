import 'package:geolocator/geolocator.dart';

class LocalizacaoModel{
/// Determina a posição atual do dispositivo.
///
/// Quando os serviços de localização não estão habilitados ou as permissões
/// são negadas, o `Future` retornará um erro.
static Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Testa se os serviços de localização estão habilitados.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Os serviços de localização não estão habilitados, não continue
    // acessando a posição e solicite que os usuários do App habilitem
    // os serviços de localização.
    return Future.error('Serviços de localização estão desabilitados.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // As permissões são negadas, na próxima vez você pode tentar
      // solicitar permissões novamente (este é o local onde
      // shouldShowRequestPermissionRationale do Android retorna true.
      // De acordo com as diretrizes do Android, seu App deve exibir uma
      // interface explicativa agora.
      return Future.error('Permissões de localização são negadas');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // As permissões são negadas permanentemente, trate adequadamente.
    return Future.error(
      'Permissões de localização são permanentemente negadas, não podemos solicitar permissões.');
  }

  // Quando chegamos aqui, as permissões são concedidas e podemos
  // continuar acessando a posição do dispositivo.
  return await Geolocator.getCurrentPosition();
}
}