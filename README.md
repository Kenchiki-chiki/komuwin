

# 概要
特別区人事委員会採用試験の提出書類の作成や面接対策をサポートするための教材アプリです。オンライン上で面接対策のテキストと動画を見ることや面接書類の添削申請、想定問答集の作成ができます。

# 制作背景
以下の２点を背景として作成しました。
- コロナウイルスの蔓延と試験の延期に伴い、例年より大幅に就職活動期間が長引いている特別区受験生に対して、現役の特別区公務員という立場から少しでもできることをしたいと思ったため
- 私が就活生だった頃は以下のような状況であり、過去の自分と同様に本サービスを必要としている人が多く存在すると考えたため
  -  現役の公務員と関わる機会がない
  -  オンラインで公務員試験の書類作成や面接対策をサポートする講座がない
  -  面接対策のためだけに予備校を利用すると、模擬面接や面接シートの添削をするだけでも多額の費用がかかってしまう


# URL

# テストユーザーアカウント
email：komuwin@example.com
password：komuwin

# 機能一覧

- **ユーザー登録関連**(devise,slack-notifier,slack-ruby-client)
    - 新規登録機能
        - Slack API による Slack ID 判定
    - ログイン、ログアウト機能
    - メールアドレス変更機能

- **テキスト教材関連**(markdown,rake,CSVインポート)
    - テキスト教材の一覧表示機能
    - テキスト教材の詳細表示機能

- **動画教材関連**(CSVインポート機能)
    - youtube動画の一覧表示機能

- **面接シート関連**
    - 面接シートの一覧表示機能
    - 面接シートの詳細表示機能
    - 非同期検索機能

- **想定質問設定関連**(markdown,CSVインポート)
    - 想定質問の一覧表示機能
    - 想定質問の詳細表示機能
    - 想定質問の編集機能
    
- **添削関連**(markdown)
    - 面接書類の添削申請機能
        - 申請日と申請者の表示
    - 面接書類の編集、削除機能
    - 面接書類の添削機能

- **管理者関連**(activeadmin)
    - 管理者ユーザー、ユーザー、テキスト教材、動画教材、面接シート、想定質問、添削申請書類、添削書類へのCRUD機能

- **カレンダー関連**(googleカレンダー)
    - googleカレンダーの表示機能
        - 試験日程の表示

- **その他**
    - フラッシュメッセージ機能
    - エラーメッセージ機能
    - バリデーション機能
    - ログイン前後のリダイレクト機能

# テーブル

## usersテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|email  |string  |null: false  |
|password  |string  |null: false  |
|username  |string  | |
|slack_id  |string  | |


## textsテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|title  |string  | |
|content  |text  | |

## expected_questionsテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|title  |string  | |
|content  |text  | |
|user_id  |bigint  |null: false, foreign_key:true  |

## moviesテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|title  |string  | |
|url  |string  | |

## interview_sheetsテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|title  |string  | |
|content  |text  | |
|genre  |string  | |

## documentsテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|title  |string  | |
|content  |text  | |
|user_id  |bigint  |null: false, foreign_key:true  |

## correctionsテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|content  |text  | |
|user_id  |bigint  |null: false, foreign_key:true  |
|document_id  |bigint  |null: false, foreign_key:true  |

# 使い方


- ログインユーザーのみ閲覧可能


# 環境
Ruby 2.6.6
Rails 6.0.3.3
