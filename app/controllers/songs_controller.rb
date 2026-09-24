class SongsController < ApplicationController

  def index
    @songs = Song.all
  end


  def new
    @song = Song.new
  end


  def create
    @song = Song.new(song_params)

    if @song.save
      flash[:notice] = "曲を登録しました。"
      redirect_to @song
    else
      flash.now[:alert] = "入力内容にエラーがあります。"
      render :new, status: :unprocessable_entity
    end
  end


  def show
    @song = Song.find(params[:id])
  end


  def edit
    @song = Song.find(params[:id])
  end


  def update
    @song = Song.find(params[:id])

    if @song.update(song_params)
      flash[:notice] = "曲の情報を更新しました。"
      redirect_to @song
    else
      flash.now[:alert] = "入力内容にエラーがあります。"
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    flash[:notice] = "曲を削除しました。"
    redirect_to songs_path
  end

  private


  def song_params
    params.require(:song).permit(:title, :artist, :genre)
  end

end