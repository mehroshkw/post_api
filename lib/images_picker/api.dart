import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Review {
  static Future<void> submitReview({
    String? extraFile,
    String? audioFile,
    List<String>? flower,
    String? ocrResult,
    String? qrResult,
    String? experience,
    String? size,
    String? looksRatting,
    String? smellRatings,
    String? product_title,
    String? product_description,
    String? product_id,
    String? user_id,
  }) async {
    var response = await postMultiPartJson(
      url: "https://btrlaravel.stepinnsolution.com/api/submit_app_reviews",
      body: {
        'ocrResult': ocrResult!,
        'qrResult': qrResult!,
        'experience': experience!,
        'looksRatting': looksRatting!,
        'size': size!,
        'smellRatings': smellRatings!,
        'product_title': product_title!,
        'product_description': product_description!,
        'product_id': product_id!,
        'user_id': user_id!
      },
      extraFile: extraFile,
      audioFile: audioFile,
      flowerScan: flower,
      );
     
  print("Response is == ${response.body}");
  }
  static Future<Response> postMultiPartJson(
    {
      Map<String, String>? body,
      String? extraFile,
      String? audioFile,
      List<String>? flowerScan,
      required String url
    }) async{
      var headers = {"Content-Type": "application/json"};
      var request = http. MultipartRequest("POST", Uri.parse(url));
      request.fields.addAll(body!);
      if(extraFile != null ){
        request.files.add(await http.MultipartFile.fromPath("extraFile", extraFile));
      }
      if(audioFile != null){
        request.files.add(await http.MultipartFile.fromPath("audioFile", audioFile));
      }

      for (var item in flowerScan!){
        request.files.add(await http.MultipartFile.fromPath('flowerScan[]', item));
      }
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      return await http.Response.fromStream(response);

    }
}
