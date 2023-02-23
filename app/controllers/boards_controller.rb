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

  def create
    # POSTリクエストのボディからパラメーターを取得してBaordのインスタンスを作成したい
    @board = Board.new(board_params)

    # ActionRecordのsaveメソッドを実行して結果によって処理を分岐させたい
    if @board.save
      # 処理が成功した場合、リダイレクトでshowアクションを実行させたい
      redirect_to @board, notice: '掲示板が作成されました。'
    else
      # 処理が失敗した場合、@boardの内容を踏まえてnewテンプレートを表示させたい
      render :new
    end
  end

  def update
    # 編集対象のBoardインスタンスが必要
    @board = Board.find(params:[id])

    # ActionRecordのupdateメソッドを実行して結果によって処理を分岐させたい
    if @board.update(board_params)
      # 処理が成功した場合、リダイレクトでshowアクションを実行させたい
      redirect_to @board, notice: 'Board wos successfully updated.'
    else
      # 処理が失敗した場合、@boardの内容を踏まえてeditテンプレートを表示させたい
      render :edit
    end
  end

  def destroy
    # 削除対象Boardインスタンスが必要
    @board = Board.find(params[id])

    # ActiveRecordのdestoyメソッドを実行
    @board.destroy
    # 処理が完了した後は、リダイレクトでindexアクションを実行させたい
    redirect_to board_url, notice: 'Board was successfully destroyed.'
  end

  private

  # Boardのパラメータ取得ようにストロングパラメーターを使ったメソッドを定義
  def board_params
    params.require(:board).permit(:title, :body)
  end
end
