module VolleyMotion
  class PostRequest < Com::Android::Volley::Request

    def parseNetworkResponse(response)
      jsonString = response.data
      return Com::Android::Volley::Response.success(jsonString, Com::Android::Volley::Toolbox::HttpHeaderParser.parseCacheHeaders(response))
    end

    def deliverResponse(response)
      listener = getListener
      listener.onResponse(response)
    end

  end
end

