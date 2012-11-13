        <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
          <img id="footer_image" alt="" src="[{$tpl_path}]img/img_footer.jpg"/>
          [{assign var="oCont" value=$oView->getContentByIdent("oxdeliveryinfo") }]
          <a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_INCLTAXANDPLUSSHIPPING" }]</a>
          <div class="bar shop">
              <a id="test_link_footer_home" href="[{ oxgetseourl ident=$oViewConf->getHomeLink() }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_HOME" }]</a> |
              <a id="test_link_footer_contact" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact" }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_CONTACT" }]</a> |
              <a id="test_link_footer_help" href="[{ oxgetseourl ident=$oViewConf->getHelpLink() }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_HELP" }]</a> |
              <a id="test_link_footer_guestbook" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=guestbook" }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_GUESTBOOK" }]</a> |
              <a id="test_link_footer_links" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links" }]">[{ oxmultilang ident="INC_FOOTER_LINKS" }]</a> |
              [{assign var="oCont" value=$oView->getContentByIdent("oximpressum") }]
              <a id="test_link_footer_impressum" href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a> |
              [{assign var="oCont" value=$oView->getContentByIdent("oxagb") }]
              <a id="test_link_footer_terms" href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a> |
              <br>
              [{oxhasrights ident="TOBASKET"}]
              <a id="test_link_footer_basket" href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_CART" }]</a> |
              [{/oxhasrights}]
              <a id="test_link_footer_account" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_MYACCOUNT" }]</a> |
              <a id="test_link_footer_noticelist" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]" rel="nofollow"> [{ oxmultilang ident="INC_FOOTER_MYNOTICELIST" }]</a>
                | <a id="test_link_footer_wishlist" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" }]" rel="nofollow"> [{ oxmultilang ident="INC_FOOTER_MYWISHLIST" }]</a>
                | <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid="|cat:$wishid }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_PUBLICWISHLIST" }]</a>
          </div>
          <div class="clear"></div>
          <div class="poweredby" style="text-align:center">
            <div class="shop_copy_right" style="text-align:center">
              Copyright &copy; <strong>[{$oxcmp_shop->oxshops__oxtitleprefix->value}]</strong> | [{ oxmultilang ident="INC_FOOTER_RIGHTS" }]<br/>
                  [{ oxmultilang ident="INC_FOOTER_ERRORS" }]<br/>
                  [{ oxmultilang ident="INC_FOOTER_TRADEMARKS" }]
              <br/><br/>
              <div class="oxid_copyright">
                &copy; <a href="http://www.oxid-esales.com">[{ oxmultilang ident="INC_FOOTER_SOFTWAREFROMOXIDESALES" }]</a>
              </div>
            </div>
            <br/>
          </div>
        </div>
