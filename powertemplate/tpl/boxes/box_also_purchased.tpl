    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_RightSideCustWhoHeader">[{ oxmultilang ident="INC_RIGHTITEM_CUSTOMERWHO" }]</strong>
      <div class="box">
          <div>[{include file="inc/rightlist.tpl" list=$oView->getAlsoBoughtThiesProducts() altproduct=$product test_Type=customerwho}]</div>
      </div>
    </div>