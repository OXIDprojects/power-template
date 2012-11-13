  [{foreach from=$oView->getArticleList() item=_product}]
  <div class="listitem" align="center">
    [{ assign var="sLongRunArtTitle" value="`$_product->oxarticles__oxtitle->value` `$_product->oxarticles__oxvarselect->value`" }]
    <a id="test_LongRunPic_[{$_product->oxarticles__oxid->value}]" href="[{$_product->getLink()}]" class="picture">
        <img src="[{$_product->getThumbnailUrl()}]" alt="[{ $sLongRunArtTitle|strip_tags }]">
    </a>
    <br/><br/>
    <a id="test_LongRunTitle_[{$_product->oxarticles__oxid->value}]" href="[{$_product->getLink()}]" class="title">[{ $sLongRunArtTitle|strip_tags}]</a>
    [{oxhasrights ident="SHOWARTICLEPRICE"}]
    [{if $_product->getFPrice()}]
    <br/><br/>
    [{assign var="currency" value=$oView->getActCurrency() }]
    <b id="test_LongRunPrice_[{$_product->oxarticles__oxid->value}]">[{ $_product->getFPrice() }] [{ $currency->sign}]
      <a href="#delivery_link" rel="nofollow"></a> *</b>
    [{/if}]
    <br/><br/>
    [{/oxhasrights}]
   </div>
  [{/foreach}]
