module VolleyMotion
  class ErrorListener
    def onErrorResponse(error)
      if error.toString == "com.android.volley.AuthFailureError"
        p "Authentication error"
      else
        p error.toString
      end

    end
  end
end
