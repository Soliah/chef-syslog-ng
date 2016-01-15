actions [:create, :delete]
default_action :create

property :name, kind_of: String, name_attribute: true, required: true
property :priority, kind_of: Integer, required: true
property :destination, kind_of: String, required: true
property :tags, kind_of: Array, required: true, default: []
