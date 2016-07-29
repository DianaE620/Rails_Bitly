module ApplicationHelper

  def ini_uri
    'http://sho.di/'
  end

  def current_user
    if session[:id]
      User.find(session[:id])
    end
  end

   # Regresa true si el current_user existe y false de otra manera 
  def logged_in?
    if current_user
      true
    else
      false
    end
  end
  
end
