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
    @play_sessions_count = @play_session.game.play_sessions.where(user: current_user).count
    @repetition_streaks = @play_session.game.repetition_streak(current_user)
    flash.now[:notice] =  if @play_sessions_count.to_i == @repetition_streaks.to_i
                            "Wow! Streak of #{@play_sessions_count}! 🎉 You just earned 5 more coins!"
                          else
                            "You played this game #{@play_sessions_count} time(s).
                            Play #{@repetition_streaks.to_i - @play_sessions_count.to_i} more time(s) to get a streak!"
                          end

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
    check_repetition_streak(@play_sessions_count, @repetition_streak)
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
    @number = @get_counter.nil? ? 0 : JSON.parse(@get_counter)["coins"]
    @play_sessions_count = @play_session.game.play_sessions.where(user: current_user).count
    @repetition_streaks = @play_session.game.repetition_streak(current_user)
    @number += case @play_session.game.difficulty
               when 'easy' then 1
               when 'medium' then 3
               when 'hard' then 5
              end
    check_repetition_streak_redis(@play_sessions_count, @repetition_streaks)
    $redis.set("user_id[#{current_user.id}]", { coins: @number }.to_json, ex: 86_400)
  end

  def get_coins
    @coins = case @play_session.game.difficulty
             when 'easy' then 1
             when 'medium' then 3
             when 'hard' then 5
             end
  end

  def check_repetition_streak(play_sessions_count, repetition_streaks)
    if play_sessions_count.to_i == repetition_streaks.to_i
      @balance += 5
    end
  end

  def check_repetition_streak_redis(play_sessions_count, repetition_streaks)
    if play_sessions_count.to_i == repetition_streaks.to_i
      @number += 5
    end
  end
end
