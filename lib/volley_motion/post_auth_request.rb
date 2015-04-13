module VolleyMotion
  class PostAuthRequest < PostRequest

    def getHeaders
      headers = {}
      auth_string = @username + ":" + @password
      auth = "Basic " + convertTo64(auth_string)
      auth = Java::Lang::String.new(auth)
      headers[Java::Lang::String.new("Authorization")] = auth
      headers
    end

    def username=(username)
      @username = username
    end

    def password=(password)
      @password = password
    end

  end
end

