    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <div class="bar links">
          [{assign var="oCont" value=$oView->getContentByIdent("oxagb") }]
          <a id="test_HeaderTerms" href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a>
          [{assign var="oCont" value=$oView->getContentByIdent("oximpressum") }]
          <a id="test_HeaderImpressum" href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a>
          [{if $oView->getMenueList()}]
            [{ foreach from=$oView->getMenueList() item=oMenueContent }]
              <a href="[{ $oViewConf->getSelfLink() }]cl=content&amp;oxcid=[{$oMenueContent->oxcontents__oxid->value}]">[{$oMenueContent->oxcontents__oxtitle->value}]</a>
            [{/foreach}]
          [{/if}]
          <div class="clear"></div>
      </div>
    </div>