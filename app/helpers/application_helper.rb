module ApplicationHelper
   def flash_class(type)
    case type.to_sym
    when :notice then "bg-green-500"
    when :alert then "bg-red-500"
    when :error then "bg-red-600"
    when :success then "bg-green-600"
    else "bg-gray-500"
    end
  end
end
