    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2"><a id="test_RightSideAccountHeader" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]">[{ oxmultilang ident="INC_RIGHTITEM_MYACCOUNT" }]</a></strong>
      <div class="box">
          [{oxid_include_dynamic file="dyn/cmp_login_right.tpl" type="login" pgnr=$pageNavigation->actPage tpl=$tpl additional_form_parameters="`$AdditionalFormParameters`"|cat:$oViewConf->getNavFormParams() }]
          [{oxid_include_dynamic file="dyn/cmp_login_links.tpl" type="login_links"}]
      </div>
    </div>