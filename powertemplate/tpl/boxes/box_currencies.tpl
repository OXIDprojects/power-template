    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
        <div class="bar links">
          [{foreach from = $oxcmp_cur item = _currency name=curr}]
          <a id="test_Curr_[{$_currency->name}]" class="currency[{if $smarty.foreach.curr.first}] sep[{/if}][{if $_currency->selected}] act[{/if}]" href="[{ oxgetseourl ident=$_currency->link params="listtype=`$sListType`" }]" rel="nofollow">[{ $_currency->name }]</a>
          [{/foreach}]
        </div>
    </div>