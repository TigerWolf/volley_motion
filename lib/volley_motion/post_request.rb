module VolleyMotion
  class PostRequest < Com::Android::Volley::Request

    def parseNetworkResponse(response)
      # p response
      result = response.data
      # p response.toString
      # s = Java::Lang::String.new(response.data)
      # p s
      # p response.result.toString
      return Com::Android::Volley::Response.success(response, Com::Android::Volley::Toolbox::HttpHeaderParser.parseCacheHeaders(response))
    end

    def deliverResponse(response)
      listener = getListener
      listener.onResponse(response)
    end

  end
end

