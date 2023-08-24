// class AcaraRepository {
//   final ApiService _apiService;

//   AcaraRepository(this._apiService);

//   Future getAllEvent() async {
//     var result = await _apiService.get(
//       endpoint: 'events/all',
//       requiresAuthToken: true,
//     );

//     // AcaraModel acaraModel = AcaraModel.fromJson(res);
//     // var response2 = acaraModel.data;

//     // List<DataAcara> result = response2.result;

//     return result;
//   }
// }