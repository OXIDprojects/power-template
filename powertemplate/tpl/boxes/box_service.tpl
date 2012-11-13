    <div id="[{$box_id}]" class="[{$box_navigation_area}] [{$box_id}]">
      <dl class="box service">
          <dt id="tm.service.dd">[{ oxmultilang ident="INC_HEADER_SERVICE" }]</dt>
          <dd>
              [{strip}]
              <ul>
                  <li><a id="test_link_service_contact" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact" }]" rel="nofollow">[{ oxmultilang ident="INC_HEADER_CONTACT" }]</a></li>
                  <li><a id="test_link_service_help" href="[{ oxgetseourl ident=$oViewConf->getHelpLink() }]" rel="nofollow">[{ oxmultilang ident="INC_HEADER_HELP" }]</a></li>
                  <li><a id="test_link_service_links" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links" }]">[{ oxmultilang ident="INC_HEADER_LINKS" }]</a></li>
                  <li><a id="test_link_service_guestbook" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=guestbook" }]" rel="nofollow">[{ oxmultilang ident="INC_HEADER_GUESTBOOK" }]</a></li>
              </ul>
              [{/strip}]
          </dd>
      </dl>
    </div>