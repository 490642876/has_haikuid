require "has_haikuid/version"
require 'active_record'

module ActiveRecord
  module HasHaikuid
    extend ActiveSupport::Concern

    module ClassMethods

      def has_haikuid(attribute = :id, token_range: 9999, delimiter: "-")
        require 'haikunator'
        before_create do
          unless self.send("#{attribute}?")
            begin
              retries ||= 0
              haikuid = self.class.generate_haikuid(token_range, delimiter)
              raise "repeat" if self.class.exists?(attribute.to_sym => haikuid)
              self.send("#{attribute}=", haikuid)
            rescue
              retry if (retries += 1) < 3
            end
          end
        end
      end

      def generate_haikuid(token_range = 9999, delimiter = '-')
        Haikunator.haikunate(token_range, delimiter)
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::HasHaikuid)
