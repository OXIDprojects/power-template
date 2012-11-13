  [{foreach from=$oView->getNewestArticles() item=_product}]
  <div class="listitem" align="center">
    [{ assign var="sNewArtTitle" value="`$_product->oxarticles__oxtitle->value` `$_product->oxarticles__oxvarselect->value`" }]
    <a id="test_NewPic_[{$_product->oxarticles__oxid->value}]" href="[{$_product->getLink()}]" class="picture">
        <img src="[{$_product->getThumbnailUrl()}]" alt="[{ $sNewArtTitle|strip_tags }]">
    </a>
    <br/><br/>
    <a id="test_NewTitle_[{$_product->oxarticles__oxid->value}]" href="[{$_product->getLink()}]" class="title">[{ $sNewArtTitle|strip_tags}]</a>
    [{oxhasrights ident="SHOWARTICLEPRICE"}]
    [{if $_product->getFPrice()}]
    <br/><br/>
    [{assign var="currency" value=$oView->getActCurrency() }]
    <b id="test_NewPrice_[{$_product->oxarticles__oxid->value}]">[{ $_product->getFPrice() }] [{ $currency->sign}]
      <a href="#delivery_link" rel="nofollow"></a> *</b>
    [{/if}]
    <br/><br/>
    [{/oxhasrights}]
   </div>
  [{/foreach}]
