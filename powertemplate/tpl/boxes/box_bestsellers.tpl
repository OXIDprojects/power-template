    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_RightSideTop5Header">
          [{ oxmultilang ident="INC_RIGHTITEM_TOPOFTHESHOP" }]
          [{if $rsslinks.topArticles}]
              <a class="rss" id="rss.topArticles" href="[{$rsslinks.topArticles.link}]" title="[{$rsslinks.topArticles.title}]"></a>
              [{oxscript add="oxid.blank('rss.topArticles');"}]
          [{/if}]
      </strong>
      <div class="box">
          <div>[{include file="inc/top_items.tpl" }]</div>
      </div>
    </div>