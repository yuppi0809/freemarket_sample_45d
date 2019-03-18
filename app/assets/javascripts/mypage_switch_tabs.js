$(document).on('turbolinks:load', function(){

//上のボックス(おしらせ/やることリスト)のタブ要素などを取得
  var topTabsContent = $(".my-page-right-content__main");
  var topTabs = $(".my-page-right-content__tabs").find(".tab")

//下のボックス(購入した商品)のタブ要素などを取得
  var bottomTabsContent = $(".my-page-right-content__bottom__main");
  var bottomTabs = $(".my-page-right-content__bottom__tabs").find(".tab")

  function displayTabContent(tabContents, tabs, index){
  //タブコンテンツを全て隠し、タブからはactiveクラスを取る
    tabContents.css("display", "none");
    tabs.removeClass("active");
  //クリックされたタブにactiveクラスを付与し、それと対応するコンテンツを表示させる
    $(tabContents[index]).css("display", "block");
    $(tabs[index]).addClass("active");
  }

  //ページがロードされた時に、一番左のタブとコンテンツを表示させる
  displayTabContent(topTabsContent, topTabs,0);
  displayTabContent(bottomTabsContent, bottomTabs, 0);

//上のボックス：タブがクリックされたら対応するコンテンツを表示させる
  topTabs.on("click", function(){
    var tabIndex = $(this).index();
    displayTabContent(topTabsContent, topTabs, tabIndex);
  })

//下のボックス：タブがクリックされたら対応するコンテンツを表示させる
  bottomTabs.on("click", function(){
    var tabIndex = $(this).index();
    displayTabContent(bottomTabsContent, bottomTabs, tabIndex);
  })

});
