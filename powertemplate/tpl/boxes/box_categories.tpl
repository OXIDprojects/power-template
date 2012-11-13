    [{if $oxcmp_categories}]
    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2">[{ oxmultilang ident="INC_LEFTITEM_PRODUCTS" }]</strong>
      [{if $oView->showTopCatNavigation()}]
        [{include file="inc/category_tree.tpl" tree=$oxcmp_categories->getClickRoot() act=$oxcmp_categories->getClickCat() class="tree"}]
      [{else}]
        [{include file="inc/category_tree.tpl" tree=$oxcmp_categories act=$oxcmp_categories->getClickCat() class="tree" top_only=false}]
      [{/if}]
    </div>
    [{/if}]
    