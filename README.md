![KomuWin movie](https://user-images.githubusercontent.com/65106886/108201182-d2111280-7162-11eb-838f-c5056142aabc.jpg)

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

## ユーザー認証
### 新規登録
未ログイン時のナビバーにある` 新規登録 `ボタンをクリックすると、新規登録画面に遷移します。
なお、本アプリは実際にリリース、運用することを見据えて作成し、実際に運用しました。そのため、その際にコミュニケーションツールとして使用したslackのコミュニティに参加しているユーザーのslack idと一致した場合のみ、新規登録ができるようになっています。
### ログイン
未ログイン時のナビバーにある` ログイン `ボタンをクリックすると、ログイン画面に遷移します。
### ログアウト
ログイン後に表示されるナビバーからから` ログアウト `をクリックすることでログアウトできます。
### メールアドレス変更
ログイン後に表示されるナビバーから` アカウント編集 `をクリックするとメールアドレス変更画面に遷移します。

## テキスト教材

ログイン後に表示されるナビバーからから` テキスト教材 `をクリックすることでテキスト教材ページに遷移します。

<img width="1789" alt="Screenshot at Feb 17 21-52-50" src="https://user-images.githubusercontent.com/65106886/108211577-3090bd80-7170-11eb-9a6c-04e10f5181a0.png">

## 動画教材

ログイン後に表示されるナビバーからから` 動画教材 `をクリックすることで動画教材ページに遷移します。

<img width="1791" alt="movie" src="https://user-images.githubusercontent.com/65106886/108211821-84030b80-7170-11eb-86bb-6248fd2a3f43.png">

## 面接シート

ログイン後に表示されるナビバーからから` 面接シート `をクリックすることで面接シートページに遷移します。
内定者の面接シートや3分間プレゼンテーションの資料を見ることができます。
検索フォームでは非同期での検索機能ができるようになっています。

<img width="1791" alt="interview sheet" src="https://user-images.githubusercontent.com/65106886/108211911-a09f4380-7170-11eb-8ffc-502937241419.png">

![demo](https://gyazo.com/47b6bfcc07e9e8aeec8a33cc6f977a82/raw)

## 想定質問

ログイン後に表示されるナビバーからから` 想定質問ノック `をクリックすることで想定質問作成ページに遷移します。
想定質問の内容と質問に対する回答を書き込むことができます。
また、書き込んだ内容については編集することも可能です。
なお、このページは他の人からは見ることができないようになっています。

<img width="1791" alt="expected question" src="https://user-images.githubusercontent.com/65106886/108212204-f116a100-7170-11eb-8291-df03f8c57593.png">

## 添削

ログイン後に表示されるナビバーからから` 添削 `をクリックすることで添削ページに遷移します。
添削してもらいたい文章を入力して添削申請ボタンを押すと、添削申請ができます。
添削申請後は申請した提出書類名が一覧表示され、クリックすると詳細画面に遷移します。
詳細画面では申請者本人のみ、内容の編集や削除が可能です。
また、添削者は詳細画面の添削者専用フォームから添削内容を入力できます。

<img width="1791" alt="document" src="https://user-images.githubusercontent.com/65106886/108212720-93cf1f80-7171-11eb-83e5-2bd692dd75ee.png">

![correction](https://user-images.githubusercontent.com/65106886/108213339-3f786f80-7172-11eb-8391-ba901f03fd35.png)

<img width="1792" alt="correction form" src="https://user-images.githubusercontent.com/65106886/108213488-6df64a80-7172-11eb-91e5-7a13aba43a0f.png">


# 環境
- Ruby 2.6.6
- Rails 6.0.3.3
