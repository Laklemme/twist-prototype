class PlaySessionsController < ApplicationController
  before_action :set_play_session, only: :show
  before_action :set_play_session_for_reward, only: %i[options reward]
  before_action :get_coins, only: %i[show reward]

  def create
    @play_session = PlaySession.new
    @play_session.user = current_user
    @play_session.game = Game.find(params[:game_id])
    # @play_session.completed = true
    @play_session.save
    # if @play_session.save
    #   flash[:notice] = ''
    # end
    redirect_to play_session_path(@play_session)
  end

  def show; end

  def update; end

  def options
    @get_counter = $redis.get("user_id[#{current_user.id}]")
    set_redis_counter
    @play_session.update(completed: true)
    @balance = @play_session.user.balance
    @balance = 0 if @balance.nil?
    @balance += case @play_session.game.difficulty
                when 'easy' then 1
                when 'medium' then 3
                when 'hard' then 5
                end
    @play_session.user.update(balance: @balance)
  end

  def reward
    @counter = JSON.parse($redis.get("user_id[#{current_user.id}]"))["coins"]
  end

  private

  def set_play_session_for_reward
    @play_session = PlaySession.find(params[:play_session_id])
  end

  def set_play_session
    @play_session = PlaySession.find(params[:id])
  end

  def set_redis_counter
    number = @get_counter.nil? ? 0 : JSON.parse(@get_counter)["coins"]
    number += case @play_session.game.difficulty
                when 'easy' then 1
                when 'medium' then 3
                when 'hard' then 5
                end
    $redis.set("user_id[#{current_user.id}]", { coins: number }.to_json, ex: 6000)
  end

  def get_coins
    @coins = case @play_session.game.difficulty
             when 'easy' then 1
             when 'medium' then 3
             when 'hard' then 5
             end
  end
end
