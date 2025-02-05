class ExercismApp < Sinatra::Base

  post '/user/:trail/start' do |language|
    begin
      Launch.new(current_user, language).start
      if current_user.submissions.count == 0
        redirect '/account'
      else
        redirect '/'
      end
    rescue
      halt 400, "Language #{language} is not supported at this time."
    end
  end

end
