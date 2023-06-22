class ApiHelper {
  String getUserURL(String baseURL, String username) => '$baseURL$username';

  getUserRepoURL(String baseURL, String username) => '$baseURL$username\\repos';
}
