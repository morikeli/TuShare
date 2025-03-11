import 'package:get/get.dart';
import 'package:ride_share/services/storage_service.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import '../models/ride.dart';


class RideService extends GetConnect  {
  final String apiUrl = ApiConstants.baseURL;

  @override
  void onInit() {
    httpClient.baseUrl = apiUrl;
    httpClient.timeout = const Duration(minutes: 3);
    super.onInit();
  }

  // Fetches available rides for a given destination
  Future<List<Ride>> getAvailableRides(String destination) async {
    final token = await StorageService.getUserInfo();     // Fetch saved token
    final response = await get('${ApiConstants.getRides}?destination=$destination', headers: {
      'Authorization': 'Bearer ${token["access_token"]}',
    });

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching rides");
    } else {
      return (response.body as List).map((ride) => Ride.fromJson(ride)).toList();
    }
  }
  
  // Fetches all rides booked by the current user
  Future<List<Ride>> getUserBookedRides() async {
    final token = await StorageService.getUserInfo();
    final response = await get(ApiConstants.bookedRides, headers: {
      'Authorization': 'Bearer ${token["access_token"]}',
    });

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching booked rides");
    } else {
      return (response.body as List).map((ride) => Ride.fromJson(ride)).toList();
    }
  }

  // Books a ride by sending a POST request
  Future<bool> bookRide(String rideId) async {
    final token = await StorageService.getUserInfo();
    final response = await post('${ApiConstants.bookRide}/$rideId/book', {}, headers: {
      'Authorization': 'Bearer ${token["access_token"]}',
    });

    return !response.status.hasError;
  }
}
