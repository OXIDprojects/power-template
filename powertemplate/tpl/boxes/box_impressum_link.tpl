    <span id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      [{assign var="oCont" value=$oView->getContentByIdent("oximpressum") }]
      <a id="test_HeaderImpressum" href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a>
    </span>