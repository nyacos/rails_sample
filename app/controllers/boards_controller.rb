class BoardsController < ApplicationController
  def index
    # Boardの一覧画面では全ての掲示板情報を一覧で表示したい
    @boards = Board.all
  end

  def new
    # Boardの新規作成画面ではBoardのからのインスタンスをViewに渡したい
    @boards = Board.new
  end

  def show
    # Boardの詳細画面ではURLパラメーターから取得したBoardのインスタンスが必要
    @boards = Board.find(params[:id])
  end

  def edit
    # Boardの編集画面ではURLパラメーターから取得したBoardのインスタンスが必要
    @boards = Board.find(params[:id])
  end
end
