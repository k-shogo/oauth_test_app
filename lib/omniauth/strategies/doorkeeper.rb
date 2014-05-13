module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper

      option :client_options, {
        site: DOORKEEPER_APP_URL,
        authorize_path: "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          :email => raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/user.json').parsed
      end
    end
  end
end
