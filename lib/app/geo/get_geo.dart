import 'package:customer_info/uitls/api_client.dart';

class GetGeo {
  static dynamic getDivisions() async {
    return await ApiClient.instance.get(url: 'divisions');
  }

  static dynamic getDistricts(int divisionId) async {
    return await ApiClient.instance.get(url: 'divisions/$divisionId');
  }

  static dynamic getUpazilas(int districtId) async {
    return await ApiClient.instance.get(url: 'districts/$districtId');
  }
}
