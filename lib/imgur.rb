module Imgur
  API_URL = 'https://api.imgur.com/3/image'

  CLIENT_ID = ENV.fetch('IMGUR_CLIENT_ID')
  SECRET = ENV.fetch('IMGUR_CLIENT_SECRET')

  class << Imgur
    def upload(filename)
      File.open("../#{filename}", &method(:upload_internal))
    end

    private

    def upload_internal(file)
      
    end

    def authorization
      ""
    end
  end
end