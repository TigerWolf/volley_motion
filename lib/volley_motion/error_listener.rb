module VolleyMotion
  class ErrorListener

    class << self
      def build
        ErrorListener.new
        # error_listener = Com::Android::Volley::Response::ErrorListener.new
      end
    end

    def initialize
    end

    def onErrorResponse(error)
      if error.toString == "com.android.volley.AuthFailureError"
        p "Authentication error"
      else
        p error.toString
      end

    end
  end
end
