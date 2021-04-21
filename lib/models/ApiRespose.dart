class ApiResponse {
  // _data will hold any response converted into 
  // its own object. For example user.
  Object _data; 
  // _apiError will hold the error object
  Object _apiError;

  Object get Data => _data;
  set Data(Object data) => _data = data;

  Object get ApiError => _apiError as Object;
  set ApiError(Object error) => _apiError = error;
}