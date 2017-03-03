ActiveRecord::Schema.define(:version => 1) do
  create_table :users, id: :string  do |t|
    t.string :oid
  end
end
