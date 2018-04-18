json.extract! trip, :id, :time_in, :time_out, :plane_id, :airport_from, :{, :to_table, :, :}}, :airport_to, :{, :to_table, :, :}}, :created_at, :updated_at
json.url trip_url(trip, format: :json)
