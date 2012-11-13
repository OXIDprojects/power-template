    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_RightSideSimilListHeader">[{ oxmultilang ident="INC_RIGHTITEM_SIMILARPRODUCTS" }]</strong>
      <div class="box">
          <div>[{include file="inc/rightlist.tpl" list=$oView->getSimilarProducts() altproduct=$product test_Type=similarlist}]</div>
      </div>
    </div>