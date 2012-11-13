    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_RightSideCrossListHeader">[{ oxmultilang ident="INC_RIGHTITEM_HAVEPOUSEEN" }]</strong>
      <div class="box">
          <div>[{include file="inc/rightlist.tpl" list=$oView->getCrossSelling() altproduct=$product test_Type=cross}]</div>
      </div>
    </div>