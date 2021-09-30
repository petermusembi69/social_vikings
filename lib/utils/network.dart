part of social_utils;

class NetworkUtil {
  factory NetworkUtil() => _networkUtil;
  NetworkUtil.internal();
  static final NetworkUtil _networkUtil = NetworkUtil.internal();

  static String? _getBearerToken() {
    return locator<HiveService>().retrieveToken();
  }

  Future<Map<String, dynamic>> httpPostReq(
    String url, {
    required String body,
  }) async {
    var reps = <String, dynamic>{};
    await http
        .post(
            Uri.parse(
                '${SocialAppConfig.instance!.values.baseDomain}/api/v1$url'),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader: 'Bearer ${_getBearerToken()}'
            },
            body: body)
        .then((response) {
      if (response.statusCode == 200) {
        reps = json.decode(response.body) as Map<String, dynamic>;
        return response.body;
      } else {
        reps = json.decode(response.body) as Map<String, dynamic>;
      }
    });
    return reps;
  }

  Future<Map<String, dynamic>> httpPutReq(
    String url, {
    required String body,
  }) async {
    var reps = <String, dynamic>{};
    await http
        .put(
            Uri.parse(
                '${SocialAppConfig.instance!.values.baseDomain}/api/v1$url'),
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.authorizationHeader: 'Bearer ${_getBearerToken()}'
            },
            body: body)
        .then((response) {
      if (response.statusCode == 200) {
        reps = json.decode(response.body) as Map<String, dynamic>;
        return response.body;
      } else {
        reps = json.decode(response.body) as Map<String, dynamic>;
      }
    });
    return reps;
  }

  Future<Map<String, dynamic>> httpDelReq(
    String url,
  ) async {
    var reps = <String, dynamic>{};
    await http.delete(
      Uri.parse('${SocialAppConfig.instance!.values.baseDomain}/api/v1$url'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${_getBearerToken()}'
      },
    ).then((response) {
      if (response.statusCode == 200) {
        reps = json.decode(response.body) as Map<String, dynamic>;
        return response.body;
      } else {
        reps = json.decode(response.body) as Map<String, dynamic>;
      }
    });
    return reps;
  }

  Future<Map<String, dynamic>> httpGetPlacesReq(
    String url,
  ) async {
    var reps = <String, dynamic>{};
    await http
        .get(
      Uri.parse(url),
    )
        .then((response) {
      if (response.statusCode == 200) {
        reps = json.decode(response.body) as Map<String, dynamic>;
        return response.body;
      } else {
        reps = json.decode(response.body) as Map<String, dynamic>;
      }
    });
    return reps;
  }

  Future<Map<String, dynamic>> httpGetReq(
    String url,
  ) async {
    var reps = <String, dynamic>{};
    await http.get(
      Uri.parse('${SocialAppConfig.instance!.values.baseDomain}/api/v1$url'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer ${_getBearerToken()}'},
    ).then((response) {
      if (response.statusCode == 200) {
        reps = json.decode(response.body) as Map<String, dynamic>;
        return response.body;
      } else {
        reps = json.decode(response.body) as Map<String, dynamic>;
      }
    });
    return reps;
  }

  Future<Map<String, dynamic>> httpGetWithParamsReq(
    String url, {
    Map<String, dynamic>? queryParams,
  }) async {
    var reps = <String, dynamic>{};
    final queryString = Uri(queryParameters: queryParams).query;
    await http.get(
      Uri.parse(
          '${SocialAppConfig.instance!.values.baseDomain}/api/v1$url?$queryString'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${_getBearerToken()}',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    ).then((response) {
      if (response.statusCode == 200) {
        reps = json.decode(response.body) as Map<String, dynamic>;
        return response.body;
      } else {
        reps = json.decode(response.body) as Map<String, dynamic>;
      }
    });
    return reps;
  }
}
