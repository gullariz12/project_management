# frozen_string_literal: true

module TasksHelper
  def priority_color(priority)
    case priority
    when Task::PRIORITIES[:low] then 'text-teal-100'
    when Task::PRIORITIES[:urgent] then 'text-red-500'
    when Task::PRIORITIES[:high] then 'text-yellow-300'
    when Task::PRIORITIES[:normal] then 'text-blue-300'
    end
  end
end
