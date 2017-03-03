class User < ActiveRecord::Base
  has_haikuid
  has_haikuid :oid
end
