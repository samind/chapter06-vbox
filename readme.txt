
・nginxのインストール

・php-fpmのインストール

・nginxとphp-fpmの連携
 list
  6-9 nginxのテンプレートファイル
  6-10 recipeにテンプレートを読み込む設定を追加
  6-11 Attributeを使用してphpに関する設定ファイルを読み込むかどうかの制御をしている
  6-12 nginxのphpに関する設定を有効にするためにVagrantfileを修正

・OPcaheの導入
 list
  6-13 phpのpackageリソースの配列にphp-pecl-zendopcacheを追加する
  
・php55を導入
 list
  6-16 入門ではリソースyum_repositoryにより、yumでremiを有効にしているが、yum_repositoryが動作しなかったので、配列のphpをphp55に変更して対処した(php55.rb)

・ruby環境の構築
 list
  6-18
  6-23 rbenv + ruby-build + rubyｲﾝｽﾄｰﾙ 

　　※最後のrubyインストール時にhttp_proxyの定義が必要な為にrecipe(env-proxy)を追加。
　　　attributes
      /////////////////////////////////////////////////////////////////////////
       default["env-proxy"]["proxy"] = "http://proxy2.xxxxxcom.co.jp:8080"
      /////////////////////////////////////////////////////////////////////////
      recipes/default.rb 以下をexecuteの直前に追記。
      /////////////////////////////////////////////////////////////////////////
      proxy = node['env-proxy']['proxy']
 
      bash "proxy on profile" do
        not_if { proxy.empty? }
        code <<-EOC
        echo "export http_proxy=#{proxy}" >> /etc/profile
        echo "export https_proxy=#{proxy}" >> /etc/profile
        source /etc/profile
       EOC
      end
      /////////////////////////////////////////////////////////////////////////


・Unicornの追加
 list
  6-24 ruby-env/recipes/default.erbに追記
  6-25 Unicornでnginxが使えるようにするためにnginx.conf用のテンプレート編集
  
P165の最後、gem install rails -V まで実行　←たぶん20分くらいかかった。vagrant haltしておく。
