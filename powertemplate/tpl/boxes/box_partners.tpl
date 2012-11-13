    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <strong class="h2" id="test_LeftSidePartnersHeader">[{ oxmultilang ident="INC_LEFTITEM_PARTNERANDSEAL" }]</strong>
      <div class="partners">
          <div class="logo">
            [{include file="inc/trustedshops_item.tpl"}]
          </div>
          <div class="logo">
              <a href="http://www.zend.com" id="link.zendSite"><img src="[{$oViewConf->getImageUrl()}]zend_logo.gif" alt=""></a>
              [{oxscript add="oxid.blank('link.zendSite');"}]
          </div>
      </div>
    </div>