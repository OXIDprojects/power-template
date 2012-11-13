    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_LongRunHeader">
        [{ oxmultilang ident="START_LONGRUNNINGHITS" }]
      </strong>
      [{if $SHOW_MARQUEE_LONGRUNS}]
      <div align="center">[{ oxmultilang ident="TEXT_MARQUEE_STOP" }]<br/><br/></div>
      <marquee behavior= "scroll" direction= "up" class="scroll_marquee" scrollamount= "2" scrolldelay= "70"
        onmouseover='this.stop()' onmouseout='this.start()' height="250">
      [{/if}]
      <div class="box">
          <div>[{include file="inc/longrun_items.tpl"}]</div>
      </div>
      [{if $SHOW_MARQUEE_LONGRUNS}]
      </marquee>
      [{/if}]
    </div>
