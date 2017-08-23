class PlayersController < ApplicationController
  before_action :load_player, only: %i[show edit update]

  def index
    @players = Player.recents
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      flash[:success] = I18n.translate 'crud.create.success'
      redirect_to players_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @player.update(player_params)
      flash[:success] = I18n.translate 'crud.edit.success'
      redirect_to players_path
    else
      flash[:notice] = I18n.translate 'crud.edit.fail'
      render :edit
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :nick_name)
  end

  def load_player
    @player = Player.find(params[:id]).decorate
  end
end
