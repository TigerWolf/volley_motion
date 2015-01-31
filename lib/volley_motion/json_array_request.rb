module VolleyMotion
  class JsonArrayRequest
    class << self
      def build(url, success_listener, error_listener)
        array_request = Com::Android::Volley::Toolbox::JsonArrayRequest.new(url, success_listener, error_listener)
      end
    end
  end
end
