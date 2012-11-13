    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <div id="path">
        [{ oxmultilang ident="INC_HEADER_YOUAREHERE" }] / [{ $location }]
        [{if $isStart}]
          [{assign var="oCont" value=$oView->getContentByIdent("oxdeliveryinfo") }]
          <a rel="nofollow" class="dinfo" href="[{ $oCont->getLink() }]">[{ oxmultilang ident="INC_HEADER_INCLTAXPLUSSHIPPING" }]</a>
        [{/if}]
      </div>
    </div>