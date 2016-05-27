require 'thor'

module Qiitakun
  class CLI < Thor
    desc "list QIITA_TOKEN", "LIST items"
    option :qiita_token

    def list
      qiita = Qiitakun::Qiita.new(options[:qiita_token])

      qiita.items.each do |item|
        puts item
      end
    end
  end
end
