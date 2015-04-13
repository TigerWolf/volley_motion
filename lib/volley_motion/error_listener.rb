module VolleyMotion
  class ErrorListener

    attr_accessor :activity

    def initialize(activity)
      @activity = activity
    end

    def onErrorResponse(error)
      error_result = { :error => :network_error, :message => "Network error."}
      p error.class.toString
      case error.class.toString
      when "class com.android.volley.AuthFailureError"
        error_result = { :error => :auth_failure, :message => "Authentication Failure."}
      when "class com.android.volley.NetworkError"
        error_result = { :error => :auth_failure, :message => "Network error."}
      when "class com.android.volley.NoConnectionError"
        error_result = { :error => :no_connection, :message => "No connection."}
      when "class com.android.volley.ParseError"
        error_result = { :error => :no_connection, :message => "Invalid server response."}
      when "class com.android.volley.TimeoutError"
        error_result = { :error => :timeout, :message => "Connection timed out."}
      when "class com.android.volley.ServerError"
        error_result = { :error => :timeout, :message => "Server error."}
      when "class com.android.volley.VolleyError"
        error_result = { :error => :volley, :message => "Network error."}
      end
      @activity.error_response(error_result)
    end

  end
end
