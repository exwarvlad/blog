module ApplicationHelper
  def modal_name
    if action_name == 'new' || action_name == 'create'
      'new'
    elsif action_name == 'edit' || action_name == 'update'
      'edit'
    else
      'modal'
    end
  end

  def edit_action?
    true ? action_name == 'edit' : false
  end
end
