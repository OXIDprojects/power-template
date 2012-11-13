    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <div class="bar links">
          [{foreach from = $oxcmp_lang item = _language}]
          <a id="test_Lang_[{$_language->name}]" class="language[{if $_language->selected}] act[{/if}]" href="[{ oxgetseourl ident=$_language->link params=$oView->getDynUrlParams() }]" hreflang="[{ $_language->abbr }]" title="[{ $_language->name }]"><img src="[{$oViewConf->getImageUrl()}]lang/[{ $_language->abbr }].gif" alt="[{$_language->name}]"></a>
          [{/foreach}]
        </div>
    </div>