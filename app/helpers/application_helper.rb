module ApplicationHelper
  def display_buttons
    buttons = []
    if logged_in?
      buttons.push(link_to(current_user.username, user_path(current_user),
                           class: 'text-dark mr-2 bg-warning py-1 px-2'))
      buttons.push(link_to('Create Event', new_event_path,
                           class: 'text-dark mr-2 bg-warning py-1 px-2'))
      buttons.push(link_to('Logout', logout_path, method: :delete,
                                                  class: 'text-dark mr-2 bg-warning py-1 px-2'))
    else
      buttons.push(link_to('Login', login_path,
                           class: 'text-dark  mr-2 bg-warning py-1 px-2'))
      buttons.push(link_to('Sign Up', new_user_path,
                           class: 'text-dark mr-2 bg-warning py-1 px-2 btn-link'))
    end
    buttons
  end

  def user_attending?(event_id)
    buttons = []
    if events_created.find_by(id: :event_id)
      buttons.push(link_to('Register',
                           attendances_path(controller: 'attendances', action: 'create',
                                            event_id: event_id), method: :post, class: 'btn btn-dark'))
      buttons.push(link_to('cancel', attendance_path(event_id), method: :delete,
                                                                class: 'btn btn-danger mt-1'))
    else
      buttons.push(link_to('Register',
                           attendances_path(controller: 'invites', action: 'create',
                                            event_id: event_id), method: :post, class: 'btn btn-dark'))
      buttons.push(link_to('Cancel', attendance_path(event_id), method: :delete,
                                                                class: 'btn btn-danger mt-1'))
    end
    buttons
  end
end
