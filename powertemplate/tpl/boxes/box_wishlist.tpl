    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
        <div class="bar links">
          <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" }]" class="">[{ $oView->getWishlistName() }][{ oxmultilang ident="INC_HEADER_PRIVATWISHLIST" }]</a>
          [{/foreach}]
        </div>
    </div>