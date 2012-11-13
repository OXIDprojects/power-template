    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_RightSideBarGainHeader">
        [{ oxmultilang ident="INC_RIGHTITEM_BARGAIN" }]
        [{if $rsslinks.bargainArticles}]
        <a class="rss" id="rss.bargainArticles" href="[{$rsslinks.bargainArticles.link}]" title="[{$rsslinks.bargainArticles.title}]"></a>
        [{oxscript add="oxid.blank('rss.bargainArticles');"}]
        [{/if}]
      </strong>
      [{if $SHOW_MARQUEE_SPECIALS}]
      <div align="center">[{ oxmultilang ident="TEXT_MARQUEE_STOP" }]<br/><br/></div>
      <marquee behavior= "scroll" direction= "up" class="scroll_marquee" scrollamount= "2" scrolldelay= "70"
        onmouseover='this.stop()' onmouseout='this.start()' height="250">
      [{/if}]
      <div class="box">
          <div>[{include file="inc/bargain_items.tpl"}]</div>
      </div>
      [{if $SHOW_MARQUEE_SPECIALS}]
      </marquee>
      [{/if}]
    </div>