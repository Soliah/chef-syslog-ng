actions [:create, :delete]
default_action :create

property :name, kind_of: String, name_attribute: true, required: true
property :priority, kind_of: Integer, required: true
property :host, kind_of: String, required: true
property :port, kind_of: Integer, required: true
