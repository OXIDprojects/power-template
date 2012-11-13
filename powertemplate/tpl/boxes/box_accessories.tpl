    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_RightSideAccessoiresHeader">[{ oxmultilang ident="INC_RIGHTITEM_ACCESSORIES" }]</strong>
      <div class="box">
          <div>[{include file="inc/rightlist.tpl" list=$oView->getAccessoires() altproduct=$product test_Type=accessoire}]</div>
      </div>
    </div>