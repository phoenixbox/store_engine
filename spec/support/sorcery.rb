module Sorcery
  module TestHelpers
    module Rails
      def login_user_post(user, password)
        page.driver.post(user_sessions_path, { username: user, password: password}) 
      end
    end
  end
end
