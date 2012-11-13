    <span id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      [{assign var="oCont" value=$oView->getContentByIdent("oxagb") }]
      <a id="test_HeaderTerms" href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a>
    </span>