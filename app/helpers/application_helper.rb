module ApplicationHelper

def link_to_add_fields (name,f,association)
 new_object = f.object.send(association).klass.new
  id = new_object.object_id
 fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |f|
      render(association.to_s.singularize + "_fields", :f => f)
    
   link_to name, "#", :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"),  remote: true 
    end
   end
end
