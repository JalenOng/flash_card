enable :session

def logged_in?
  if session[:user_id] == nil
    false
  else
    true
  end
end

def username
  @user = User.find(session[:user_id])
  @user.username
end
#ok
get '/' do
  # Look in app/views/index.erb

  erb :index
end

post '/logout' do

session.clear
redirect to '/'
end

get '/user/sign_up' do

erb :"/user/sign_up"
end

post '/user/sign_up' do

@user = User.new(params[:user])

if @user.save
  session[:user_id] = @user_id
  redirect to "/user/#{@user.id}"

else
  redirect to "/user/sign_up"
end

end

#ok
post '/login' do

  @result = User.authenticate(params[:user][:username], params[:user][:password])

  if @result == nil
    redirect to "/"
  else
    session[:user_id] = @result.id

    redirect to "/user/#{@result.id}"
  end

end
#ok
get '/user/:id' do
  @deck = Deck.all

  erb :"/user/show"
end
#ok
get '/deck/:deck_id' do

  @round = Round.create(deck_id: params[:deck_id], user_id: session[:user_id])
  @deck = Deck.find(params[:deck_id])

  @card = @deck.cards.sample(1)


  erb :"/deck/show"
end

post '/:deck_id/:round_id/:card_id' do

@card = Card.find(params[:card_id])
if @card.answer.downcase == params[:answer].downcase
    status = "correct"
else
    status = "wrong"
end

guess = Guess.create(card_id: @card.id, round_id: params[:round_id], status: status)

round = Round.find(params[:round_id])


if round.guesses.count < 5
redirect to "/#{params[:deck_id]}/#{round.id}/#{guess.id}/#{params[:card_id]}"
else
redirect to "/#{session[:user_id]}/stats"
end

end

get '/:deck_id/:round_id/:guess_id/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @round = Round.find(params[:round_id])
  @guess = Guess.find(params[:guess_id])
  @prev_card = Card.find(params[:card_id])
  @card = Card.sample_card

erb :'/deck/show2'
end

get '/:user_id/stats' do
  @rounds = Round.order(id: :desc)  
  
 
erb :'user/stat'
end