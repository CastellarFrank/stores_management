json.array! @stores do |store|
  json.name 		  store.name
  json.address    store.address
  json.manager	  store.manager_name
  json.telephone	store.telephone

  json.groups store.groups do |group|
    json.name 	  group.name
    json.location group.location
    json.type		  group.type
  end
end