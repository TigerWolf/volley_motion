module VolleyMotion
  class JsonObjectRequest < Com::Android::Volley::Toolbox::JsonObjectRequest
    class << self
      def build(url, success_listener, error_listener)
        array_request = Com::Android::Volley::Toolbox::JsonObjectRequest.new(url, nil, success_listener, error_listener)
      end
    end
  end
end
