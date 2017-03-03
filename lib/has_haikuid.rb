require "has_haikuid/version"
require 'active_record'

module ActiveRecord
  module HasHaikuid
    extend ActiveSupport::Concern

    module ClassMethods

      def has_haikuid(attribute = :id)
        require 'haikunator'
        before_create { self.send("#{attribute}=", self.class.generate_haikuid) unless self.send("#{attribute}?")}
      end

      def generate_haikuid
        Haikunator.haikunate
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::HasHaikuid)
