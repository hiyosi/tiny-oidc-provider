module OIDC
   module ErrorResponse

    def error_response_type
      {
        :error => 'invalid_request',
        :error_description => 'invalid response_type'
      }
    end

    def error_redirect_uri
      {
        :error => 'invalid_request',
        :error_description => 'invalid redirect_uri'
      }
    end

    def error_scope
      {
        :error => 'invalid_scope',
        :error_description => 'invalid scope'
      }
    end

    def error_state
      {
        :error => 'invalid_request',
        :error_description => 'state parameter is required'
      }
    end

    def error_nonce
      {
        :error => 'invalid_request',
        :error_description => 'nonce parameter is required'
      }
    end
  end
end
