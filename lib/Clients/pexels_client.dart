import 'dart:convert';
import 'dart:io';

class PexelsClient {
  static final String apiKey =
      '563492ad6f917000010000012ee71721a21345448922c8032f434d5b';

  static Future<Map> _getData(String url) async {
    HttpClient client = new HttpClient();
    var req = await client.getUrl(Uri.parse(url));
    req.headers.add('Authorization', apiKey);
    var resp = await req.close();
    Map data;
    if (resp.statusCode == 200) {
      data = await resp.transform(utf8.decoder).transform(json.decoder).first;
    }

    return data;
  }

  Future<List> loadData(int page) async {
    //get photos
    Map photos = await _getData(
        'https://api.pexels.com/v1/curated?page=$page&per_page=80');

    //get videos
    Map videos = await _getData(
        'https://api.pexels.com/videos/popular?page=$page&per_page=80');

    // merge and shuffle
    List mediaData = photos['photos'] + videos['videos'];
    mediaData.shuffle();
    return mediaData;
  }
}
