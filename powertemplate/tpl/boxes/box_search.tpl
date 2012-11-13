    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2 search">[{ oxmultilang ident="INC_LEFTITEM_PRODUCTSEARCH" }]</strong>
      <form action="[{ $oViewConf->getBaseDir() }]index.php" method="get" class="search" id="f.search">
          <p>
              [{ $oViewConf->getHiddenSid() }]
              <input type="hidden" name="cl" value="search">
              <input type="text" name="searchparam" value="[{$searchparamforhtml}]" size="21" id="f.search.param" class="txt">

              [{if $oView->getSearchCatTree() }]
              <select id="test_searchCategorySelect" class="search_input" name="searchcnid" [{if $oViewConf->isAutoSearchOnCat() }]onchange="oxid.search('f.search','f.search.param');"[{/if}]>
                  <option value=""> [{ oxmultilang ident="INC_SEARCHLEFTITEM_ALLCATEGORIES" }] </option>
                  [{include file="inc/category_options.tpl" tree=$oView->getSearchCatTree() sSpacer=""}]
              </select>
              [{/if}]

              [{if $oView->getVendorlist() }]
              <select id="test_searchVendorSelect" class="search_input" name="searchvendor">
                  <option value=""> [{ oxmultilang ident="INC_SEARCHLEFTITEM_ALLDISTRIBUTORS" }] </option>
                  [{foreach from=$oView->getVendorlist() item=oVendorlistentry}]
                      <option value="[{$oVendorlistentry->oxvendor__oxid->value}]"[{if $searchvendor == $oVendorlistentry->oxvendor__oxid->value}] selected[{/if}]>[{ $oVendorlistentry->oxvendor__oxtitle->value }][{ if $oVendorlistentry->getNrOfArticles() > 0 }] ([{$oVendorlistentry->getNrOfArticles()}])[{/if}]</option>
                  [{/foreach}]
              </select>
              [{/if}]

              [{if $oView->getManufacturerlist() }]
              <select id="test_searchManufacturerSelect" class="search_input" name="searchmanufacturer">
                  <option value=""> [{ oxmultilang ident="INC_SEARCHLEFTITEM_ALLMANUFACTURERS" }] </option>
                  [{foreach from=$oView->getManufacturerlist() item=oManufacturerlistentry}]
                      <option value="[{$oManufacturerlistentry->oxmanufacturers__oxid->value}]"[{if $searchmanufacturer == $oManufacturerlistentry->oxmanufacturers__oxid->value}] selected[{/if}]>[{ $oManufacturerlistentry->oxmanufacturers__oxtitle->value }][{ if $oManufacturerlistentry->getNrOfArticles() > 0 }] ([{$oManufacturerlistentry->getNrOfArticles()}])[{/if}]</option>
                  [{/foreach}]
              </select>
              [{/if}]

              <span class="btn">
                <input id="test_searchGo" type="submit" class="btn" value="GO!" title="[{ oxmultilang ident="ACCOUNT_WISHLIST_SEARCH" }]"> 
              </span>
          </p>
      </form>
    </div>