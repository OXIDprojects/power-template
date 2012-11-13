    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_FreshInHeader">
      [{ oxmultilang ident="START_JUSTARRIVED" }]
      [{if $rsslinks.newestArticles}]
          <a class="rss" id="rss.newestArticles" href="[{$rsslinks.newestArticles.link}]" title="[{$rsslinks.newestArticles.title}]"></a>
          [{oxscript add="oxid.blank('rss.newestArticles');"}]
      [{/if}]
      </strong>
      [{if $SHOW_MARQUEE_WHATSNEW}]
      <div align="center">[{ oxmultilang ident="TEXT_MARQUEE_STOP" }]<br/><br/></div>
      <marquee behavior= "scroll" direction= "up" class="scroll_marquee" scrollamount= "2" scrolldelay= "70"
        onmouseover='this.stop()' onmouseout='this.start()' height="250">
      [{/if}]
        <div class="box">
          <div>[{include file="inc/new_items.tpl" }]</div>
        </div>
      [{if $SHOW_MARQUEE_WHATSNEW}]
      </marquee>
      [{/if}]
    </div>