module VolleyMotion
  class ErrorListener

    attr_accessor :activity

    def initialize(activity)
      @activity = activity
    end

    def onErrorResponse(error)
      error_result = { :error => :network_error, :message => "Network error."}
      case error.class.toString
      when "class com.android.volley.AuthFailureError"
        error_result = { :error => :auth_failure, :message => "Authentication Failure."}
      when "class com.android.volley.NoConnectionError"
        error_result = { :error => :no_connection, :message => "No connection."}
      end
      @activity.error_response(error_result)
    end

  end
end
