class Uuid < ActiveRecord::Migration[5.2]
  def change
    # SELECT uuid_generate_v4(); for uuid generations
    execute 'CREATE EXTENSION "uuid-ossp";'
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'
  end
end
