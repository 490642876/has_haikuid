class User < ActiveRecord::Base
  has_haikuid
  has_haikuid :oid, token_range: 999999
end
