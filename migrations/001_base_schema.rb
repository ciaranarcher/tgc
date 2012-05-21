# migrations/001_base_schema.rb

Sequel.migration do
  up do
    create_table(:files) do
      primary_key :id
      String      :secret_token,          :size => 500, :null => false
      String      :publisher_name, :size => 500, :null => false
      String      :email,          :size => 500, :null => false
      String      :file_name,      :size => 500, :null => false
      DateTime    :created_at,                   :null => false
      DateTime    :used_at                      
    end
  end

  down do
    drop_table(:files)
  end
end