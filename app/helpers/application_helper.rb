module ApplicationHelper

  # ページごとにタイトルを返す
  def full_title(page_name = "") # メソッドと引数の定義
    base_title = "A-AttendanceApp" # 基本となるアプリケーション名を変数に代入
    if page_name.empty? # 引数を受け取っているか判定
      base_title # 引数page_nameが空文字の場合はbase_titleのみ返す
    else # 引数page_nameが空文字ではない場合
      page_name + " | " + base_title # 文字列を連結して返す
    end
  end
  
  # def h1_title(search_name)
  #   return "ユーザー一覧" if search_name == User.all
  #   return "検索結果一覧" unless search_name == User.all
  # end
end