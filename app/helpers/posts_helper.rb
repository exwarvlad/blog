module PostsHelper
  def check_action
    if action_name == 'new'
      'create'
    elsif
      action_name == 'edit'
      'update'
    end
  end
end
