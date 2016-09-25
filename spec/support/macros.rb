def drop_schemas
   connection = ActiveRecord::Base.connection.raw_connection
   schemas = connection.query(%(
     SELECT 'drop schema ' || nspname || ' cascade;'
     from pg_namespace
     where nspname != 'public'
     AND nspname NOT LIKE 'pg_%'
     AND nspname != 'information_schema';
   ))
   schemas.each do |query|
      connection.query(query.values.first)
   end
end
